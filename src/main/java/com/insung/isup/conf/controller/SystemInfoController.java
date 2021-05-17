package com.insung.isup.conf.controller;

import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.insung.isup.common.controller.BaseController;
import com.insung.isup.code.model.CommCodeModel;
import com.insung.isup.code.service.CommCodeService;
import com.insung.isup.conf.model.SystemInfoModel;

@Controller
public class SystemInfoController extends BaseController {
	 
	private static final Logger logger = LoggerFactory.getLogger(SystemInfoController.class);
	
	@Autowired
	CommCodeService commCodeService;
	
	//initList
	@RequestMapping(value="/conf/systemInfo.do")
	public String systemInfo(Map<String, Object> model, CommCodeModel commCodeModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/systemInfo.do >>>>> conf/systemInfo.jsp");
		try {	
			commCodeModel.setGroup_id("CD02");	//시스템설정
			List<CommCodeModel> resultList = commCodeService.requestList(commCodeModel);	
			model.put("resultList", resultList);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return "conf/systemInfo";
	}
	
	//initList
	@RequestMapping(value="/conf/systemInfo2.do")
	public String systemInfo2(Map<String, Object> model, CommCodeModel commCodeModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/systemInfo2.do >>>>> conf/systemInfo2.jsp");
		try {	
			commCodeModel.setGroup_id("CD02");	//시스템설정
			List<CommCodeModel> resultList = commCodeService.requestList(commCodeModel);	
			model.put("resultList", resultList);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return "conf/systemInfo2";
	}
   
	//requestList
	@RequestMapping(value="/conf/systemInfoList.json")
	public ModelAndView systemInfoList(Map<String, Object> model, CommCodeModel commCodeModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/systemInfoList.json");
		try {	
			List<CommCodeModel> resultList = commCodeService.requestList(commCodeModel);
			model.put("resultList", resultList);
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
	
	
	//systemDefaultUpdate
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/conf/systemDefaultUpdate.json")
	public ModelAndView systemDefaultUpdate(Map<String, Object> model, SystemInfoModel systemInfoModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/systemInfoUpdate.json");
		String system_name = systemInfoModel.getSystem_name();
		String system_version = systemInfoModel.getSystem_version();
		String company_name = systemInfoModel.getCompany_name();
		String company_en_name = systemInfoModel.getCompany_en_name();
		String solution_name = systemInfoModel.getSolution_name();
		try {	
			CommCodeModel commCodeModel = new CommCodeModel();
			commCodeModel.setGroup_id("CD02");
			//system_name
			commCodeModel.setCode_id("0001");
			commCodeModel.setCode_value(system_name);
			commCodeService.requestUpdate(commCodeModel);
			
			//system_version
			commCodeModel.setCode_id("0002");
			commCodeModel.setCode_value(system_version);
			commCodeService.requestUpdate(commCodeModel);
			
			//company_name
			commCodeModel.setCode_id("0003");
			commCodeModel.setCode_value(company_name);
			commCodeService.requestUpdate(commCodeModel);
			
			//company_en_name
			commCodeModel.setCode_id("0004");
			commCodeModel.setCode_value(company_en_name);
			commCodeService.requestUpdate(commCodeModel);
			
			//company_en_name
			commCodeModel.setCode_id("0008");
			commCodeModel.setCode_value(solution_name);
			commCodeService.requestUpdate(commCodeModel);
			
			HttpSession session = req.getSession(false);	
			LinkedHashMap<String, String> linkedHashMap = (LinkedHashMap<String, String>)session.getAttribute("ISUP_CONFIG");
			linkedHashMap.put("system_name", system_name);
			linkedHashMap.put("system_version", system_version);
			linkedHashMap.put("company_name", company_name);
			linkedHashMap.put("company_en_name", company_en_name);
			linkedHashMap.put("solution_name", solution_name);
			session.setAttribute("ISUP_CONFIG", linkedHashMap);
			
			model.put("msg","수정 되었습니다");
			model.put("success",1);
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}
	
	
	
	//systemSkinUpdate
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/conf/systemSkinUpdate.json")
	public ModelAndView systemSkinUpdate(Map<String, Object> model, SystemInfoModel systemInfoModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/systemSkinUpdate.json");
		String system_skin = systemInfoModel.getSystem_skin();
		try {		
			CommCodeModel commCodeModel = new CommCodeModel();
			commCodeModel.setGroup_id("CD02");
			
			//system_skin
			commCodeModel.setCode_id("0006");
			commCodeModel.setCode_value(system_skin);
			commCodeService.requestUpdate(commCodeModel);
						
			HttpSession session = req.getSession(false);	
			LinkedHashMap<String, String> linkedHashMap = (LinkedHashMap<String, String>)session.getAttribute("ISUP_CONFIG");
			linkedHashMap.put("system_skin", system_skin);
			session.setAttribute("ISUP_CONFIG", linkedHashMap);
			
			model.put("msg","수정 되었습니다");
			model.put("success",1);
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}
	
	
	//systemThemeUpdate
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/conf/systemThemeUpdate.json")
	public ModelAndView systemThemeUpdate(Map<String, Object> model, SystemInfoModel systemInfoModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/systemThemeUpdate.json");
		String system_theme = systemInfoModel.getSystem_theme();
		String system_font = systemInfoModel.getSystem_font();
		try {		
			CommCodeModel commCodeModel = new CommCodeModel();
			commCodeModel.setGroup_id("CD02");
			
			//system_theme
			commCodeModel.setCode_id("0009");
			commCodeModel.setCode_value(system_theme);
			commCodeService.requestUpdate(commCodeModel);
			
			//system_font
			commCodeModel.setCode_id("0010");
			commCodeModel.setCode_value(system_font);
			commCodeService.requestUpdate(commCodeModel);
						
			HttpSession session = req.getSession(false);	
			LinkedHashMap<String, String> linkedHashMap = (LinkedHashMap<String, String>)session.getAttribute("ISUP_CONFIG");
			linkedHashMap.put("system_theme", system_theme);
			linkedHashMap.put("system_font", system_font);
			session.setAttribute("ISUP_CONFIG", linkedHashMap);
			
			model.put("msg","수정 되었습니다");
			model.put("success",1);
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}
	
	
	//systemLoginFormUpdate
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/conf/systemLoginFormUpdate.json")
	public ModelAndView systemLoginFormUpdate(Map<String, Object> model, SystemInfoModel systemInfoModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/systemLoginFormUpdate.json");
		String system_login = systemInfoModel.getSystem_login();
		try {		
			CommCodeModel commCodeModel = new CommCodeModel();
			commCodeModel.setGroup_id("CD02");
			
			//system_skin
			commCodeModel.setCode_id("0007");
			commCodeModel.setCode_value(system_login);
			commCodeService.requestUpdate(commCodeModel);
						
			HttpSession session = req.getSession(false);	
			LinkedHashMap<String, String> linkedHashMap = (LinkedHashMap<String, String>)session.getAttribute("ISUP_CONFIG");
			linkedHashMap.put("system_login", system_login);
			session.setAttribute("ISUP_CONFIG", linkedHashMap);
			
			model.put("msg","수정 되었습니다");
			model.put("success",1);
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}
	
	
	//systemLogoUpdate
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/conf/systemLogoUpdate.json")
	public ModelAndView systemLogoUpdate(Map<String, Object> model, SystemInfoModel systemInfoModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/systemLogoUpdate.json");
		try {
			String path = req.getSession().getServletContext().getRealPath("/")+"/static/common/images/";
			logger.debug("path : "+path);		
			
			//파일 파싱
			MultipartHttpServletRequest multipartReq = (MultipartHttpServletRequest)req;
			MultipartFile multipartFile = multipartReq.getFile("file"); 
			
			String org_file_name = multipartFile.getOriginalFilename();
			String file_name = path+"/"+org_file_name;	
			logger.debug("originalFileName : "+org_file_name);	
			logger.debug("file_name : "+file_name);			
			
			FileOutputStream fos = new FileOutputStream(file_name);
		    fos.write(multipartFile.getBytes());
	        fos.close();	
			
	        CommCodeModel commCodeModel = new CommCodeModel();
			commCodeModel.setGroup_id("CD02");
			
			//logo_file
			commCodeModel.setCode_id("0005");
			commCodeModel.setCode_value(org_file_name);
			commCodeService.requestUpdate(commCodeModel);
									
			HttpSession session = req.getSession(false);	
			LinkedHashMap<String, String> linkedHashMap = (LinkedHashMap<String, String>)session.getAttribute("ISUP_CONFIG");
			linkedHashMap.put("logo_file", org_file_name);
			session.setAttribute("ISUP_CONFIG", linkedHashMap);
	        
			model.put("logo_file", org_file_name);
			model.put("msg","수정 되었습니다");
			model.put("success",1);
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}
	
	
	//systemLogoDelete
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/conf/systemLogoDelete.json")
	public ModelAndView systemLogoDelete(Map<String, Object> model, SystemInfoModel systemInfoModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/user/systemLogoDelete.json");
		try {				
			 CommCodeModel commCodeModel = new CommCodeModel();
			commCodeModel.setGroup_id("CD02");
			
			//logo_file
			commCodeModel.setCode_id("0005");
			commCodeModel.setCode_value("");
			commCodeService.requestUpdate(commCodeModel);
						
			HttpSession session = req.getSession(false);	
			LinkedHashMap<String, String> linkedHashMap = (LinkedHashMap<String, String>)session.getAttribute("ISUP_CONFIG");
			linkedHashMap.put("logo_file", "");
			session.setAttribute("ISUP_CONFIG", linkedHashMap);
	        		
			model.put("msg","삭제 되었습니다");
			model.put("success",1);			
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}
	
	
	//화면스킨 미리보기
	@RequestMapping(value="/conf/skinPreview.do")
	public String skinPreview(Map<String, Object> model, SystemInfoModel systemInfoModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/conf/skinPreview.do >>>>> conf/skinPreview.jsp");
		logger.debug("system_skin : "+systemInfoModel.getSystem_skin());
		return "conf/skinPreview";
	}
	
	
	//로그인폼 미리보기
	@RequestMapping(value="/conf/loginPreview.do")
	public String loginPreview(Map<String, Object> model, SystemInfoModel systemInfoModel, HttpServletRequest req, HttpServletResponse res){
		String system_login = systemInfoModel.getSystem_login();
		String system_skin = systemInfoModel.getSystem_skin();
		logger.debug("/conf/loginPreview.do >>>>> conf/"+system_login+".jsp");
		logger.debug("system_login : "+system_login);
		
		LinkedHashMap<String, Object> linkedHashMap = new LinkedHashMap<String, Object>();
		linkedHashMap.put("system_skin", system_skin);
		model.put("result", linkedHashMap);
		
		return "login/"+system_login;
	}
	
}


