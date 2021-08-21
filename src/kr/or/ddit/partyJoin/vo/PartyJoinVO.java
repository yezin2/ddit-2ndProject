package kr.or.ddit.partyJoin.vo;

public class PartyJoinVO {
	private long boardSeq;
	private String userId;
	private String userProfile;
	
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
}
