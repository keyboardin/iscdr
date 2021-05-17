package com.insung.isup.wizard.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReportCodeModel {
	//rpt_id, rpt_nm, rpt_div, tv01, tv02, fullname, fullpath, level
	private String rpt_id;
	private String rpt_par_id;
	private String rpt_nm;
	private String rpt_par_nm;
	private String rpt_div;
	private String tv01;
	private String tv02;
	private int priority;
	private String use_yn;
	
	private String fullname;
	private String fullpath;
	private int level;
	
	private String id;
	private String text;
	private String parent;
	private String path;
	private String icon;
	
	private String context;
	private int max_depth;
	
	
}