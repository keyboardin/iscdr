package com.insung.isup.code.controller;

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

import com.insung.isup.code.model.MenuCodeModel;
import com.insung.isup.code.service.MenuCodeService;
import com.insung.isup.common.controller.BaseController;
import com.insung.isup.common.util.CommonUtil;

@Controller
public class MenuCodeController extends BaseController {
	 
	private static final Logger logger = LoggerFactory.getLogger(MenuCodeController.class);

	@Autowired
	MenuCodeService menuCodeService;
		
	//Menu
	@RequestMapping(value="/code/menuCode.do")
	public String menuCode(Map<String, Object> model, MenuCodeModel menuCodeModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/code/menuCode.do >>>>> code/menuCode.jsp");
		return "code/menuCode";
	}
	   
    
	//requestListAll
	@RequestMapping(value="/code/menuCodeListAll.json")
	public ModelAndView menuCodeListAll(Map<String, Object> model, MenuCodeModel menuCodeModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/code/menuCodeListAll.json");
		logger.debug("menu_par_id : "+menuCodeModel.getMenu_par_id());
		try {		
			List<MenuCodeModel> resultList = menuCodeService.requestList(menuCodeModel);		
			model.put("data", resultList);	
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}

	
	//requestList
	@RequestMapping(value="/code/menuCodeList.json")
	public ModelAndView menuCodeList(Map<String, Object> model, MenuCodeModel menuCodeModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/code/menuCodeList.json");
		logger.debug("draw : "+ menuCodeModel.getDraw());
		logger.debug("start : "+ menuCodeModel.getStart());
		logger.debug("length : "+ menuCodeModel.getLength());
		logger.debug("filter : "+ CommonUtil.getFilter(req));	
		logger.debug("menu_par_id : "+menuCodeModel.getMenu_par_id());
		
		String draw = menuCodeModel.getDraw();
		menuCodeModel.setSearch_value(CommonUtil.getFilter(req));	//filter		
		menuCodeModel.setSidx(CommonUtil.getOrderColumn(req));		
		menuCodeModel.setSord(CommonUtil.getOrderDir(req));			//ASC, DESC					
		
		try {		
			String records = menuCodeService.requestListCount(menuCodeModel).getRecords()+"";
			List<MenuCodeModel> resultList = menuCodeService.requestList(menuCodeModel);	
			
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
	@RequestMapping(value="/code/menuCodeDetail.json")
	public ModelAndView menuCodeDetail(Map<String, Object> model, MenuCodeModel menuCodeModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/code/menuCodeDetail.json");
		logger.debug("menu_id : "+menuCodeModel.getMenu_id());
		logger.debug("sord : "+menuCodeModel.getSord());
		
		try {		
			menuCodeModel = menuCodeService.requestDetail(menuCodeModel);		
			model.put("result", menuCodeModel);	
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
	
	
	//requestInsert
	@RequestMapping(value="/code/menuCodeInsert.json")
	public ModelAndView menuCodeInsert(Map<String, Object> model, MenuCodeModel menuCodeModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/code/menuCodeInsert.json");
		try {	
			menuCodeService.requestInsert(menuCodeModel);
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
	@RequestMapping(value="/code/menuCodeUpdate.json")
	public ModelAndView menuCodeUpdate(Map<String, Object> model, MenuCodeModel menuCodeModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/code/menuCodeUpdate.json");
		logger.debug("menu_id : "+ menuCodeModel.getMenu_id());
		try {	
			menuCodeService.requestUpdate(menuCodeModel);
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
	@RequestMapping(value="/code/menuCodeDelete.json")
	public ModelAndView menuCodeDelete(Map<String, Object> model, MenuCodeModel menuCodeModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/code/menuCodeDelete.json");
		logger.debug("menu_id : "+ menuCodeModel.getMenu_id());
		try {	
			menuCodeService.requestDelete(menuCodeModel);
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
	@RequestMapping(value="/code/menuCodeTree.json")
	public ModelAndView menuCodeTree(Map<String, Object> model, MenuCodeModel menuCodeModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/code/menuCodeTree.json");
		try {		
			List<HashMap<String, Object>> resultTree = menuCodeService.requestTree(menuCodeModel);	
			model.put("resultTree", resultTree);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
	
}