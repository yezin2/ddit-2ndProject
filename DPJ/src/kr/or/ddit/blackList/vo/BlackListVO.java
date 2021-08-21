package kr.or.ddit.blackList.vo;

public class BlackListVO {
	private String userId; // USER_ID
	private String blackReason; // BLACK_REASON
	private String blackDate; // BLACK_DATE
	private String blackDelete; // BLACK_DELETE
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBlackReason() {
		return blackReason;
	}
	public void setBlackReason(String blackReason) {
		this.blackReason = blackReason;
	}
	public String getBlackDate() {
		return blackDate;
	}
	public void setBlackDate(String blackDate) {
		this.blackDate = blackDate;
	}
	public String getBlackDelete() {
		return blackDelete;
	}
	public void setBlackDelete(String blackDelete) {
		this.blackDelete = blackDelete;
	}
}
