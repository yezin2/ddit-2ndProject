package kr.or.ddit.qna.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.qna.vo.QnABoardVO;

public interface IQnABoardDao {
	public int insertQnABoard(SqlMapClient smc, QnABoardVO qna) throws SQLException;
		
	public int updateQnABoard(SqlMapClient smc, QnABoardVO qna)throws SQLException;;
	
	public int deleteQnABoard(SqlMapClient smc, long boardSeq)throws SQLException;
	
	public List<QnABoardVO> getAllQnABoard(SqlMapClient smc) throws SQLException;
	
	public QnABoardVO selectQnABoard(SqlMapClient smc, long boardSeq) throws SQLException;
	
	public QnABoardVO getQnABoard(SqlMapClient smc, long boardSeq) throws SQLException;

}
