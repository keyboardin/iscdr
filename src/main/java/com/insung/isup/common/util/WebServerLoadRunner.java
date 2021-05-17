/*
 * web.xml add 
 * <listener>
 * 	<listener-class>com.insung.isup.common.util.WebServerLoadRunner</listener-class>
 * </listener>
 */
package com.insung.isup.common.util;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.insung.isup.common.model.XmlImageModel;
import com.insung.isup.conf.model.CmConfigModel;

public class WebServerLoadRunner {
	private static final Logger logger = LoggerFactory.getLogger(WebServerLoadRunner.class);
	/*
	 * 전역변수 선언
	 */
	public static boolean isSetting; 					//인사정보 DB조회 setting Flag
	
	//인사정보
	public static String EXEC_INSA_DAYS;				//월~일[0,0,0,0,1,1,1]
	public static String EXEC_INSA_HHMM;				//시간 : 시:분[01:10]
	public static String EXEC_INSA_IPS_YN;				//IP 재검색 여부 : Y or N
	public static String EXEC_INSA_RESIGN_SET;			//퇴사자 처리 설정 : 자동로그아웃+자동삭제[1], 자동로그아웃+수동삭제[2], 수동로그아웃+수동삭제[3]
	public static String EXEC_INSA_RESIGN_WARN_COUNT;	//퇴사자 처리 경고 인원수 : 숫자(0~10000)
	
	public static List<CmConfigModel> CMIPLIST;			//CM IP LIST
	
	//XML Server 이중화 체크
	public static String XMLSERVER_SIDE_IP_A;
	public static String XMLSERVER_SIDE_IP_B;
	
	public static String XMLSERVER_ACTIVE_IP;
	public static String XMLSERVER_STANDBY_IP;
	
	public static String XMLSERVER_SIDE_IP_A_URL;
	public static String XMLSERVER_SIDE_IP_B_URL;
	
	public static int XMLSERVER_TAKEOVER_COUNT;
	public static int XMLSERVER_TIMEOUT_COUNT;
	public static String XMLSERVER_SERVER_URL;
	
	//XML IP-Phone Model별 이미지 정보
	public static HashMap<String, XmlImageModel> XML_IPPHONE_IMG_INFO;
	
	//SOAP AXL 통신 메세지 로그 여부
	public static boolean SOAP_AXL_LOG_YN;
	
	//2019-08-19 XML : 전화기 초성검색 parameter 안넘어 오는 현상으로 사용됨(7962G)
	public static String xmlSearchText;
	
	public WebServerLoadRunner(){
		varInit();
	}
	
	private void varInit(){
		logger.debug("=============== init ==============");
		isSetting = true;
		//인사정보 변수 초기화
		WebServerLoadRunner.EXEC_INSA_DAYS = "";
		WebServerLoadRunner.EXEC_INSA_HHMM = "";
		WebServerLoadRunner.EXEC_INSA_IPS_YN = "";
		WebServerLoadRunner.EXEC_INSA_RESIGN_SET = "";
		WebServerLoadRunner.EXEC_INSA_RESIGN_WARN_COUNT = "";
		WebServerLoadRunner.CMIPLIST = null;
		WebServerLoadRunner.XMLSERVER_SIDE_IP_A = "";
		WebServerLoadRunner.XMLSERVER_SIDE_IP_B = "";
		WebServerLoadRunner.XMLSERVER_TIMEOUT_COUNT = 0;
		WebServerLoadRunner.XMLSERVER_SERVER_URL = "";
		WebServerLoadRunner.XMLSERVER_TAKEOVER_COUNT = 3;
		WebServerLoadRunner.SOAP_AXL_LOG_YN = true;
		
		WebServerLoadRunner.XML_IPPHONE_IMG_INFO = new HashMap<String, XmlImageModel>();
		
		xmlSearchText = "";
		
	}
	
}
