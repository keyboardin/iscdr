package com.insung.isup.emp.model;

import com.insung.isup.common.model.BaseModel;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@SuppressWarnings("serial")
public class EmpModel extends BaseModel { 
	private int seq_no;
	private String emp_no;
	private String user_id;
	private String user_pw;
	private String emp_nm;
	private String org_cd;
	private String org_nm;
	private String pos_cd;
	private String pos_nm;
	private String duty_cd;
	private String duty_nm;
	private String extension;
	private String emp_tel;
	private String emp_email;
	private String emp_fax;
	private String emp_mobile;
	private String pic_path;
	private String up_org_cd;
	private String up_org_nm;
	private String stat_cd;
	private String stat_nm;
	private String emp_cd;
	private String emp_cd_nm;
	private String upd_date;
	
	private String fkdevice;
	private String mac_address;
	private String login_date;
	
	private String emp_pw;				//비밀번호	
	private String popup_svc_yn;		//(XML)팝업서비스여부
	private String phone_svc_yn;		//(XML)폰서비스여부
	private String pickup_group;		//(DN)당겨받기그룹 : 당겨받기 그룹 정보 테이블의 seq 
	private String cfadestination;		//(DN)ForwardAll(callforwarddynamic)
	private String cfnaduration;		//No Answer Ring Duration ([string]seconds)
	private String cfnadestination;		//No Answer 착신 번호
	private String cfbdestination;		//Busy 착신 번호
	private String busytrigger;
	private String description;
	private String alertingname;		
	private String display;				//(DN)발신자표시이름
	private String label;				//(DN)전화기표시
	private String e164mask;			//(DN)외부발신마스크
	private String tkuserlocale;		//(device)전화기locale 한글:21, 영문:1
	private String tkuserlocale_nm;		//(device)전화기locale
	private String devpool_pkid;
	private String soft_pkid;
	private String css_pkid;
	private String pt_pkid;
	private String pick_pkid;
	
	private String device_code;			//전화기 모델 코드
	private String device_ip;			//전화기 IP
	private String default_extension;	//전화기 default 내선번호
	private String device_status;		//전화기 실시간 상태 Registered/Unregistered
	
	private String tkmodel;				//전화기 모델 코드
	private String model_nm;
	private String numplanindex;
	private String user_type;
	private String extension_cnt;
	private String sticky_yn;
	private String ip_addr;
	private String reg_date;
	private String seat_no;
}