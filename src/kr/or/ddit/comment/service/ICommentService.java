package kr.or.ddit.comment.service;

import java.util.List;

import kr.or.ddit.comment.vo.CommentVO;

public interface ICommentService {

	/**
	 * 댓글 추가
	 * @param cv DB에 insert할 댓글이 저장된 VO객체
	 * @return 성공 : 1, 실패 : 0
	 */
	public int insertComment(CommentVO cv);
	
	/**
	 * 댓글 수정
	 * @param cv 수정할 댓글 정보 VO
	 * @return 성공 : 1, 실패 : 0
	 */
	public int updateComment(CommentVO cv);
	
	/**
	 * 댓글 삭제
	 * @param replySeq 삭제할 댓글 seq
	 * @return 성공 : 1, 실패 : 0
	 */
	public int deleteComment(long replySeq);
	
	/**
	 * 하나의 댓글 정보를 가져오는 기능
	 * @param replySeq 댓글 seq
	 * @return
	 */
	public CommentVO getComment(long replySeq);
	
	/**
	 * 조회 중인 게시글에 해당하는 댓글 목록
	 * @param cv
	 * @return
	 */
	public List<CommentVO> getCommentList(CommentVO cv);
	
	/**
	 * 조회 중인 게시글의 댓글 수
	 * @param cv 댓글 정보 가져오는 기준
	 * @return
	 */
	public int getCommentCount(CommentVO cv);
	
	/**
	 * 관리자가 조회하는 홈페이지 전체 댓글
	 * @return
	 */
	public List<CommentVO> getAllCommentList();
}
