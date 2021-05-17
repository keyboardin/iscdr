package com.insung.isup.user.model;

import com.insung.isup.common.model.BaseModel;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@SuppressWarnings("serial")
public class UserModel extends BaseModel {
	private String user_id;
	private String user_idx;
	private String user_pw;
	private String user_nm;
	private String user_dep;
	private String user_pos;
	private String user_mobile;
	private String user_email;
	private String user_type;
	private String user_type_nm;
	private String language;
	private String use_yn;
	private String use_yn_nm;
	private String emp_no;
	private String extension;
	

	
	
}