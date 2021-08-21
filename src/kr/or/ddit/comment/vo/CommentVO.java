package kr.or.ddit.comment.vo;

import kr.or.ddit.common.vo.ConstVO;

public class CommentVO extends ConstVO {

	private String code;
	private long replySeq;
	private String userId;
	private String replyDate;
	private String replyContent;
	private String replyDelete = N;
	private long boardSeq;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public long getReplySeq() {
		return replySeq;
	}
	public void setReplySeq(long replySeq) {
		this.replySeq = replySeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyDelete() {
		return replyDelete;
	}
	public void setReplyDelete(String replyDelete) {
		this.replyDelete = replyDelete;
	}
	public long getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(long boardSeq) {
		this.boardSeq = boardSeq;
	}

}
