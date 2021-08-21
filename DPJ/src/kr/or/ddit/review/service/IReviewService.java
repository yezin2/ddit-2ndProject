package kr.or.ddit.review.service;

import java.util.List;

import kr.or.ddit.restInfo.vo.RestInfoVO;
import kr.or.ddit.review.vo.ReviewVO;

public interface IReviewService {
	public int insertReview(ReviewVO review);
	
	public int updateReview(ReviewVO review);
	
	public int deleteReview(long boardSeq);
	
	public List<ReviewVO> getAllReview();
	
	public List<RestInfoVO> getRestInfo();
	
	public List<ReviewVO> restReview(String restCode);
}
