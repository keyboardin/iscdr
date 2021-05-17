package com.insung.isup.ldap.model;

import com.insung.isup.common.model.BaseModel;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@SuppressWarnings("serial")
public class LdapModel extends BaseModel {
	private int ad_no;
	private String ldap_ip;
	private String ldap_port;
	private String ldap_id;
	private String ldap_pw;
	private String base_dn;
	private String upd_date;
	
	
	
}