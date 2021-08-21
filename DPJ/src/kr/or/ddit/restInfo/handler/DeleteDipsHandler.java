package kr.or.ddit.restInfo.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.restInfo.dao.RestInfoDaoImpl;
import kr.or.ddit.restInfo.service.IRestInfoService;
import kr.or.ddit.restInfo.service.RestInfoServiceImpl;
import kr.or.ddit.restInfo.vo.RestFavVO;
import kr.or.ddit.restInfo.vo.RestInfoVO;
import kr.or.ddit.review.service.IReviewService;
import kr.or.ddit.review.service.ReviewServiceImpl;
import kr.or.ddit.review.vo.ReviewVO;

public class DeleteDipsHandler implements CommandHandler {
	private static final String VIEW_PAGE = "/DPJ/searchRest/detailRest.do";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		//식당 번호 가져오기
		String restCode = req.getParameter("restCodefav");
		String userId = req.getParameter("userId");
		
		
		RestFavVO rfv = new RestFavVO();
		
		rfv.setRestCode(restCode);
		rfv.setUserId(userId);
		//서비스 호출
		IRestInfoService restService = RestInfoServiceImpl.getInstance();

		restService.deleteDips(rfv);
		
		// 리뷰 가져오기
//		IReviewService reviewService = ReviewServiceImpl.getInstance();
//		List<ReviewVO> reviewList = reviewService.restReview(restCode);
//		req.setAttribute("reviewList", reviewList);
		
		return VIEW_PAGE + "?restCode=" + restCode + "&userId=" + userId;
	}
}