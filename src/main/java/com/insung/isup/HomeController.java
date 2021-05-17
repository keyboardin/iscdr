package com.insung.isup;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.insung.isup.code.model.CommCodeModel;
import com.insung.isup.code.service.CommCodeService;
import com.insung.isup.common.controller.BaseController;
import com.insung.isup.common.util.CommonUtil;
import com.insung.isup.user.model.UserModel;

@Controller
public class HomeController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
		
	@Autowired
	CommCodeService commCodeService;
	
	//인터셉터
	@RequestMapping(value="/interceptor")
	public String interceptor(Locale locale, Model model){
		logger.debug("/interceptor");
		return "common/interceptor";
	}	

	
	//사용자 로그인 페이지
	@RequestMapping(value="/")
	public String login(Locale locale, Map<String, Object> model, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/");	
		String str_url = "/index";
		
		try {
			HttpSession session = req.getSession();
			UserModel userModel = (UserModel)session.getAttribute("ISUP_USER");			
			
			logger.debug("userModel : "+userModel);
			//로그인이 안되어 있으면 로그인 페이지로
			if(userModel==null){		
				LinkedHashMap<String, Object> linkedHashMap = getSystemInfo();
				str_url = "login/loginForm1";
				if(linkedHashMap.containsKey("login_form")
						&&!CommonUtil.isNull((String)linkedHashMap.get("login_form"))) {
					str_url = "login/" +linkedHashMap.get("login_form");
				}
				model.put("result", linkedHashMap);
				
				//언어설정
				String system_language = "ko";
				if(!CommonUtil.isNull((String)linkedHashMap.get("system_language"))){
					system_language = (String)linkedHashMap.get("system_language");
				};
				locale = new Locale(system_language);
				LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(req);
				localeResolver.setLocale(req, res, locale);
			}			
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		logger.debug("str_url : "+str_url);	
		return str_url;
	}	
	
	
	//관리자  로그인 페이지
	@RequestMapping(value="/admin")
	public String loginAdmin(Locale locale, Map<String, Object> model, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/admin");	
		String str_url = "/index";
		try {
			HttpSession session = req.getSession();
			UserModel userModel = (UserModel)session.getAttribute("ISUP_USER");
			//로그인이 안되어 있으면 로그인 페이지로
			if(userModel==null){		
				LinkedHashMap<String, Object> linkedHashMap = getSystemInfo();
				str_url = "login/loginFormAdmin";
				model.put("result", linkedHashMap);
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		logger.debug("str_url : "+str_url);	
		return str_url;
	}	
	
	//관리자  로그인 페이지2
	@RequestMapping(value="/admin2")
	public String loginAdmin2(Locale locale, Map<String, Object> model, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/admin2");	
		String str_url = "/index";
		try {
			HttpSession session = req.getSession();
			UserModel userModel = (UserModel)session.getAttribute("ISUP_USER");
			//로그인이 안되어 있으면 로그인 페이지로
			if(userModel==null){		
				LinkedHashMap<String, Object> linkedHashMap = getSystemInfo();
				str_url = "login/loginFormAdmin2";
				model.put("result", linkedHashMap);
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		logger.debug("str_url : "+str_url);	
		return str_url;
	}	
	
	
	//시스템관리자 로그인 페이지
	@RequestMapping(value="/system")
	public String loginSystem(Locale locale, Map<String, Object> model, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/system");	
		String str_url = "/index";
		try {
			HttpSession session = req.getSession();
			UserModel userModel = (UserModel)session.getAttribute("ISUP_USER");
			//로그인이 안되어 있으면 로그인 페이지로
			if(userModel==null){		
				LinkedHashMap<String, Object> linkedHashMap = getSystemInfo();
				str_url = "login/loginFormSystem";
				model.put("result", linkedHashMap);
			}		
		}catch(Exception e) {
			e.printStackTrace();
		}
		logger.debug("str_url : "+str_url);	
		return str_url;
	}
	
	//시스템관리자 로그인 페이지2
	@RequestMapping(value="/system2")
	public String loginSystem2(Locale locale, Map<String, Object> model, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/system2");	
		String str_url = "/index";
		try {
			HttpSession session = req.getSession();
			UserModel userModel = (UserModel)session.getAttribute("ISUP_USER");
			//로그인이 안되어 있으면 로그인 페이지로
			if(userModel==null){		
				LinkedHashMap<String, Object> linkedHashMap = getSystemInfo();
				str_url = "login/loginFormSystem2";
				model.put("result", linkedHashMap);
			}		
		}catch(Exception e) {
			e.printStackTrace();
		}
		logger.debug("str_url : "+str_url);	
		return str_url;
	}
	
	//시스템관리자 로그인 페이지3
	@RequestMapping(value = "/system3")
	public String loginSystem3(Locale locale, Map<String, Object> model, HttpServletRequest req,
			HttpServletResponse res) {
		logger.debug("/system3");
		String str_url = "/index";
		try {
			HttpSession session = req.getSession();
			UserModel userModel = (UserModel) session.getAttribute("ISUP_USER");
			// 로그인이 안되어 있으면 로그인 페이지로
			if (userModel == null) {
				LinkedHashMap<String, Object> linkedHashMap = getSystemInfo();
				str_url = "login/loginFormSystem3";
				model.put("result", linkedHashMap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.debug("str_url : " + str_url);
		return str_url;
	}
	
	@RequestMapping(value="/m")
	public String redirectMobile(Locale locale, Map<String, Object> model, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/m");	
		return "mobile/redirectMobile";
	}
	
	
	//세션유지 refresh 페이지
	@RequestMapping(value="/refresh.do")
	public String refresh(){
		logger.debug("/refresh.do");
		return "refresh";
	}
	
	
	//시스템 환경 가져오기
	public LinkedHashMap<String, Object> getSystemInfo() throws Exception {
		LinkedHashMap<String, Object> linkedHashMap = new LinkedHashMap<String, Object>();
		CommCodeModel commCodeModel = new CommCodeModel();
		List<CommCodeModel> resultList = commCodeService.requestConfigCodeList(commCodeModel);
		for(int i=0; i<resultList.size(); i++) {
			commCodeModel = (CommCodeModel)resultList.get(i);
			linkedHashMap.put(commCodeModel.getCode_alias(), commCodeModel.getCode_value());
		}
		return linkedHashMap;
	}
	
	
	//에러시 로그인 폼으로
	@RequestMapping(value="/loginForm.do")
	public String loginForm(Locale locale, Map<String, Object> model, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/loginForm.do");	
		String str_url = "login/loginForm1";
		
		try {
			LinkedHashMap<String, Object> linkedHashMap = getSystemInfo();
			if(linkedHashMap.containsKey("login_form")
					&&!CommonUtil.isNull((String)linkedHashMap.get("login_form"))) {
				str_url = "login/" +linkedHashMap.get("login_form");
			}	
			model.put("result", linkedHashMap);
			
			//언어설정
			String system_language = "ko";
			if(!CommonUtil.isNull((String)linkedHashMap.get("system_language"))){
				system_language = (String)linkedHashMap.get("system_language");
			}
			locale = new Locale(system_language);
			LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(req);
			localeResolver.setLocale(req, res, locale);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		logger.debug("str_url : "+str_url);	
		return str_url;
	}	
}
