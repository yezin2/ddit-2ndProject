package kr.or.ddit.review.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.restInfo.vo.RestInfoVO;
import kr.or.ddit.review.vo.ReviewVO;
import kr.or.ddit.util.SqlMapClientUtil;

public interface IReviewDao {
	// 리뷰 작성
	public int insertReview(SqlMapClient smc, ReviewVO review) throws SQLException;

	// 리뷰 수정
	public int updateReview(SqlMapClient smc, ReviewVO review) throws SQLException;

	// 리뷰 삭제
	public int deleteReview(SqlMapClient smc, long boardSeq) throws SQLException;

	// 리뷰 전체조회?
	public List<ReviewVO> getAllReview(SqlMapClient smc) throws SQLException;

	// 리뷰식당 전체조회?
	public List<RestInfoVO> getRestInfo(SqlMapClient smc) throws SQLException;

	// 식당 리뷰 조회
	public List<ReviewVO> restReview(SqlMapClient smc, String restCode) throws SQLException;
}
