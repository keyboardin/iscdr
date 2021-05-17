package com.insung.isup.wizard.controller;

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

import com.insung.isup.statsipcc.service.StatsIpccService;
import com.insung.isup.wizard.model.ReportCodeModel;
import com.insung.isup.wizard.model.TableSchemaModel;
import com.insung.isup.wizard.model.WizardModel;
import com.insung.isup.wizard.service.ReportCodeService;

@Controller
public class WizardController {

	private static final Logger logger = LoggerFactory.getLogger(WizardController.class);

	@Autowired
	private ReportCodeService reportCodeService;
		
	@Autowired
	private StatsIpccService statsIpccService;
	
    
	//wzSetting
	@RequestMapping(value="/wizard/wzSetting.do")
	public String init(Map<String, Object> model, ReportCodeModel param, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/wizard/init.do >>>>> wzSetting.jsp");
		if(param.getRpt_par_id() == null || param.getRpt_par_id().equals("")) {
			param.setRpt_par_id("RT");
		}
		logger.debug("rpt_par_id = "+param.getRpt_par_id());
		try {
			String firstRptId = "";
			List<ReportCodeModel> resultList = reportCodeService.requestChildList(param);
			if(resultList.size() > 0) {
				firstRptId = resultList.get(0).getRpt_id();
			}
			model.put("firstRptId", firstRptId);
			model.put("resultList", resultList);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		
		return "wizard/wzSetting";
	}
	
	//wzPopup
	@RequestMapping(value="/wizard/wzPopup.do")
	public String wzPopup(Map<String, Object> model, WizardModel wizardModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/wizard/wzPopup.do >>>>> wzPopup.jsp");
		logger.debug("report_type : " + wizardModel.getReport_type());
		logger.debug("report_type_nm : " + wizardModel.getReport_type_nm());
		logger.debug("report_temp : " + wizardModel.getReport_temp());
		logger.debug("report_temp_nm : " + wizardModel.getReport_temp_nm());
		logger.debug("procnm : " + wizardModel.getProcnm());
		logger.debug("condition : " + wizardModel.getCondition());
		logger.debug("dt_condition : " + wizardModel.getDt_condition());
		logger.debug("dttype : " + wizardModel.getDttype());
		logger.debug("frdt : " +wizardModel.getFrdt());
		logger.debug("todt : " +wizardModel.getTodt());
		logger.debug("frtm : " +wizardModel.getFrtm());
		logger.debug("totm : " +wizardModel.getTotm());
		logger.debug("maintel : " +wizardModel.getMaintel());
		logger.debug("agent : " +wizardModel.getAgent());
		logger.debug("ani : " +wizardModel.getAni());

		logger.debug("header : " + wizardModel.getHeader());
		logger.debug("cols : " + wizardModel.getCols());
		logger.debug("align : " +wizardModel.getAlign());
		
//		String maintel = wizardModel.getMaintel()==null ? "" : wizardModel.getMaintel();
//		wizardModel.setMaintel(maintel);
//		String agent = wizardModel.getAgent()==null ? "" : wizardModel.getAgent() ;
//		wizardModel.setMaintel(maintel);
		
		model.put("result", wizardModel);
		return "wizard/wzPopup";
	}
	
	//requestChildList
	@RequestMapping(value="/wizard/reportChildList.json")
	public ModelAndView reportChildList(Map<String, Object> model, ReportCodeModel param, HttpServletRequest req, HttpServletResponse res) {
		logger.debug("/wizard/reportChildList.json");
		logger.debug("rpt_par_id : "+param.getRpt_par_id());
		try {	
			List<ReportCodeModel> resultList = reportCodeService.requestChildList(param);		
			model.put("resultList", resultList);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
	
	//tableColumnList
	@RequestMapping(value="/wizard/tableColumnList.json")
	public ModelAndView tableColumnList(Map<String, Object> model, TableSchemaModel param, HttpServletRequest req, HttpServletResponse res) {
		logger.debug("/wizard/tableColumnList.json");
		logger.debug("rpt_par_id : "+param.getRpt_id());
		try {	
			List<TableSchemaModel> resultList = reportCodeService.tableColumnList(param);		
			model.put("resultList", resultList);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
	
	
	//대표번호리스트
	@RequestMapping(value="/wizard/mainTelList.json")
	public ModelAndView mainTelList(Map<String, Object> model, WizardModel wizardModel, HttpServletRequest req, HttpServletResponse res) {
		logger.debug("/wizard/mainTelList.json");
		try {	
			List<LinkedHashMap<String, Object>> resultList = statsIpccService.requestMainTelList(wizardModel);
			model.put("resultList", resultList);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
		
	//상담원리스트
	@RequestMapping(value="/wizard/agentList.json")
	public ModelAndView agentList(Map<String, Object> model, WizardModel wizardModel, HttpServletRequest req, HttpServletResponse res) {
		logger.debug("/wizard/agentList.json");
		try {	
			List<LinkedHashMap<String, Object>> resultList = statsIpccService.requestAgentList(wizardModel);
			model.put("resultList", resultList);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}

	//상담원Tree
	@RequestMapping(value="/wizard/agentTree.json")
	public ModelAndView agentTree(Map<String, Object> model, WizardModel wizardModel, HttpServletRequest req, HttpServletResponse res) {
		logger.debug("/wizard/agentTree.json");
		try {	
			String contextpath = req.getContextPath();	//DB쿼리에서 contextpath+imagepath 만들기 위해
			wizardModel.setContextpath(contextpath); 
			List<LinkedHashMap<String, Object>> resultList = statsIpccService.requestAgentTree(wizardModel);
			model.put("resultList", resultList);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
	
}
