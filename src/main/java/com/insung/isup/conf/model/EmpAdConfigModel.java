package com.insung.isup.conf.model;

import com.insung.isup.common.model.BaseModel;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@SuppressWarnings("serial")
public class EmpAdConfigModel extends BaseModel {
	private int ad_no;
	private String ad_ip;
	private String ad_port;
	private String ad_id;
	private String ad_pw;
	private String base_dn;
	private String upd_date;

	
}