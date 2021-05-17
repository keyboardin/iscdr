package com.insung.isup.wizard.controller;

import java.util.HashMap;
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

import com.insung.isup.wizard.model.ReportCodeModel;
import com.insung.isup.wizard.service.ReportCodeService;

@Controller
public class ReportCodeController{	
	 
	private static final Logger logger = LoggerFactory.getLogger(ReportCodeController.class);
	
	@Autowired
	private ReportCodeService reportCodeService;
	
	//initList
	@RequestMapping(value="/wizard/reportCode.do")
	public String init(Map<String, Object> model, ReportCodeModel param, HttpServletRequest req, HttpServletResponse res){
		logger.debug("wizard/reportCode.do >>>>> wizard/reportCode.do.jsp");
		return "wizard/reportCode";
	}
	
	//requestList
	@RequestMapping(value="/wizard/reportCodeList.json")
	public ModelAndView reportCodeList(Map<String, Object> model, ReportCodeModel param, HttpServletRequest req, HttpServletResponse res) {
		logger.debug("/wizard/reportCodeList.json");
		logger.debug("rpt_par_id : "+param.getRpt_par_id());
		
		try {	
			List<ReportCodeModel> resultList = reportCodeService.requestList(param);		
			model.put("resultList", resultList);		
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
	
	//requestDetail
	@RequestMapping(value="/wizard/reportCodeDetail.json")
	public ModelAndView reportCodeDetail(Map<String, Object> model, ReportCodeModel param, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/wizard/reportCodeDetail.json");
		logger.debug("rpt_id : "+param.getRpt_id());
		
		try {		
			param = reportCodeService.requestDetail(param);		
			model.put("result", param);	
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
		
	//requestInsert
	@RequestMapping(value="/wizard/reportCodeInsert.json")
	public ModelAndView reportCodeInsert(Map<String, Object> model, ReportCodeModel param, HttpServletRequest req, HttpServletResponse res) {
		logger.debug("/wizard/reportCodeInsert.json");
		try {	
			reportCodeService.requestInsert(param);			
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
	@RequestMapping(value="/wizard/reportCodeUpdate.json")
	public ModelAndView reportCodeUpdate(Map<String, Object> model, ReportCodeModel param, HttpServletRequest req, HttpServletResponse res) {
		logger.debug("/wizard/reportCodeUpdate.json");
		logger.debug("rpt_id : "+param.getRpt_id());
		try {			
			reportCodeService.requestUpdate(param);
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
	@RequestMapping(value="/wizard/reportCodeDelete.json")
	public ModelAndView reportCodeDelete(Map<String, Object> model, ReportCodeModel param, HttpServletRequest req, HttpServletResponse res) {
		logger.debug("/wizard/reportCodeDelete.json");
		logger.debug("rpt_id : "+param.getRpt_id());
		try {				
			reportCodeService.requestDelete(param);		
			model.put("msg","삭제 되었습니다");
			model.put("success",1);			
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}
	
	//requestTree
	@RequestMapping(value="/wizard/reportCodeTree.json")
	public ModelAndView reportCodeTree(Map<String, Object> model, ReportCodeModel param, HttpServletRequest req, HttpServletResponse res) {
		logger.debug("/wizard/reportCodeTree.json");
		logger.debug("max_depth : "+param.getMax_depth());
		String context = req.getContextPath();	//DB쿼리에서 contextpath+imagepath 만들기 위해
		param.setContext(context);
		param.setMax_depth((param.getMax_depth()-1));
		try {		
			List<HashMap<String, Object>> resultTree = reportCodeService.requestTree(param);	
			model.put("resultTree", resultTree);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
	
	//requestInsertBatch
	@RequestMapping(value="/wizard/reportCodeInsertBatch.json")
	public ModelAndView reportCodeInsertBatch(Map<String, Object> model, ReportCodeModel param, HttpServletRequest req, HttpServletResponse res) {
		logger.debug("/wizard/reportCodeInsertBatch.json");
		logger.debug("rpt_par_id : "+param.getRpt_par_id());
		logger.debug("rpt_nm : "+param.getRpt_nm());
		logger.debug("rpt_div : "+param.getRpt_div());
		logger.debug("tv01 : "+param.getTv01());
		logger.debug("tv02 : "+param.getTv02());
		
		try {	
			reportCodeService.requestInsertBatch(param);			
			model.put("msg","등록 되었습니다");
			model.put("success",1);			
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}
	
}
