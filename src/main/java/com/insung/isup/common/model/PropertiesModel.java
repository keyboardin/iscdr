package com.insung.isup.common.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PropertiesModel{
	private String rest_url;
	private String rest_host;
	private String rest_port;
	private String rest_authkey;
	
	private String system_user_id;
	private String system_user_pw;
	
	private String system_tomcat_install;	
	private String system_tomcat_start;
	private String system_process_start;
	private String system_log_level;
	
	
	private String db_driver;
	private String db_url;
	private String db_username;
	private String db_password;
	private String db_encryptkey;
	
	private String server_authflag;
	private String server_authkey;
	
	private String common_log_level;

	
	
}
