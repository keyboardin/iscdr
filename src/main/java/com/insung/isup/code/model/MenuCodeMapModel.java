package com.insung.isup.code.model;

import com.insung.isup.common.model.BaseModel;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@SuppressWarnings("serial")
public class MenuCodeMapModel extends BaseModel {
	private String menu_id;	
	private String menu_par_id ;
	private String menu_nm;	
	private String menu_icon;
	private String menu_url ;
	private int priority;
	private String use_yn;
	private String use_yn_nm;
	private String user_type;
	private String user_type_name;
	private String check_flag;
	
	
}
	