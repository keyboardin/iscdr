package com.insung.isup.log.model;

import com.insung.isup.common.model.BaseModel;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@SuppressWarnings("serial")
public class BatchLogModel extends BaseModel {
	private int seq_no;
	private int batch_id;
	private String batch_nm;
	private String batch_day;
	private String batch_time;
	private String batch_desc;
	private String use_yn;
	private String use_yn_nm;
	private String upd_date;
	private String content;
	
	
}