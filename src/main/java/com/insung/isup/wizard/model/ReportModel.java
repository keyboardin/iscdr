package com.insung.isup.wizard.model;

import com.insung.isup.common.model.BaseModel;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@SuppressWarnings("serial")
public class ReportModel extends BaseModel {
	private String report_id;
	private String report_nm;
	private String user_id;
	private String procnm;
	
	private String wtnm;
	private String wgrps;
	private String wcols;
	private String vcols;
	
	private String vtype;
	private String frdt;
	private String todt;
	private String frtm;
	private String totm;
	private String maintel;
	private String center;
	private String organi;
	private String agent;
	private String ani;
	
	private String ym;
	private String dt;
	private String tm;
	private String weekday;
	private String totcall;
	private String agtabncall;
	private String agtreqcall;
	private String netqtime;
	private String localqtime;
	private String agtanscall;
	private String svclevelcall;
	private String talktime;

	private String report_type;
	private String report_type_nm;
	private String report_temp;
	private String report_temp_nm;
	private String report_div;
	
	private String dttype;
	
	private String header;
	private String cols;
	private String align;
	private String condition;
	private String dt_condition;
	
	
}