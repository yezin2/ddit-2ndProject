package kr.or.ddit.userAll.vo;

public class UserAllVO {
	private String userId; // 아이디
	private String userPw; // 비밀번호
	private String userType; // 회원유형 
	private String userDelete; // 삭제여부
	private String userPhoto; // 프로필사진
	private String userAuth; // 인증번호
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserDelete() {
		return userDelete;
	}
	public void setUserDelete(String userDelete) {
		this.userDelete = userDelete;
	}
	public String getUserPhoto() {
		return userPhoto;
	}
	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}
	public String getUserAuth() {
		return userAuth;
	}
	public void setUserAuth(String userAuth) {
		this.userAuth = userAuth;
	}
	
	@Override
	public String toString() {
		return "UserAllVO [userId=" + userId + ", userPw=" + userPw + ", userType=" + userType + ", userDelete="
				+ userDelete + ", userPhoto=" + userPhoto + ", userAuth=" + userAuth + "]";
	}
	
	
}
