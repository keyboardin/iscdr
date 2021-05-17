package com.insung.isup.code.controller;

import java.util.ArrayList;
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

import com.insung.isup.code.model.MenuCodeMapModel;
import com.insung.isup.code.model.MenuCodeModel;
import com.insung.isup.code.service.MenuCodeMapService;
import com.insung.isup.code.service.MenuCodeService;
import com.insung.isup.common.controller.BaseController;
import com.insung.isup.common.util.CommonUtil;

@Controller
public class MenuCodeMapController extends BaseController {
	 
	private static final Logger logger = LoggerFactory.getLogger(MenuCodeMapController.class);

	@Autowired
	MenuCodeMapService menuCodeMapService;
		
	@Autowired
	MenuCodeService menuCodeService;
	
	//Menu
	@RequestMapping(value="/code/menuCodeMap.do")
	public String menuCodeMap(Map<String, Object> model, MenuCodeMapModel menuCodeMapModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/code/menuCodeMap.do >>>>> code/menuCodeMap.jsp");
		return "code/menuCodeMap";
	}	   
   
	//menuCodeMapListAll
	@RequestMapping(value="/code/menuCodeMapListAll.json")
	public ModelAndView menuCodeMapListAll(Map<String, Object> model, MenuCodeMapModel menuCodeMapModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/code/menuCodeMapListAll.json");
		
		List<MenuCodeMapModel> resultList = null;
		try {		
			resultList = menuCodeMapService.requestList(menuCodeMapModel);		
			model.put("data", resultList);	
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
	
	//menuCodeMapList
	@RequestMapping(value="/code/menuCodeMapList.json")
	public ModelAndView menuCodeMapList(Map<String, Object> model, MenuCodeMapModel menuCodeMapModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/code/menuCodeMapList.json");
		logger.debug("draw : "+ menuCodeMapModel.getDraw());
		logger.debug("start : "+ menuCodeMapModel.getStart());
		logger.debug("length : "+ menuCodeMapModel.getLength());
		logger.debug("filter : "+ CommonUtil.getFilter(req)); 
		
		String draw = menuCodeMapModel.getDraw();
		menuCodeMapModel.setFilter(CommonUtil.getFilter(req));			//filter		
		menuCodeMapModel.setSidx(CommonUtil.getOrderColumn(req));		
		menuCodeMapModel.setSord(CommonUtil.getOrderDir(req));			//ASC, DESC	
		
		try {		
			String records = menuCodeMapService.requestListCount(menuCodeMapModel).getRecords()+"";
			List<MenuCodeMapModel> resultList = menuCodeMapService.requestList(menuCodeMapModel);		
			
			model.put("draw", draw);
			model.put("recordsTotal", records);
			model.put("recordsFiltered", records);
			model.put("data", resultList);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
	
	
	//menuMenuList
	@RequestMapping(value="/code/menuMapList.json")
	public ModelAndView menuMapList(Map<String, Object> model, MenuCodeMapModel menuCodeMapModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/code/menuMapList.json");
		try {		
			//user_type에 해당하는 메뉴 가져오기
			MenuCodeModel menuCodeModel = new MenuCodeModel();
			menuCodeModel.setUser_type(menuCodeMapModel.getUser_type());
			List<MenuCodeModel> menu_list = menuCodeService.requestMenuMapList(menuCodeModel);		
			List<MenuCodeModel> main_menu_list = createMenuList(menu_list);	
			model.put("resultList", main_menu_list);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
	
	
	//requestInsert
	@RequestMapping(value="/code/menuCodeMapInsert.json")
	public ModelAndView menuCodeMapInsert(Map<String, Object> model, MenuCodeMapModel menuCodeMapModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/code/menuCodeMapInsert.json");
		logger.debug("user_type : "+menuCodeMapModel.getUser_type());
		logger.debug("menu_id : "+menuCodeMapModel.getMenu_id());
		try {	
			List<MenuCodeMapModel> insert_list = new ArrayList<MenuCodeMapModel>();
			String[] menu_arr = CommonUtil.getSplit(menuCodeMapModel.getMenu_id(), ",");
			for(int i=0; i<menu_arr.length; i++) {
				MenuCodeMapModel _menuCodeMapModel = new MenuCodeMapModel();
				_menuCodeMapModel.setUser_type(menuCodeMapModel.getUser_type());
				_menuCodeMapModel.setMenu_id(menu_arr[i]);
				_menuCodeMapModel.setPriority(i);
				insert_list.add(_menuCodeMapModel);
			}
			
			/*StringTokenizer st = new StringTokenizer(menuCodeMapModel.getMenu_id(), ",");
			while(st.hasMoreTokens()) {
				MenuCodeMapModel _menuCodeMapModel = new MenuCodeMapModel();
				_menuCodeMapModel.setUser_type(menuCodeMapModel.getUser_type());
				_menuCodeMapModel.setMenu_id(st.nextToken());
				insert_list.add(_menuCodeMapModel);
			}*/
			
			LinkedHashMap<String, Object> linkedHashMap = new LinkedHashMap<String, Object>();
			linkedHashMap.put("insert_list", insert_list);			
			menuCodeMapService.requestInsertBatch(menuCodeMapModel, linkedHashMap);
			
			model.put("msg","등록 되었습니다");
			model.put("success",1);			
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}
	
	
	//requestDelete
	@RequestMapping(value="/code/menuCodeMapDelete.json")
	public ModelAndView menuCodeMapDelete(Map<String, Object> model, MenuCodeMapModel menuCodeMapModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/code/menuCodeMapDelete.json");
		logger.debug("menu_id : "+ menuCodeMapModel.getMenu_id());
		try {	
			menuCodeMapService.requestDelete(menuCodeMapModel);
			model.put("msg","삭제 되었습니다");
			model.put("success",1);			
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}
	
	
	private List<MenuCodeModel> createMenuList(List<MenuCodeModel> menu_list){
		List<MenuCodeModel> main_menu_list = new ArrayList<MenuCodeModel>();
		List<MenuCodeModel> sub_menu_list = new ArrayList<MenuCodeModel>();
		LinkedHashMap<String, Object> linkedHashMap = new LinkedHashMap<String, Object>();
		
		for(MenuCodeModel menuCodeModel2 : menu_list) {
			String menu_id = menuCodeModel2.getMenu_id();
			String menu_par_id = menuCodeModel2.getMenu_par_id();						
			linkedHashMap.put(menu_id, menuCodeModel2);												
			if(menu_id.equals(menu_par_id)) {
				main_menu_list.add(menuCodeModel2);
			}else {
				sub_menu_list.add(menuCodeModel2);
			}
		}
		
		for(int i=0; i<main_menu_list.size(); i++) {
			MenuCodeModel main_menuCodeModel = main_menu_list.get(i);
			String menu_id = main_menuCodeModel.getMenu_id();
			List<MenuCodeModel> sub_menu_list2 = new ArrayList<MenuCodeModel>();
			for(MenuCodeModel sub_menuCodeModel : sub_menu_list) {
				String menu_par_id = sub_menuCodeModel.getMenu_par_id();
				if(menu_id.equals(menu_par_id)) {
					sub_menu_list2.add(sub_menuCodeModel);
				}
			}
			main_menuCodeModel.setList(sub_menu_list2);
			main_menu_list.set(i, main_menuCodeModel);
		}
		
		return main_menu_list;
		
	}
}