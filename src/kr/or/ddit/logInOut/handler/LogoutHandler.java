package kr.or.ddit.logInOut.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.common.handler.CommandHandler;

/**
 * 로그아웃 버튼 클릭 시 세션 정보를 없애고 로그아웃 처리하는 핸들러
 * @author 유은지
 *
 */
public class LogoutHandler implements CommandHandler{
	private static final String VIEW_PAGE = "/WEB-INF/view/login/loginForm.jsp";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession(true);
		
		String visitFlag = "FALSE"; // true : 기존 방문 이력이 있음, false : 방문 이력이 없음
		session.setAttribute("VISITFLAG", visitFlag);
		
		session.invalidate();
		// 게시글 목록으로 이동 (유저 정보를 가지고 있으므로 redirect)
		String redirectUrl = req.getContextPath() + 
				"/main/main.do";
		System.out.println("■redirect : " + redirectUrl);
		return redirectUrl;
	}
}
