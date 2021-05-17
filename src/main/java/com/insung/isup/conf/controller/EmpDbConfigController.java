package com.insung.isup.conf.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.insung.isup.common.controller.BaseController;
import com.insung.isup.conf.model.EmpDbConfigModel;
import com.insung.isup.conf.service.EmpDbConfigService;

@Controller
public class EmpDbConfigController extends BaseController {
	 
	private static final Logger logger = LoggerFactory.getLogger(EmpDbConfigController.class);
	
	@Autowired
	EmpDbConfigService empDbConfigService;
	
	//initList
	@RequestMapping(value="/conf/empDbConfig.do")
	public String empDbConfig(Map<String, Object> model, EmpDbConfigModel empDbConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/empDbConfig.do >>>>> conf/empDbConfig.jsp");
		return "conf/empDbConfig";
	}
   
	
	//requestList
	@RequestMapping(value="/conf/empDbConfigList.json")
	public ModelAndView empDbConfigList(Map<String, Object> model, EmpDbConfigModel empDbConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/empDbConfigList.json");
		try {	
			List<EmpDbConfigModel> resultList = empDbConfigService.requestList(empDbConfigModel);
			model.put("resultList", resultList);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
	
	
	//requestDetail
	@RequestMapping(value="/conf/empDbConfigDetail.json")
	public ModelAndView empDbConfigDetail(Map<String, Object> model, EmpDbConfigModel empDbConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/empDbConfigDetail.json");
		try {	
			empDbConfigModel = empDbConfigService.requestDetail(empDbConfigModel);
			model.put("result", empDbConfigModel);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
		
	
	//requestUpdate
	@RequestMapping(value="/conf/empDbConfigUpdate.json")
	public ModelAndView empDbConfigUpdate(Map<String, Object> model, EmpDbConfigModel empDbConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/empDbConfigUpdate.json");
		try {	
			empDbConfigService.requestUpdate(empDbConfigModel);
			model.put("msg","수정 되었습니다");
			model.put("success",1);
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}
	
	
	//requestValid
	@RequestMapping(value="/conf/empDbConfigValid.json")
	public ModelAndView empDbConfigValid(Map<String, Object> model, EmpDbConfigModel empDbConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/empDbConfigValid.json");
		try {	
			List<LinkedHashMap<String, Object>> resultList = empDbConfigService.requestValid(empDbConfigModel);
			model.put("data", resultList);
			model.put("msg","Connection Success");
			model.put("success",1);
		} catch (Exception e) {
			model.put("msg","Connection Fail");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
}


