package com.insung.isup.conf.model;

import com.insung.isup.common.model.BaseModel;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@SuppressWarnings("serial")
public class OperConfigModel extends BaseModel {
	private String code_id;
	private String code_nm;
	private String code_alias;
	private String code_value;
	private String group_id;
	private String group_nm;
	private String use_yn;
	private String use_yn_nm;
	

}
	