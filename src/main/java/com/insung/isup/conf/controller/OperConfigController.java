package com.insung.isup.conf.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.insung.isup.common.controller.BaseController;
import com.insung.isup.conf.model.CmConfigModel;
import com.insung.isup.conf.service.CmConfigService;

@Controller
public class OperConfigController extends BaseController {
	 
	private static final Logger logger = LoggerFactory.getLogger(OperConfigController.class);
		
	@Autowired
	CmConfigService cmsConfigService;
	
	//initList
	@RequestMapping(value="/conf/operConfig.do")
	public String operConfig(Map<String, Object> model, CmConfigModel cmsConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/operConfig.do >>>>> conf/operConfig.jsp");
		return "conf/operConfig";
	}

	//CM설정 
	@RequestMapping(value="/conf/operConfigCm.do")
	public String operConfigCm(Map<String, Object> model, CmConfigModel cmsConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/operConfigCm.do >>>>> conf/operConfigCm.jsp");
		return "conf/operConfigCm";
	}
	
	//인사DB 
	@RequestMapping(value="/conf/operConfigEmpDb.do")
	public String operConfigEmpDb(Map<String, Object> model, CmConfigModel cmsConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/operConfigEmpDb.do >>>>> conf/operConfigEmpDb.jsp");
		return "conf/operConfigEmpDb";
	}
	
	//LDAP설정  
	@RequestMapping(value="/conf/operConfigLdap.do")
	public String operConfigLdap(Map<String, Object> model, CmConfigModel cmsConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/operConfigLdap.do >>>>> conf/operConfigLdap.jsp");
		return "conf/operConfigLdap";
	}
	
	
	//일배치설정  
	@RequestMapping(value="/conf/operConfigBatch.do")
	public String operConfigBatch(Map<String, Object> model, CmConfigModel cmsConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/operConfigBatch.do >>>>> conf/operConfigBatch.jsp");
		return "conf/operConfigBatch";
	}
}


