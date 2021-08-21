package kr.or.ddit.mypage.handler;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.userDdit.service.IUserDditService;
import kr.or.ddit.userDdit.service.UserDditServiceImpl;
import kr.or.ddit.userDdit.vo.UserDditVO;

public class MyPageEditHandler implements CommandHandler {
	private static final String VIEW_PAGE = "/WEB-INF/view/myPage/myPageForm.jsp";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if("GET".equals(req.getMethod())) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if("GET".equals(req.getMethod())) {
			HttpSession session = req.getSession(true); // 세션 가져오기
			String userId = (String) session.getAttribute("USERID");
			System.out.println("userId : " + userId);
			
			// 서비스 객체 생성하기
			IUserDditService userDditService = UserDditServiceImpl.getInstance();
			
			// 회원 정보 조회
			UserDditVO userDdit = userDditService.getUserDdit(userId);
			
			req.setAttribute("userDdit", userDdit);
			
			return VIEW_PAGE;
		} else {
			// 세션에서 아이디 가져오기
			HttpSession session = req.getSession(true);
			String userId = (String) session.getAttribute("USERID");
			
			// 파라미터 가져오기
			String dditBir = req.getParameter("dditBir");
			String dditHp = req.getParameter("dditHp");
			String dditMail = req.getParameter("dditMail");
			String recvMail = req.getParameter("recvMail");
			String userPhoto = req.getParameter("userPhoto");
			
			
			
			UserDditVO userDditVo = new UserDditVO();
			BeanUtils.populate(userDditVo, req.getParameterMap());
			userDditVo.setUserId(userId);
			
			// 이메일 데이터 가공
			if(recvMail == null) {
				recvMail = "N";
			}else if("on".equals(recvMail)){
				recvMail = "Y";
			}
			
			userDditVo.setRecvMail(recvMail);
			
			// 서비스 호출
			IUserDditService userDditService = UserDditServiceImpl.getInstance();
			int cnt = userDditService.updateUserDdit(userDditVo);
			
			String msg = "";
			
			if(cnt > 0) {
				msg = "success";
			} else {
				msg = "failure";
			}
			
			session.setAttribute("USERPHOTO", userPhoto); // 세션에 사진 세팅
			
			// 화면 이동
			String redirectUrl = "";
			
			redirectUrl = req.getContextPath() + 
					"/mypage/main.do?msg=" 
					+ URLEncoder.encode(msg, "UTF-8");
			return redirectUrl;
		}
	}

}
