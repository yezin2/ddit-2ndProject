package kr.or.ddit.partyBoard.vo;

import kr.or.ddit.common.vo.ConstVO;

public class PartyBoardVO extends ConstVO{

	private String code;
	private long boardSeq;
	private String userId;
	private String userProfile;
	private String boardTitle;
	private String boardDate;
	private String boardContent;
	private String restCode;
	private String price;
	private String distance;
	private String restType;
	private String partyYn = N;
	private String partyStart;
	private String partyEnd;
	private long atchFileId = -1;
	private long boardHit = 1;
	private String boardDelete = N;
	private long countList;
	private String restName;
	
	
	
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
	public String getUserProfile() {
		return userProfile;
	}
	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
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
	public String getRestCode() {
		return restCode;
	}
	public void setRestCode(String restCode) {
		this.restCode = restCode;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDistance() {
		return distance;
	}
	public void setDistance(String distance) {
		this.distance = distance;
	}
	public String getRestType() {
		return restType;
	}
	public void setRestType(String restType) {
		this.restType = restType;
	}
	public String getPartyYn() {
		return partyYn;
	}
	public void setPartyYn(String partyYn) {
		this.partyYn = partyYn;
	}
	public String getPartyStart() {
		return partyStart;
	}
	public void setPartyStart(String partyStart) {
		this.partyStart = partyStart;
	}
	public String getPartyEnd() {
		return partyEnd;
	}
	public void setPartyEnd(String partyEnd) {
		this.partyEnd = partyEnd;
	}
	public long getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(long atchFileId) {
		this.atchFileId = atchFileId;
	}
	public long getBoardHit() {
		return boardHit;
	}
	public void setBoardHit(long boardHit) {
		this.boardHit = boardHit;
	}
	public String getBoardDelete() {
		return boardDelete;
	}
	public void setBoardDelete(String boardDelete) {
		this.boardDelete = boardDelete;
	}
	public long getCountList() {
		return countList;
	}
	public void setCountList(long countList) {
		this.countList = countList;
	}
	public String getRestName() {
		return restName;
	}
	public void setRestName(String restName) {
		this.restName = restName;
	}
	
}
