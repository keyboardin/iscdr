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
import com.insung.isup.conf.model.BatchConfigModel;
import com.insung.isup.conf.service.BatchConfigService;

@Controller
public class BatchConfigController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(BatchConfigController.class);
	
	@Autowired
	BatchConfigService batchConfigService;
	
	//공지사항
	@RequestMapping(value="/conf/batchConfig.do")
	public String batchConfig(Map<String, Object> model, BatchConfigModel batchConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/batchConfig.do >>>>> conf/batchConfig.jsp");
		return "conf/batchConfig";
	}	
	
	//requestList
	@RequestMapping(value="/conf/batchConfigList.json")
	public ModelAndView batchConfigList(Map<String, Object> model, BatchConfigModel batchConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/batchConfigList.json");
		
		List<BatchConfigModel> resultList = null;
		try {		
			resultList = batchConfigService.requestList(batchConfigModel);		
			model.put("data", resultList);	
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
	
	//requestList
	@RequestMapping(value="/conf/batchConfigDetail.json")
	public ModelAndView batchConfigDetail(Map<String, Object> model, BatchConfigModel batchConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/batchConfigDetail.json");
		
		try {		
			batchConfigModel = batchConfigService.requestDetail(batchConfigModel);		
			model.put("result", batchConfigModel);	
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
	
	
	//requestInsert
	@RequestMapping(value="/conf/batchConfigInsert.json")
	public ModelAndView batchConfigInsert(Map<String, Object> model, BatchConfigModel batchConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/batchConfigInsert.json");
		try {	
			batchConfigService.requestInsert(batchConfigModel);
			model.put("msg","등록 되었습니다");
			model.put("success",1);			
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}
	
	
	//requestUpdate
	@RequestMapping(value="/conf/batchConfigUpdate.json")
	public ModelAndView batchConfigUpdate(Map<String, Object> model, BatchConfigModel batchConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/batchConfigUpdate.json");
		logger.debug("batch_id : "+batchConfigModel.getBatch_id());
		
		try {	
			batchConfigService.requestUpdate(batchConfigModel);
			model.put("msg","수정 되었습니다");
			model.put("success",1);
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}
	
	
	//requestDelete
	@RequestMapping(value="/conf/batchConfigDelete.json")
	public ModelAndView batchConfigDelete(Map<String, Object> model, BatchConfigModel batchConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/batchConfigDelete.json");
		logger.debug("batch_id : "+batchConfigModel.getBatch_id());
		
		try {	
			batchConfigService.requestDelete(batchConfigModel);
			model.put("msg","삭제 되었습니다");
			model.put("success",1);			
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}
	
}
