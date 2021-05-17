package com.insung.isup.ldap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.insung.isup.common.controller.BaseController;
import com.insung.isup.ldap.service.LdapService;

@Controller
public class LdapController extends BaseController {
	 
	//private static final Logger logger = LoggerFactory.getLogger(LdapController.class);
	
	@Autowired
	LdapService ldapService;
	
	
	
	
}


