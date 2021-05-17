package com.insung.isup.statsipcc.model;

import com.insung.isup.common.model.BaseModel;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@SuppressWarnings("serial")
public class StatsIpccModel extends BaseModel {
	
	private int seqNo;
	private String stable;	//통계장표이름
	
	private String proc_nm;		//프로시져명
	private String rid;			//장표번호
	private String dttype;
	private String frdt;
	private String todt;
	private String frtm;
	private String totm;
	private String maintel;
	private String agent;
	private String ani;
		

}