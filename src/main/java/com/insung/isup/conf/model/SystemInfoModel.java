package com.insung.isup.conf.model;

import com.insung.isup.common.model.BaseModel;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@SuppressWarnings("serial")
public class SystemInfoModel extends BaseModel {
	private String code_id;
	private String code_nm;
	private String code_alias;
	private String code_value;
	private String group_id;
	private String group_nm;
	private String use_yn;
	private String system_name;
	private String system_version;
	private String company_name;
	private String company_en_name;
	private String logo_file;
	private String system_skin;
	private String system_theme;
	private String system_font;
	private String system_login;
	private String solution_name;
	
}