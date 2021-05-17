package com.insung.isup.conf.controller;

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
import com.insung.isup.common.util.CommonUtil;
import com.insung.isup.conf.model.EmpAdConfigModel;
import com.insung.isup.conf.service.EmpAdConfigService;

@Controller
public class EmpAdConfigController extends BaseController {
	 
	private static final Logger logger = LoggerFactory.getLogger(EmpAdConfigController.class);
	
	@Autowired
	EmpAdConfigService empAdConfigService;
	
	//initList
	@RequestMapping(value="/conf/empAdConfig.do")
	public String empAdConfig(Map<String, Object> model, EmpAdConfigModel empAdConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/empAdConfig.do >>>>> conf/empAdConfig.jsp");
		return "conf/empAdConfig";
	}
   
	
	//requestList
	@RequestMapping(value="/conf/empAdConfigList.json")
	public ModelAndView empAdConfigList(Map<String, Object> model, EmpAdConfigModel empAdConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/empAdConfigList.json");
		try {	
			List<EmpAdConfigModel> resultList = empAdConfigService.requestList(empAdConfigModel);
			model.put("resultList", resultList);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
	
	
	//requestDetail
	@RequestMapping(value="/conf/empAdConfigDetail.json")
	public ModelAndView empAdConfigDetail(Map<String, Object> model, EmpAdConfigModel empAdConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/empAdConfigDetail.json");
		logger.debug("ad_no : "+empAdConfigModel.getAd_no());
		try {	
			empAdConfigModel = empAdConfigService.requestDetail(empAdConfigModel);
			model.put("result", empAdConfigModel);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
		
	
	//requestUpdate
	@RequestMapping(value="/conf/empAdConfigUpdate.json")
	public ModelAndView empAdConfigUpdate(Map<String, Object> model, EmpAdConfigModel empAdConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/empAdConfigUpdate.json");
		
		try {	
			empAdConfigService.requestUpdate(empAdConfigModel);
			model.put("msg","수정 되었습니다");
			model.put("success",1);
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}
	
	
	//empAdConfigValid
	@RequestMapping(value="/conf/empAdConfigValid.json")
	public ModelAndView empAdConfigValid(Map<String, Object> model, EmpAdConfigModel empAdConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/empAdConfigValid.json");
		logger.debug("ad_no : "+empAdConfigModel.getAd_no());
		logger.debug("ad_ip : "+empAdConfigModel.getAd_ip());
		logger.debug("ad_port : "+empAdConfigModel.getAd_port());
		String msg = "";
		try {	
			msg = empAdConfigService.requestValid(empAdConfigModel);
			model.put("msg", msg);
			if(CommonUtil.isEquals("Connection Success", msg)) model.put("success",1);
			else model.put("success",0);
		} catch (Exception e) {
			model.put("msg","Connection Fail");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
}


