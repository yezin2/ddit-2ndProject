package kr.or.ddit.mypage.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.userDdit.service.IUserDditService;
import kr.or.ddit.userDdit.service.UserDditServiceImpl;
import kr.or.ddit.userDdit.vo.UserDditVO;

public class MyPageLoadHandler implements CommandHandler {
	private static final String VIEW_PAGE = "/WEB-INF/view/myPage/myPageMain.jsp";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession(true); // 세션 가져오기
		String userId = (String) session.getAttribute("USERID");
		System.out.println("userId : " + userId);
		
		// 서비스 객체 생성하기
		IUserDditService userDditService = UserDditServiceImpl.getInstance();
		
		// 회원 정보 조회
		UserDditVO userDdit = userDditService.getUserDdit(userId);
		
		req.setAttribute("userDdit", userDdit);
		
		return VIEW_PAGE;
	}

}
