package kr.or.ddit.groupCode.vo;

import kr.or.ddit.common.vo.ConstVO;

public class GroupCodeInfoVO extends ConstVO{

	private String groupCode;
	private String groupCodeName;
	private String useYn = Y;
	
	public String getGroupCode() {
		return groupCode;
	}
	
	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}
	
	public String getGroupCodeName() {
		return groupCodeName;
	}
	
	public void setGroupCodeName(String groupCodeName) {
		this.groupCodeName = groupCodeName;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	
}
