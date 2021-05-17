package com.insung.isup.common.model;

@SuppressWarnings("serial")
public class OptionTagModel extends BaseModel {
	public String codename;
	public String code;	
	
	public OptionTagModel() {
		super();
	}
	public OptionTagModel(String codename, String code) {
		super();
		this.codename=codename;
		this.code=code;
	}


	public String getCodename() {
		return codename;
	}
	public void setCodename(String codename) {
		this.codename = codename;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@Override
	public String toString() {
		return "OptionTagModel [codename=" + codename + ", code=" + code + "]";
	}
		
}
