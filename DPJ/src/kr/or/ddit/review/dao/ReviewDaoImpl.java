package kr.or.ddit.review.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.restInfo.vo.RestInfoVO;
import kr.or.ddit.review.vo.ReviewVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class ReviewDaoImpl implements IReviewDao{

	private static IReviewDao reviewDao;
	
	private ReviewDaoImpl() {
	}
	
	public static IReviewDao getInstance() {
		if(reviewDao == null) {
			reviewDao = new ReviewDaoImpl();
		}
		return reviewDao;
	}

	// 리뷰 입력
	@Override
	public int insertReview(SqlMapClient smc, ReviewVO review) throws SQLException {
		int cnt = 0;
		Object obj = smc.insert("review.insertReview", review);
		if(obj == null) {
			cnt = 1;
		}
		return cnt;
	}

	// 리뷰 수정
	@Override
	public int updateReview(SqlMapClient smc, ReviewVO review) throws SQLException {
		int cnt = (int)smc.update("review.updateReview",review);
		return cnt;
	}
	
	// 리뷰 삭제
	@Override
	public int deleteReview(SqlMapClient smc, long boardSeq) throws SQLException {
		int cnt = (int)smc.delete("review.deleteReview", boardSeq);
		return cnt;
	}

	// 리뷰 전체 조회
	@Override
	public List<ReviewVO> getAllReview(SqlMapClient smc) throws SQLException {
		List<ReviewVO> list = smc.queryForList("review.getAllReview");
		return list;
	}

	// 리뷰-식당 정보 전체 조회
	@Override
	public List<RestInfoVO> getRestInfo(SqlMapClient smc) throws SQLException {
		List<RestInfoVO> list = smc.queryForList("review.getRestInfo");
		return list;
	}

	// 선택 리뷰 조회
	@Override
	public List<ReviewVO> restReview(SqlMapClient smc, String restCode) throws SQLException {
		List<ReviewVO> list = smc.queryForList("review.restReview", restCode);
		return list;
	}

}
