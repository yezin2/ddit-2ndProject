package kr.or.ddit.qna.service;

import java.util.List;

import kr.or.ddit.qna.vo.QnABoardVO;

public interface IQnABoardService {
	public int insertQnABoard(QnABoardVO qna);
	
	public int updateQnABoard(QnABoardVO qna);
	
	public int deleteQnABoard(long boardSeq);
	
	public List<QnABoardVO> getAllQnABoard();
	
	public QnABoardVO selectQnABoard(long boardSeq);
	
	public QnABoardVO getQnABoard(long boardSeq);
	
}