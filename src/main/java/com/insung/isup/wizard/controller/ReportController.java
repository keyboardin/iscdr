package com.insung.isup.wizard.controller;

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
import com.insung.isup.user.model.UserModel;
import com.insung.isup.wizard.model.ReportModel;
import com.insung.isup.wizard.service.ReportService;

@Controller
public class ReportController extends BaseController { 
	 
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);

	@Autowired
	ReportService reportService;
	
	//initList
	@RequestMapping(value="/wizard/report.do")
	public String report(Map<String, Object> model, ReportModel reportModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/wizard/report.do >>>>> wizard/report.jsp");
		return "wizard/report";
	}
	
	
	//requestListAll
	@RequestMapping(value="/wizard/reportListAll.json")
	public ModelAndView reportListAll(Map<String, Object> model, ReportModel reportModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/user/reportListAll.json");
		try {		
			List<ReportModel> resultList = reportService.requestList(reportModel);		
			model.put("data", resultList);	
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
	
	
	//requestList
	@RequestMapping(value="/wizard/reportList.json")
	public ModelAndView reportList(Map<String, Object> model, ReportModel reportModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/wizard/reportList.json");
		logger.debug("draw : "+ reportModel.getDraw()); 
		logger.debug("start : "+ reportModel.getStart());
		logger.debug("length : "+ reportModel.getLength());
		logger.debug("filter : "+ CommonUtil.getFilter(req));	
		
		String draw = reportModel.getDraw();
		reportModel.setSearch_value(CommonUtil.getFilter(req));		//filter		
		reportModel.setSidx(CommonUtil.getOrderColumn(req));		
		reportModel.setSord(CommonUtil.getOrderDir(req));			//ASC, DESC	
		
		try {	
			UserModel userModel = getUserSession(req);
			String user_id = userModel.getUser_id();
			reportModel.setUser_id(user_id);
			String records = reportService.requestListCount(reportModel).getRecords()+"";
			List<ReportModel> resultList = reportService.requestList(reportModel);	
			
			model.put("draw", draw);
			model.put("recordsTotal", records);
			model.put("recordsFiltered", records);
			model.put("data", resultList);		
		} catch (Exception e) {
			logger.debug("Exception", e);
			e.printStackTrace();
		}
		return new ModelAndView("jsonView", model);
	}
	
	//requestDetail
	@RequestMapping(value="/wizard/reportDetail.json")
	public ModelAndView reportDetail(Map<String, Object> model, ReportModel reportModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/wizard/reportDetail.json");
		logger.debug("report_id : "+reportModel.getReport_id());
		
		try {		
			reportModel = reportService.requestDetail(reportModel);		
			model.put("result", reportModel);	
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
		
	//requestInsert
	@RequestMapping(value="/wizard/reportInsert.json")
	public ModelAndView reportInsert(Map<String, Object> model, ReportModel reportModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/wizard/reportInsert.json");
		logger.debug("report_nm : "+reportModel.getReport_nm());
		logger.debug("report_type : "+reportModel.getReport_type());
		logger.debug("report_temp : "+reportModel.getReport_temp());
		logger.debug("procnm : "+reportModel.getProcnm());
		logger.debug("condition : "+reportModel.getCondition());
		logger.debug("dt_condition : "+reportModel.getDt_condition());
		logger.debug("dttype : "+reportModel.getDttype());
		logger.debug("frdt : "+reportModel.getFrdt());
		logger.debug("todt : "+reportModel.getTodt());
		logger.debug("frtm : "+reportModel.getFrtm());  
		logger.debug("totm : "+reportModel.getTotm()); 
		logger.debug("maintel : "+reportModel.getMaintel());
		logger.debug("agent : "+reportModel.getAgent());
		logger.debug("header : "+reportModel.getHeader()); 
		logger.debug("cols : "+reportModel.getCols());
		logger.debug("align : "+reportModel.getAlign());
		
		try {	
			UserModel userModel = getUserSession(req);
			String user_id = userModel.getUser_id();
			reportModel.setUser_id(user_id);
			reportService.requestInsert(reportModel);			
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
	@RequestMapping(value="/wizard/reportUpdate.json")
	public ModelAndView reportUpdate(Map<String, Object> model, ReportModel reportModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/wizard/reportUpdate.json");
		logger.debug("report_id : "+reportModel.getReport_id());
		try {			
			reportService.requestUpdate(reportModel);
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
	@RequestMapping(value="/wizard/reportDelete.json")
	public ModelAndView reportDelete(Map<String, Object> model, ReportModel reportModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/wizard/reportDelete.json");
		logger.debug("report_id : "+reportModel.getReport_id());
		try {				
			reportService.requestDelete(reportModel);		
			model.put("msg","삭제 되었습니다");
			model.put("success",1);			
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}
	
	
	//reportPopup
	@RequestMapping(value="/wizard/reportPopup.do")
	public String reportPopup(Map<String, Object> model, ReportModel reportModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/wizard/reportPopup.do >>>>> reportPopup.jsp");
		logger.debug("report_id : " + reportModel.getReport_id());
		
		try {
			reportModel = reportService.requestDetail(reportModel);		
			model.put("result", reportModel);	
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		
		return "wizard/reportPopup";
	}
	
}

