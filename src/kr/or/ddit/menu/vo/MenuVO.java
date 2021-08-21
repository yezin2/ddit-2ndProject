package kr.or.ddit.menu.vo;

import kr.or.ddit.restInfo.vo.RestInfoVO;

public class MenuVO extends RestInfoVO {
	private String restCode;
	private String menuSeq;
	private String menuName;
	private String menuPrice;
	private String atchFileId;
	
	public String getRestCode() {
		return restCode;
	}
	public void setRestCode(String restCode) {
		this.restCode = restCode;
	}
	public String getMenuSeq() {
		return menuSeq;
	}
	public void setMenuSeq(String menuSeq) {
		this.menuSeq = menuSeq;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(String menuPrice) {
		this.menuPrice = menuPrice;
	}
	public String getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}
}
