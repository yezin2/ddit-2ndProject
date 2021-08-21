package kr.or.ddit.event.vo;

public class EventVO {
	private String code;
	private long boardSeq;
	private String userId;
	private String boardType;
	private String boardTitle;
	private String boardContent;
	private String boardDate;
	private String boardStart;
	private String boardEnd;
	private long atchFileId = -1;
	private long boardHits;
	private String boardDelete;
	
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
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	public String getBoardStart() {
		return boardStart;
	}
	public void setBoardStart(String boardStart) {
		this.boardStart = boardStart;
	}
	public String getBoardEnd() {
		return boardEnd;
	}
	public void setBoardEnd(String boardEnd) {
		this.boardEnd = boardEnd;
	}
	public long getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(long atchFileId) {
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
}
