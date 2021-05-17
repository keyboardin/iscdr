package com.insung.isup.conf.model;

import com.insung.isup.common.model.BaseModel;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@SuppressWarnings("serial")
public class EmpDbConfigModel extends BaseModel {
	private int db_id;
	private String driver;
	private String url;
	private String id;
	private String pw;
	private String query;
	private String split_flag;
	
	
}