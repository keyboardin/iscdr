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
import com.insung.isup.common.util.CommonUtil;
import com.insung.isup.conf.model.CmConfigModel;
import com.insung.isup.conf.service.CmConfigService;

@Controller
public class CmConfigController extends BaseController {
	 
	private static final Logger logger = LoggerFactory.getLogger(CmConfigController.class);
		
	@Autowired
	CmConfigService cmConfigService;
	
	//initList
	@RequestMapping(value="/conf/cmConfig.do")
	public String cmConfig(Map<String, Object> model, CmConfigModel cmConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/cmConfig.do >>>>> conf/cmConfig.jsp");
		return "conf/cmConfig";
	}


	//requestListAll
	@RequestMapping(value="/conf/cmConfigListAll.json")
	public ModelAndView cmConfigListAll(Map<String, Object> model, CmConfigModel cmConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/cmConfigListAll.json");
		try {
			List<CmConfigModel> resultList = cmConfigService.requestList(cmConfigModel);
			model.put("data", resultList);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}


	//requestList
	@RequestMapping(value="/conf/cmConfigList.json")
	public ModelAndView cmConfigList(Map<String, Object> model, CmConfigModel cmConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/cmConfigList.json");
		logger.debug("draw : "+ cmConfigModel.getDraw()); 
		logger.debug("start : "+ cmConfigModel.getStart());
		logger.debug("length : "+ cmConfigModel.getLength());
		logger.debug("filter : "+ CommonUtil.getFilter(req));
		
		String draw = cmConfigModel.getDraw();
		cmConfigModel.setSearch_value(CommonUtil.getFilter(req));	//filter		
		cmConfigModel.setSidx(CommonUtil.getOrderColumn(req));		
		cmConfigModel.setSord(CommonUtil.getOrderDir(req));			//ASC, DESC	
		
		try {
			String records = cmConfigService.requestListCount(cmConfigModel)+"";
			List<CmConfigModel> resultList = cmConfigService.requestList(cmConfigModel);	
			
			model.put("draw", draw);
			model.put("recordsTotal", records);
			model.put("recordsFiltered", records);
			model.put("data", resultList);		
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}


	//requestDetail
	@RequestMapping(value="/conf/cmConfigDetail.json")
	public ModelAndView cmConfigDetail(Map<String, Object> model, CmConfigModel cmConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/cmConfigDetail.json");
		try {	
			model.put("result", cmConfigService.requestDetail(cmConfigModel));
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}


	//requestInsert
	@RequestMapping(value="/conf/cmConfigInsert.json")
	public ModelAndView cmsConfInsert(Map<String, Object> model, CmConfigModel cmConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/cmsConfInsert.json");
		logger.debug("cm_nm : "+ cmConfigModel.getCm_nm());
		logger.debug("cm_ip : "+ cmConfigModel.getCm_ip());
		logger.debug("cm_port : "+ cmConfigModel.getCm_port());
		logger.debug("cm_id : "+ cmConfigModel.getCm_id());
		logger.debug("cm_ver : "+ cmConfigModel.getCm_ver());
		
		try {
			cmConfigService.requestInsert(cmConfigModel);
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
	@RequestMapping(value="/conf/cmConfigUpdate.json")
	public ModelAndView cmConfigUpdate(Map<String, Object> model, CmConfigModel cmConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/cmConfigUpdate.json");
		logger.debug("cms_no : "+ cmConfigModel.getCm_no());
		logger.debug("cm_nm : "+ cmConfigModel.getCm_nm());
		logger.debug("cm_ip : "+ cmConfigModel.getCm_ip());
		logger.debug("cm_port : "+ cmConfigModel.getCm_port());
		logger.debug("cm_id : "+ cmConfigModel.getCm_id());
		logger.debug("cm_ver : "+ cmConfigModel.getCm_ver());
		
		try {
			cmConfigService.requestUpdate(cmConfigModel);
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
	@RequestMapping(value="/conf/cmConfigDelete.json")
	public ModelAndView cmConfigDelete(Map<String, Object> model, CmConfigModel cmConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/cmConfigDelete.json");
		logger.debug("cms_id : "+ cmConfigModel.getCm_id());
		try {
			cmConfigService.requestDelete(cmConfigModel);
			model.put("msg","삭제 되었습니다");
			model.put("success",1);
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}
	

	//Tree
	@RequestMapping(value="/conf/cmConfigTree.json")
	public ModelAndView cmConfigTree(Map<String, Object> model, CmConfigModel cmConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/cmConfigTree.json");
		String contextpath = req.getContextPath();	//DB쿼리에서 contextpath+imagepath 만들기 위해
		cmConfigModel.setContextpath(contextpath);
		try {			
			List<LinkedHashMap<String, Object>> cmTree = cmConfigService.requestTree(cmConfigModel);
			LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("id", "0");
			map.put("text", "CM");
			map.put("level", 0);
			map.put("path", "/G1");
			map.put("parent", "#");
			map.put("row_type", "grp");
			cmTree.add(map);
			
			model.put("cmTree", cmTree);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		
		return new ModelAndView("jsonView", model);
	}
	
	
	//updateCmPriority
	@RequestMapping(value="/conf/updateCmPriority.json")
	public ModelAndView updateCmPriority(Map<String, Object> model, CmConfigModel cmConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/updateCmPriority.json");
		logger.debug("cm_no : "+ cmConfigModel.getCm_no());
		
		int cm_no = cmConfigModel.getCm_no();
		
		try {
			cmConfigModel.setSidx("priority");
			cmConfigModel.setSord("asc");
			List<CmConfigModel> resultList = cmConfigService.requestList(cmConfigModel);
			for(int i=0; i<resultList.size(); i++) {
				CmConfigModel _cmConfigModel = resultList.get(i);
				int tmp_no = _cmConfigModel.getCm_no();
				if(tmp_no==cm_no) {
					resultList.remove(i);
				} 
			}
			cmConfigModel.setPriority(1);
			cmConfigService.requestUpdate(cmConfigModel);
			
			for(int i=0; i<resultList.size(); i++) {
				CmConfigModel _cmConfigModel = resultList.get(i);
				cmConfigModel = new CmConfigModel();
				cmConfigModel.setPriority(i+2);
				cmConfigModel.setCm_no(_cmConfigModel.getCm_no());
				cmConfigService.requestUpdate(cmConfigModel);
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

	
	//디바이스수량포함 리스트
	@RequestMapping(value="/conf/cmStateList.json")
	public ModelAndView cmStateList(Map<String, Object> model, CmConfigModel cmConfigModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/cmStateList.json");
		try {
			List<CmConfigModel> resultList = cmConfigService.requestCmStateList();
			model.put("data", resultList);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
	
}


