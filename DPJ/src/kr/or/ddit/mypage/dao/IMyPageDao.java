package kr.or.ddit.mypage.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.partyBoard.vo.PartyBoardVO;
import kr.or.ddit.qna.vo.QnABoardVO;
import kr.or.ddit.review.vo.ReviewVO;

public interface IMyPageDao {
	/**
	 * 유저 ID 를 기준으로 Qna목록을 가져오는 메서드
	 * @param smc SqlMapClient 객체
	 * @param userAllVo 회원 ID를 담고있는 객체
	 * @return Qna 게시글 목록 담고있는 객체
	 * @throws SQLException JDBC관련 예외객체 발생
	 */
	public List<QnABoardVO> getAllMyPageQna(SqlMapClient smc, QnABoardVO qnaBoardVo) throws SQLException;
	
	/**
	 * 유저 ID를 기준으로 Comment 목록을 가져오는 메서드
	 * @param smc SqlMapClient 객체
	 * @param commentVo 회원 ID를 담고있는 CommentVO 객체
	 * @return Comment 목록
	 * @throws SQLException JDBC 관련 객체 발생
	 */
	public List<CommentVO> getAllMyPageComment(SqlMapClient smc, CommentVO commentVo) throws SQLException;
	
	/**
	 * 유저 ID를 기준으로 리뷰 목록을 가져오는 메서드
	 * @param smc SqlMapClient 객체
	 * @param reviewVo  회원 ID를 담고있는 ReviewVO 객체
	 * @return 리뷰 목록
	 * @throws SQLException JDBC 관련 객체 발생
	 */
	public List<ReviewVO> getAllMyPageReview(SqlMapClient smc, ReviewVO reviewVo) throws SQLException;
	
	/**
	 * 유저 ID를 기준으로 파티 모집 게시글을 가져오는 메서드
	 * @param smc SqlMapClient 객체
	 * @param partyBoardVo 회원 ID를 담고있는 PartyBoardVO 객체
	 * @return 리뷰목록
	 * @throws SQLException JDBC 관련 객체 발생
	 */
	public List<PartyBoardVO> getAllMyPagePartyBoard(SqlMapClient smc, PartyBoardVO partyBoardVo) throws SQLException;
}
