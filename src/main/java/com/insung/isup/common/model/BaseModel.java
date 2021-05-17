package com.insung.isup.common.model;

import java.io.Serializable;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@SuppressWarnings("serial")
public class BaseModel implements Serializable { 
	private int records;			//테이블 데이타 총 갯수
	private int page; 				//jqGrid 현재 페이지	
	private int rows;				//jqGrid 게시물 count[rowNum]
	private String start;			//jqGrid 시작번호
	private String length; 			//jqGrid pager count
	private String sidx;			//jqGrid 정렬컬럼
	private String sord;			//jqGrid 정렬기준
	private String search_column;	//검색키워드
	private String search_value; 	//검색어	
	private String act; 			//액션값	
	private String db_encrypt_key;	//DB암호화키
	private String contextpath;
	private String row_type;		//emp or grp
	private int totalPage;			//총 게시물의 페이지 수
	private String where;
	
	private String draw;			
	private String filter; 
		
	private int bot_no;
	private String bot_id;
	private String token;
	private String params;
	
	private String reg_date;
	private String upd_date;
	
	
	
}