package kr.or.ddit.test.service;

import java.util.List;

import kr.or.ddit.qna.vo.QnABoardVO;
import kr.or.ddit.userAll.vo.UserAllVO;

public interface IMyPageService {
	/**
	 * 회원 ID를 받아 작성한 문의 게시글을 출력
	 * @param qnaBoardVo 회원 ID가 담겨져 있는 Vo 객체
	 * @return 문의 게시글 목록 출력
	 */
	public List<QnABoardVO> getAllMyPageQna(QnABoardVO qnaBoardVo);
}
