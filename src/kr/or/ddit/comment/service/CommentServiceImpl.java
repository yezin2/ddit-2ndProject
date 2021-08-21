package kr.or.ddit.comment.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.comment.dao.CommentDaoImpl;
import kr.or.ddit.comment.dao.ICommentDao;
import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class CommentServiceImpl implements ICommentService {

	private ICommentDao commentDao;
	private SqlMapClient smc;
	
	private static ICommentService service;
	
	private CommentServiceImpl() {
		commentDao = CommentDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static ICommentService getInstance() {
		if(service == null) {
			service = new CommentServiceImpl();
		}
		return service;
	}
	
	@Override
	public int insertComment(CommentVO cv) {
		int cnt = 0;
		
		try {
			cnt = commentDao.insertComment(smc, cv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int updateComment(CommentVO cv) {
		int cnt = 0;
		
		try {
			cnt = commentDao.updateComment(smc, cv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int deleteComment(long replySeq) {
		int cnt = 0;
		
		try {
			cnt = commentDao.deleteComment(smc, replySeq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public CommentVO getComment(long replySeq) {
		
		CommentVO cv = null;
		
		try {
			cv = commentDao.getComment(smc, replySeq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cv;
	}

	@Override
	public List<CommentVO> getCommentList(CommentVO cv) {

		List<CommentVO> commentList = new ArrayList<>();
		
		try {
			commentList = commentDao.getCommentList(smc, cv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return commentList;
	}

	@Override
	public int getCommentCount(CommentVO cv) {

		int cnt = 0;
		
		try {
			cnt = commentDao.getCommentCount(smc, cv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	
	// 관리자 영역
	
	@Override
	public List<CommentVO> getAllCommentList() {

		List<CommentVO> allCommentList = new ArrayList<>();
		
		try {
			allCommentList = commentDao.getAllCommentList(smc);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return allCommentList;
	}

}
