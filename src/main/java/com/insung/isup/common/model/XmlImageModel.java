package com.insung.isup.common.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class XmlImageModel {
	
	private String device_model;	//전화기 Model별 번호
	private String display_size;	//이미지 사이즈
	private int width;				//Model별 이미지 넓이
	private int height;				//Model별 이미지 높이
	private int x1;					//touch 좌표(x1,y1, x2,y2)
	private int y1;					//touch 좌표(x1,y1, x2,y2)
	private int x2;					//touch 좌표(x1,y1, x2,y2)
	private int y2;					//touch 좌표(x1,y1, x2,y2)
	private String touch_yn;		//전화기 Model별 Touch 유무
	private String img_yn;			//전화기 Model별 이미지 지원 유무
	private String emp_nm_kor;
	private String extension;
	
}