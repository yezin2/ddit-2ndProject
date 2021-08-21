package kr.or.ddit.admin.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;

public class AdminMainHandler implements CommandHandler {
	private static final String VIEW_PAGE = "/WEB-INF/view/admin/adminMain.jsp";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		return VIEW_PAGE;
	}

}
