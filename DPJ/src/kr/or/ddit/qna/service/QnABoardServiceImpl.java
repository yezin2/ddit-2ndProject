package kr.or.ddit.qna.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.qna.dao.IQnABoardDao;
import kr.or.ddit.qna.dao.QnABoardDaoImpl;
import kr.or.ddit.qna.vo.QnABoardVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class QnABoardServiceImpl implements IQnABoardService{
	private IQnABoardDao qnaDao;
	private SqlMapClient smc;
	
	private static IQnABoardService qnaService;
	
	private QnABoardServiceImpl() {
		qnaDao = QnABoardDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static IQnABoardService getInstance() {
		if(qnaService == null) {
			qnaService = new QnABoardServiceImpl();
		}
		return qnaService;
	}

	@Override
	public int insertQnABoard(QnABoardVO qna) {
		int cnt = 0;
		try {
			cnt = qnaDao.insertQnABoard(smc, qna);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateQnABoard(QnABoardVO qna) {
		int cnt = 0;
		try {
			cnt = qnaDao.updateQnABoard(smc, qna);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public int deleteQnABoard(long boardSeq) {
		int cnt = 0;
		try {
			cnt = qnaDao.deleteQnABoard(smc, boardSeq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public List<QnABoardVO> getAllQnABoard() {
		List<QnABoardVO> list = new ArrayList<>();
		try {
			list = qnaDao.getAllQnABoard(smc);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public QnABoardVO selectQnABoard(long boardSeq) {
		QnABoardVO qna = null;
		try {
			qna = qnaDao.selectQnABoard(smc, boardSeq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return qna;
	}
	
	@Override
	public QnABoardVO getQnABoard(long boardSeq) {
		QnABoardVO qna = null;
		try {
			qna = qnaDao.getQnABoard(smc, boardSeq);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return qna;
	}

}
