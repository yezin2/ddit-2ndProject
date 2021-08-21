package kr.or.ddit.mypage.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.mypage.dao.IMyPageDao;
import kr.or.ddit.mypage.dao.MyPageDaoImpl;
import kr.or.ddit.partyBoard.vo.PartyBoardVO;
import kr.or.ddit.qna.vo.QnABoardVO;
import kr.or.ddit.review.vo.ReviewVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class MyPageServiceImpl implements IMyPageService {

	private static final Logger RESULT_LOGGER = Logger.getLogger(MyPageServiceImpl.class); // 최종 결과에 대한 로거
	
	// 필요한 객체 생성
	private IMyPageDao myPageDao;
	private SqlMapClient smc;
	private static IMyPageService myPageService;
	
	private MyPageServiceImpl() { // 생성자 호출
		myPageDao = MyPageDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static IMyPageService getInstance() { // 싱글톤 패턴
		if(myPageService == null) { myPageService = new MyPageServiceImpl(); }
		return myPageService;
	}
	
	@Override
	public List<QnABoardVO> getAllMyPageQna(QnABoardVO qnaBoardVo) {
		List<QnABoardVO> qnaBoardList = null;
		try {
			qnaBoardList = myPageDao.getAllMyPageQna(smc, qnaBoardVo);
		} catch (SQLException ex) { ex.printStackTrace(); } 
		RESULT_LOGGER.info("■■■ Service [목록 수] : " + qnaBoardList.size());
		return qnaBoardList;
	}

	@Override
	public List<CommentVO> getAllMyPageComment(CommentVO commentVo) {
		List<CommentVO> commentList = null;
		try {
			commentList = myPageDao.getAllMyPageComment(smc, commentVo);
		} catch (SQLException ex) { ex.printStackTrace(); } 
		RESULT_LOGGER.info("■■■ Service [목록 수] : " + commentList.size());
		return commentList;
	}

	@Override
	public List<ReviewVO> getAllMyPageReview(ReviewVO reviewVo) {
		List<ReviewVO> reviewList = null;
		try {
			reviewList = myPageDao.getAllMyPageReview(smc, reviewVo);
		} catch (SQLException ex) { ex.printStackTrace(); }
		RESULT_LOGGER.info("■■■ Service [목록 수] : " + reviewList.size());
		return reviewList;
	}

	@Override
	public List<PartyBoardVO> getAllMyPagePartyBoard(PartyBoardVO partyBoardVo) {
		List<PartyBoardVO> partyBoardList = null;
		try {
			partyBoardList = myPageDao.getAllMyPagePartyBoard(smc, partyBoardVo);
		} catch (SQLException ex) { ex.printStackTrace(); }
		RESULT_LOGGER.info("■■■ Service [목록 수] : " + partyBoardList.size());
		return partyBoardList;
	}
}
