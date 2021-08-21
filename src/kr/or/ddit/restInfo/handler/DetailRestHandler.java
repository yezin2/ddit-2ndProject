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

public class DetailRestHandler implements CommandHandler {
	private static final String VIEW_PAGE = "/WEB-INF/view/restaurant/restaurantDetail.jsp";

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		//식당 번호 가져오기
		String restCode = req.getParameter("restCode");
		System.out.println(restCode);
		String userId = req.getParameter("userId");
		System.out.println("userId : "+userId + "==");
		
		//서비스 호출
		IRestInfoService restService = RestInfoServiceImpl.getInstance();
		
		RestInfoVO rv = restService.getRest(restCode);
		int dipsCnt = restService.getUserAboutRest(restCode);
		List<RestFavVO> favList = restService.getRestAboutUser(userId);
		
		req.setAttribute("restVO", rv);
		req.setAttribute("dipsCnt", dipsCnt);
		req.setAttribute("favList", favList);
		
		// 리뷰 가져오기
		IReviewService reviewService = ReviewServiceImpl.getInstance();
		List<ReviewVO> reviewList = reviewService.restReview(restCode);
		
		req.setAttribute("reviewList", reviewList);
		
		return VIEW_PAGE;
	}
}
