package kr.or.ddit.userDdit.vo;

public class UserDditVO {
	private String userId;
	private String dditName;
	private String dditClass;
	private String dditHp;
	private String dditMail;
	private String dditBir;
	private String recvMail;
	private String policyYn;
	
	private String userPhoto; // 마이페이지 유저 포토 출력용
	
	public String getUserPhoto() {
		return userPhoto;
	}
	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getDditName() {
		return dditName;
	}
	public void setDditName(String dditName) {
		this.dditName = dditName;
	}
	public String getDditClass() {
		return dditClass;
	}
	public void setDditClass(String dditClass) {
		this.dditClass = dditClass;
	}
	public String getDditHp() {
		return dditHp;
	}
	public void setDditHp(String dditHp) {
		this.dditHp = dditHp;
	}
	public String getDditMail() {
		return dditMail;
	}
	public void setDditMail(String dditMail) {
		this.dditMail = dditMail;
	}
	public String getDditBir() {
		return dditBir;
	}
	public void setDditBir(String dditBir) {
		this.dditBir = dditBir;
	}
	public String getRecvMail() {
		return recvMail;
	}
	public void setRecvMail(String recvMail) {
		this.recvMail = recvMail;
	}
	public String getPolicyYn() {
		return policyYn;
	}
	public void setPolicyYn(String policyYn) {
		this.policyYn = policyYn;
	}
}
