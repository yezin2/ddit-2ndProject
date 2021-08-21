package kr.or.ddit.review.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;

public class RestReviewHandler implements CommandHandler{
	private static final String VIEW_PAGE = "/WEB-INF/view/";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
			return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equals("GET")) {
			return VIEW_PAGE;
		}else {
			String redirectUrl = "";
			return redirectUrl;
		}
	}
	
}
