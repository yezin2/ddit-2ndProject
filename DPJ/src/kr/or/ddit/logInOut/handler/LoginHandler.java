package kr.or.ddit.logInOut.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.userAll.service.IUserAllService;
import kr.or.ddit.userAll.service.UserAllServiceImpl;
import kr.or.ddit.userAll.vo.UserAllVO;
import kr.or.ddit.util.HashSha256Test;

/**
 * 로그인 페이지 이동과 로그인 시 로그인 세션 정보 저장 클래스
 * @author 유은지
 *
 */
public class LoginHandler implements CommandHandler {
	private static final String VIEW_PAGE = "/WEB-INF/view/login/loginForm.jsp";

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
			return VIEW_PAGE;
		}else {
			// 파라미터 가져오기
			UserAllVO userAllVo = new UserAllVO();
			BeanUtils.populate(userAllVo, req.getParameterMap());
			
			//비밀번호 암호화 메서드 호출
			String userPw = HashSha256Test.hashSha256(userAllVo.getUserPw());
			userAllVo.setUserPw(userPw);
		
			IUserAllService userAllService = UserAllServiceImpl.getInstance();
			userAllVo = userAllService.checkLoginUserAll(userAllVo);
			
			if(userAllVo != null) { // 회원이 존재하면
				HttpSession session = req.getSession(true); // 세션 생성
				
				String userId = userAllVo.getUserId();
				String userType = userAllVo.getUserType();
				String userPhoto = userAllVo.getUserPhoto();
				System.out.println("■" + userId);
				System.out.println("■" + userType);
				System.out.println("■" + userPhoto);
				
				session.setAttribute("USERID", userId);
				session.setAttribute("USERTYPE", userType);
				session.setAttribute("USERPHOTO", userPhoto);
				
				String visitFlag = "FALSE"; // true : 기존 방문 이력이 있음, false : 방문 이력이 없음
				
//				if(session.isNew()) { // 새로 만든 세션이라면 
//					visitFlag = "FALSE";
//					System.out.println("★★★★★"+visitFlag);
//				} else {
//					visitFlag = "TRUE";
//					System.out.println("★★★★★★"+visitFlag);
//				}
//				
				session.setAttribute("VISITFLAG", visitFlag);
				
				String redirectUrl = "";
				if("관리자".equals(userType)) {
					redirectUrl = req.getContextPath() + 
							"/admin/main.do?login=true";
				} else {
					// 게시글 목록으로 이동 (유저 정보를 가지고 있으므로 redirect)
					redirectUrl = req.getContextPath() + 
							"/main/main.do?login=true";
				}
				
				return redirectUrl;
			} else {
				String redirectUrl = req.getContextPath() + "/logInOut/login.do?login=false";
				return redirectUrl;
			}
		}
	}
}
