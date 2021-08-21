package kr.or.ddit.review.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.restInfo.vo.RestInfoVO;
import kr.or.ddit.review.dao.IReviewDao;
import kr.or.ddit.review.dao.ReviewDaoImpl;
import kr.or.ddit.review.vo.ReviewVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class ReviewServiceImpl implements IReviewService{
	
	private IReviewDao reviewDao;
	private SqlMapClient smc;
	
	private static IReviewService reviewService;
	
	private ReviewServiceImpl() {
		reviewDao = ReviewDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static IReviewService getInstance() {
		if(reviewService == null) {
			reviewService = new ReviewServiceImpl();
		}
		return reviewService;
	}

	// 리뷰 작성
	@Override
	public int insertReview(ReviewVO review) {
		int cnt = 0;
		try {
			cnt = reviewDao.insertReview(smc, review);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	// 리뷰 수정
	@Override
	public int updateReview(ReviewVO review) {
		int cnt = 0;
		try {
			cnt = reviewDao.updateReview(smc, review);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	// 리뷰 삭제
	@Override
	public int deleteReview(long boardSeq) {
		int cnt = 0;
		try {
			cnt = reviewDao.deleteReview(smc, boardSeq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	// 리뷰 전체 조회
	@Override
	public List<ReviewVO> getAllReview() {
		List<ReviewVO> list = new ArrayList<>();
		try {
			list = reviewDao.getAllReview(smc);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return list;
	}

	// 리뷰-식당 전체 조회
	@Override
	public List<RestInfoVO> getRestInfo() {
		List<RestInfoVO> list = new ArrayList<>();
		try {
			list = reviewDao.getRestInfo(smc);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return list;
	}
	
	// 리뷰 선택시 리뷰 데이터 가져오는 용
	@Override
	public List<ReviewVO> restReview(String restCode) {
		List<ReviewVO> list = new ArrayList<>();
		try {
			list = reviewDao.restReview(smc, restCode);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return list;
	}

}
