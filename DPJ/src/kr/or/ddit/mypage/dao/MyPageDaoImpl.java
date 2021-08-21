package kr.or.ddit.mypage.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.partyBoard.vo.PartyBoardVO;
import kr.or.ddit.qna.vo.QnABoardVO;
import kr.or.ddit.review.vo.ReviewVO;
import kr.or.ddit.userAll.vo.UserAllVO;

public class MyPageDaoImpl implements IMyPageDao {
	
	// 로그 객체 생성
	private static final Logger RESULT_LOGGER = Logger.getLogger(MyPageDaoImpl.class); // 최종 결과에 대한 로거
		
	// 필요한 객체 생성
	private static IMyPageDao myPageDao;
	private MyPageDaoImpl() {}
	
	public static IMyPageDao getInstance() {
		if(myPageDao == null) { myPageDao = new MyPageDaoImpl(); }
		return myPageDao;
	}
	
	@Override
	public List<QnABoardVO> getAllMyPageQna(SqlMapClient smc, QnABoardVO qnaBoardVo) throws SQLException {
		List<QnABoardVO> qnaBoardList = smc.queryForList("mypage.listMyPageQna", qnaBoardVo);
		
		RESULT_LOGGER.info("■■■ DAO [목록 수] : " + qnaBoardList.size());
		return qnaBoardList;
	}

	@Override
	public List<CommentVO> getAllMyPageComment(SqlMapClient smc, CommentVO commentVo) throws SQLException {
		List<CommentVO> commentList = smc.queryForList("mypage.listMyPageComment", commentVo);
		
		RESULT_LOGGER.info("■■■ DAO [목록 수] : " + commentList.size());
		return commentList;
	}

	@Override
	public List<ReviewVO> getAllMyPageReview(SqlMapClient smc, ReviewVO reviewVo) throws SQLException {
		List<ReviewVO> reviewList = smc.queryForList("mypage.listMyPageReview", reviewVo);
		
		RESULT_LOGGER.info("■■■ DAO [목록 수] : " + reviewList.size());
		return reviewList;
	}

	@Override
	public List<PartyBoardVO> getAllMyPagePartyBoard(SqlMapClient smc, PartyBoardVO partyBoardVo) throws SQLException {
		List<PartyBoardVO> partyBoardList = smc.queryForList("mypage.listMyPagePartyBoard", partyBoardVo);
		
		RESULT_LOGGER.info("■■■ DAO [목록 수] : " + partyBoardList.size());
		return partyBoardList;
	}
}
