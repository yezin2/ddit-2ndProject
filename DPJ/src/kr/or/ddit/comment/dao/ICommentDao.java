package kr.or.ddit.comment.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.comment.vo.CommentVO;

public interface ICommentDao {
	
	/**
	 * 댓글 추가
	 * @param smc sqlMapClient
	 * @param cv DB에 insert할 댓글이 저장된 VO객체
	 * @return 성공 : 1, 실패 : 0
	 * @throws SQLException JDBC 관련 예외객체 발생
	 */
	public int insertComment(SqlMapClient smc, CommentVO cv) throws SQLException;
	
	/**
	 * 댓글 수정
	 * @param smc sqlMapClient
	 * @param cv 수정할 댓글 정보 VO
	 * @return 성공 : 1, 실패 : 0
	 * @throws SQLException JDBC 관련 예외객체 발생
	 */
	public int updateComment(SqlMapClient smc, CommentVO cv) throws SQLException;
	
	/**
	 * 댓글 삭제
	 * @param smc sqlMapClient
	 * @param replySeq 삭제할 댓글 seq
	 * @return 성공 : 1, 실패 : 0
	 * @throws SQLException JDBC 관련 예외객체 발생
	 */
	public int deleteComment(SqlMapClient smc, long replySeq) throws SQLException;
	
	/**
	 * 하나의 댓글 정보를 가져오는 기능
	 * @param smc sqlMapClient
	 * @param replySeq 댓글 seq
	 * @return 성공 : 1, 실패 : 0
	 * @throws SQLException
	 */
	public CommentVO getComment(SqlMapClient smc, long boardSeq) throws SQLException;
	
	/**
	 * 조회 중인 게시글에 해당하는 댓글 목록
	 * @param smc sqlMapClient
	 * @param cv 댓글 정보 가져오는 기준
	 * @return 
	 * @throws SQLException
	 */
	public List<CommentVO> getCommentList(SqlMapClient smc, CommentVO cv) throws SQLException;
	
	/**
	 * 조회 중인 게시글의 댓글 수
	 * @param smc
	 * @param cv 댓글 정보 가져오는 기준
	 * @return
	 * @throws SQLException
	 */
	public int getCommentCount(SqlMapClient smc, CommentVO cv) throws SQLException;
	
	/**
	 * 관리자가 조회하는 홈페이지 전체 댓글
	 * @param smc
	 * @return
	 * @throws SQLException
	 */
	public List<CommentVO> getAllCommentList(SqlMapClient smc) throws SQLException;
	
}
