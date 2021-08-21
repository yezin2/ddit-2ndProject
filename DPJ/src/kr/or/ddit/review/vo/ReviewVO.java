package kr.or.ddit.review.vo;

public class ReviewVO {
	private String code;
	private long boardSeq;
	private String restCode;
	private String userId;
	private String boardTitle;
	private String boardDate;
	private String boardContent;
	private String restScore;
	private long atchFileId = -1;
	private long atchBillId = -1;
	
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
	public String getRestCode() {
		return restCode;
	}
	public void setRestCode(String restCode) {
		this.restCode = restCode;
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
	public String getRestScore() {
		return restScore;
	}
	public void setRestScore(String restScore) {
		this.restScore = restScore;
	}
	public long getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(long atchFileId) {
		this.atchFileId = atchFileId;
	}
	public long getAtchBillId() {
		return atchBillId;
	}
	public void setAtchBillId(long atchBillId) {
		this.atchBillId = atchBillId;
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
	private long boardHits;
	private String boardDelete;

	
	private String restName; // 마이페이지에서 사용할 식당이름
	
	public String getRestName() {
		return restName;
	}
	public void setRestName(String restName) {
		this.restName = restName;
	}
	
	
}
