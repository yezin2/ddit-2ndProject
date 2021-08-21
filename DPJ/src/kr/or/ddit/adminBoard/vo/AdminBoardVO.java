package kr.or.ddit.adminBoard.vo;

public class AdminBoardVO {
	private String code;
	private long boardSeq;
	private String userId;
	private String boardTitle;
	private String boardDate;
	private String boardContent;
	private String atchFileId;
	private long boardHits = 1;
	private String boardDelete = "N";
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public long getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(long boardSeq) {
		this.boardSeq = boardSeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}
	public long getBoardHits() {
		return boardHits;
	}
	public void setBoardHits(long boardHits) {
		this.boardHits = boardHits;
	}
	public String getBoardDelete() {
		return boardDelete;
	}
	public void setBoardDelete(String boardDelete) {
		this.boardDelete = boardDelete;
	}
	@Override
	public String toString() {
		return "AdminBoardVO [code=" + code + ", boardSeq=" + boardSeq + ", userId=" + userId + ", boardTitle="
				+ boardTitle + ", boardDate=" + boardDate + ", boardContent=" + boardContent + ", atchFileId="
				+ atchFileId + ", boardHits=" + boardHits + ", boardDelete=" + boardDelete + "]";
	}
}
