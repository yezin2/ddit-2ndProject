package kr.or.ddit.mypage.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.comment.vo.CommentVO;
import kr.or.ddit.partyBoard.vo.PartyBoardVO;
import kr.or.ddit.qna.vo.QnABoardVO;
import kr.or.ddit.review.vo.ReviewVO;

public interface IMyPageService {
	/**
	 * 회원 ID를 받아 작성한 문의 게시글을 출력
	 * @param qnaBoardVo 회원 ID가 담겨져 있는 Vo 객체
	 * @return 문의 게시글 목록 출력
	 */
	public List<QnABoardVO> getAllMyPageQna(QnABoardVO qnaBoardVo);
	
	/**
	 * 회원 ID를 기준으로 Comment 목록을 가져오는 메서드
	 * @param commentVo 회원 ID가 담겨져있는 Vo 객체
	 * @return 코멘트 목록 출력
	 */
	public List<CommentVO> getAllMyPageComment(CommentVO commentVo);
	
	/**
	 * 회원 Id를 기준으로 Review 목록을 가져오는 메서드
	 * @param reviewVo 회원ID가 담겨져있는 Vo 객체
	 * @return 리뷰 목록 출력
	 */
	public List<ReviewVO> getAllMyPageReview(ReviewVO reviewVo);
	
	/**
	 * 유저 ID를 기준으로 파티 모집 게시글을 가져오는 메서드
	 * @param partyBoardVo 회원 ID를 담고있는 PartyBoardVO 객체
	 * @return 리뷰 목록
	 */
	public List<PartyBoardVO> getAllMyPagePartyBoard(PartyBoardVO partyBoardVo);
}
