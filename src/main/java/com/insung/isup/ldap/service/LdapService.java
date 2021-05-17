package com.insung.isup.ldap.service;

import java.util.HashMap;

import com.insung.isup.ldap.model.LdapModel;

public interface LdapService {
		
	//사용자 인증
	public HashMap<String, Object> requestUserAuth(LdapModel ldapModel) throws Exception;
	
}
