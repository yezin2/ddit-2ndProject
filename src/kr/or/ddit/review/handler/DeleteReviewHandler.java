package kr.or.ddit.review.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.review.service.IReviewService;
import kr.or.ddit.review.service.ReviewServiceImpl;
import kr.or.ddit.review.vo.ReviewVO;

public class DeleteReviewHandler implements CommandHandler{

	@Override
	public boolean isRedirect(HttpServletRequest req) {
			return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		IReviewService reviewService = ReviewServiceImpl.getInstance();
		Long boardSeq = Long.parseLong(req.getParameter("boardSeq"));
		String userId = req.getParameter("userId");
		
		reviewService.deleteReview(boardSeq);
		String restCode = req.getParameter("restCode");
		String redirectUrl = req.getContextPath() + "/searchRest/detailRest.do?restCode=" + restCode + "&userId=" + userId;
		return redirectUrl;
	}
}