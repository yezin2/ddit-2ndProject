package kr.or.ddit.comment.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.comment.vo.CommentVO;

public class CommentDaoImpl implements ICommentDao {
	
	private static ICommentDao commentDao;
	
	private CommentDaoImpl() {
		
	}
	
	public static ICommentDao getInstance() {
		if(commentDao == null) {
			commentDao = new CommentDaoImpl();
		}
		return commentDao;
	}
	
	@Override
	public int insertComment(SqlMapClient smc, CommentVO cv) throws SQLException {
		int cnt = 0;
		
		Object obj = smc.insert("comment.insertComment", cv);
		
		if(obj == null) {
			cnt = 1;
		}
		
		return cnt;
	}

	@Override
	public int updateComment(SqlMapClient smc, CommentVO cv) throws SQLException {
		int cnt = 0;
		
		cnt = smc.update("comment.updateComment", cv);
		
		return cnt;
	}

	@Override
	public int deleteComment(SqlMapClient smc, long replySeq) throws SQLException {
		int cnt = 0;
		
		cnt = smc.update("comment.deleteComment", replySeq);
		
		return cnt;
	}

	@Override
	public CommentVO getComment(SqlMapClient smc, long replySeq) throws SQLException {
		return (CommentVO) smc.queryForObject("comment.getComment", replySeq);
	}

	@Override
	public List<CommentVO> getCommentList(SqlMapClient smc, CommentVO cv) throws SQLException {
		return smc.queryForList("comment.getCommentList", cv);
	}

	@Override
	public int getCommentCount(SqlMapClient smc, CommentVO cv) throws SQLException {
		return (int) smc.queryForObject("comment.getCommentCount", cv);
	}
	
	
	
	// 관리자 영역
	
	@Override
	public List<CommentVO> getAllCommentList(SqlMapClient smc) throws SQLException {
		return smc.queryForList("comment.getAllCommentList");
	}

}
