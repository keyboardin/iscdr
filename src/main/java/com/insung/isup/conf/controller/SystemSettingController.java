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
import com.insung.isup.code.model.CommCodeModel;
import com.insung.isup.code.service.CommCodeService;

@Controller
public class SystemSettingController extends BaseController {
	 
	private static final Logger logger = LoggerFactory.getLogger(SystemSettingController.class);
	
	@Autowired
	CommCodeService commCodeService;
	
	//initList
	@RequestMapping(value="/conf/systemSetting.do")
	public String systemSetting(Map<String, Object> model, CommCodeModel commCodeModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/systemSetting.do >>>>> conf/systemSetting.jsp");
		return "conf/systemSetting";
	}
   
	//requestList
	@RequestMapping(value="/conf/systemSettingList.json")
	public ModelAndView systemSettingList(Map<String, Object> model, CommCodeModel commCodeModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/systemSettingList.json");
		logger.debug("group_id : "+commCodeModel.getGroup_id());
		try {	
			List<CommCodeModel> resultList = commCodeService.requestList(commCodeModel);
			model.put("resultList", resultList);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
	
	
	//requestUpdate
	@RequestMapping(value="/conf/systemSettingUpdate.json")
	public ModelAndView systemSettingUpdate(Map<String, Object> model, CommCodeModel commCodeModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/systemSettingUpdate.json");
		logger.debug("code_ids : "+commCodeModel.getCode_id());
		logger.debug("code_values : "+commCodeModel.getCode_value());
		
		String[] code_ids = CommonUtil.getSplit(commCodeModel.getCode_id(), ",");
		String[] code_values = CommonUtil.getSplit(commCodeModel.getCode_value(), ",");
		
		try {
			for(int i=0; i<code_ids.length; i++) {
				commCodeModel.setCode_id(code_ids[i]);
				commCodeModel.setCode_value(code_values[i]);
				commCodeService.requestUpdate(commCodeModel);
			}
			model.put("msg","수정 되었습니다");
			model.put("success",1);
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}
	
	
	
}


