package com.insung.isup.ldap.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.insung.isup.conf.dao.EmpAdConfigDao;
import com.insung.isup.conf.model.EmpAdConfigModel;
import com.insung.isup.ldap.dao.LdapDao;
import com.insung.isup.ldap.model.LdapModel;
import com.insung.isup.ldap.service.LdapService;

@Service
public class LdapServiceImpl implements LdapService {

	@Autowired
	LdapDao ldapDao;
	
	@Autowired
	EmpAdConfigDao empAdConfigDao;
	
	//사용자 인증
	public HashMap<String, Object> requestUserAuth(LdapModel ldapModel) throws Exception {
		EmpAdConfigModel empAdConfigModel = new EmpAdConfigModel();
		empAdConfigModel.setAd_no(1);
		empAdConfigModel = empAdConfigDao.requestDetail(empAdConfigModel);
		ldapModel.setLdap_ip(empAdConfigModel.getAd_ip());
		ldapModel.setLdap_port(empAdConfigModel.getAd_port());
		ldapModel.setBase_dn(empAdConfigModel.getBase_dn());
		return ldapDao.requestUserAuth(ldapModel);
	}
	
}
