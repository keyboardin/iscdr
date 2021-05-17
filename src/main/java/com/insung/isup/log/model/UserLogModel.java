package com.insung.isup.log.model;

import com.insung.isup.common.model.BaseModel;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@SuppressWarnings("serial")
public class UserLogModel extends BaseModel { 
	private int seq_no;
	private String user_id;
	private String emp_no;
	private String emp_nm;
	private String org_nm;
	private String pos_nm;
	private String extension;
	private String ip_addr;
	private String upd_date;
	
}