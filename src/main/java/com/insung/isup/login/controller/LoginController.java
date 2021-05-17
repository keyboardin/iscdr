package com.insung.isup.login.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.naming.ConfigurationException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.insung.isup.code.model.CommCodeModel;
import com.insung.isup.code.model.MenuCodeModel;
import com.insung.isup.code.service.CommCodeService;
import com.insung.isup.code.service.MenuCodeService;
import com.insung.isup.common.controller.BaseController;
import com.insung.isup.common.util.CommonUtil;
import com.insung.isup.common.util.iSHA;
import com.insung.isup.emp.model.EmpModel;
import com.insung.isup.emp.service.EmpService;
import com.insung.isup.emp.service.EmpSourceService;
import com.insung.isup.ldap.model.LdapModel;
import com.insung.isup.ldap.service.LdapService;
import com.insung.isup.log.model.UserLogModel;
import com.insung.isup.log.service.UserLogService;
import com.insung.isup.user.model.UserModel;
import com.insung.isup.user.service.UserService;

@Controller
//@PropertySource("classpath:application.properties")
public class LoginController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);	

	@Value("${db.encrypt_key}") 
	private String db_encrypt_key;	

	@Value("${db.encrypt_type}") 
	private String db_encrypt_type;	
	
	@Value("${user.auth_type}") 
	private String user_auth_type;	
	
	
	@Autowired
	UserService userService;	
	
	@Autowired
	MenuCodeService menuCodeService;	
	 
	@Autowired
	CommCodeService commCodeService;
	
	@Autowired
	EmpService empService;
	
	@Autowired
	LdapService ldapService;
	
	@Autowired
	EmpSourceService empSourceService;
	
	@Autowired
	UserLogService userLogService;
	
	
	//사용자 로그인 처리 
	@RequestMapping(value="/login/loginProc.json")
	public ModelAndView loginProc(Map<String, Object> model, UserModel userModel, HttpServletRequest req, HttpServletResponse res) {
		logger.debug("/login/loginProc.json");
		logger.debug("user_id : "+ userModel.getUser_id());		
		logger.debug("user_type : "+ userModel.getUser_type());	
		
		ModelAndView modelAndView = null;
		if("USER".equals(user_auth_type)) {
			modelAndView = loginProcUSER(model, userModel, req, res);
		}else if("EMP".equals(user_auth_type)) {
			modelAndView = loginProcEMP(model, userModel, req, res);
		}else if("LDAP".equals(user_auth_type)) {
			modelAndView = loginProcLDAP(model, userModel, req, res);
		}
		
		return modelAndView;
	}
	
	//@RequestMapping(value="/login/loginProcUSER.json")
	public ModelAndView loginProcUSER(Map<String, Object> model, UserModel userModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/login/loginProcUSER.json");
		//logger.debug("user_id : "+ userModel.getUser_id());		
		//logger.debug("user_type : "+ userModel.getUser_type());	
		
		String user_pw = userModel.getUser_pw();
		String user_type = userModel.getUser_type();
		
		try{
			user_pw = CommonUtil.encrypt(user_pw, db_encrypt_key);
			
			//로그인사용자 데이터 가져오기	
			userModel.setUse_yn("Y");
			userModel.setUser_pw(user_pw);
			userModel = userService.requestDetail(userModel);			
			
			if(userModel != null){									//DB에 사용자가 있는 경우
				if(user_pw.equals(userModel.getUser_pw())) {		//정상로그인	
					userModel.setEmp_no(userModel.getUser_id());
					
					HttpSession session = req.getSession();
					session.setMaxInactiveInterval(3600);	
					session.setAttribute("ISUP_USER", userModel);	//세션에 사용자 정보 담기
					
					//user_type에 해당하는 메뉴 가져오기
					setSessionMenu(session, user_type);				//세션에 메뉴 담기
					setSessionConfig(session);						//세션에 config 담기								
					model.put("success", 1);	
					
					UserLogModel userLogModel = new UserLogModel();
					String ip_addr = req.getRemoteAddr();
					userLogModel.setIp_addr(ip_addr);
					userLogModel.setUser_id(userModel.getUser_id());
					userLogModel.setEmp_nm(userModel.getUser_nm());
					userLogModel.setOrg_nm(userModel.getUser_dep());
					userLogModel.setPos_nm(userModel.getUser_pos());
					userLogService.requestInsert(userLogModel);
					
				} else {
					model.put("msg", "비밀번호를 확인하세요");		
					model.put("success", 3);
				}
			} else {
				model.put("msg", "아이디를 확인하세요");				
				model.put("success", 2);
			}
		} catch (Exception e){			
			model.put("msg", "오류가 발생하였습니다");
			model.put("success", 0);
			logger.debug("Exception", e);	
		}		
		return new ModelAndView("jsonView", model);
	}
	
	
	//사용자 로그인 처리 - 인사정보 DB
	//@RequestMapping(value="/login/loginProcEMP.json")
	public ModelAndView loginProcEMP(Map<String, Object> model, UserModel userModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/login/loginProcEMP.json");
		//logger.debug("user_id : "+ userModel.getUser_id());		
		//logger.debug("user_type : "+ userModel.getUser_type());		
		
		String user_id = userModel.getUser_id();
		String user_pw = userModel.getUser_pw();
		String user_type = userModel.getUser_type();
		
		try{		
			if("SHA".equals(db_encrypt_type)) {
				iSHA sha = new iSHA();
				user_pw = sha.genSHA(user_pw, "", true);
			}else if("MD5".equals(db_encrypt_type)) {
				user_pw = CommonUtil.encryptMD5(user_pw);
			}
			
			//로그인사용자 데이터 가져오기	
			EmpModel empModel = empSourceService.requestEmpDetail(user_id);	
			if(empModel != null){									//DB에 사용자가 있는 경우
				String emp_pw = empModel.getUser_pw();
				if(user_pw.equals(emp_pw)) {	//정상로그인	
					userModel = new UserModel();
					userModel.setUser_id(user_id);
					userModel.setUser_type(user_type);			//사용자
					userModel.setUser_type_nm("사용자");			//사용자
					userModel.setEmp_no(empModel.getEmp_no());
					userModel.setExtension(empModel.getExtension());
					userModel.setUser_nm(empModel.getEmp_nm());
					userModel.setUser_dep(empModel.getOrg_nm());
					userModel.setUser_pos(empModel.getPos_nm());
					userModel.setUser_mobile(empModel.getEmp_mobile());
					userModel.setUser_email(empModel.getEmp_email());
					
					HttpSession session = req.getSession();
					session.setMaxInactiveInterval(3600);
					session.setAttribute("ISUP_USER", userModel);			//세션에 사용자 정보 담기
						
					//user_type에 해당하는 메뉴 가져오기
					setSessionMenu(session, user_type);		//세션에 메뉴 담기
					setSessionConfig(session);				//세션에 config 담기								
					model.put("success", 1);		
					
					UserLogModel userLogModel = new UserLogModel();
					String ip_addr = req.getRemoteAddr();
					userLogModel.setIp_addr(ip_addr);
					userLogModel.setUser_id(empModel.getEmp_no());
					userLogModel.setEmp_nm(empModel.getEmp_nm());
					userLogModel.setOrg_nm(empModel.getOrg_nm());
					userLogModel.setPos_nm(empModel.getPos_nm());
					userLogModel.setExtension(empModel.getExtension());
					userLogService.requestInsert(userLogModel);
					
				} else {						//패스워드가 틀린경우
					model.put("msg", "비밀번호를 확인하세요");		
					model.put("success", 3);
				}
			
			} else {
				model.put("msg", "아이디를 확인하세요");				
				model.put("success", 2);
			}
			
		} catch (Exception e){			
			model.put("msg", "오류가 발생하였습니다");
			model.put("success", 0);
			logger.debug("Exception", e);	
		}		
		return new ModelAndView("jsonView", model);
	}
	
	
	
	//사용자 로그인 처리(LDAP 으로 인증) 
	//@RequestMapping(value="/login/loginProcLDAP.json")
	public ModelAndView loginProcLDAP(Map<String, Object> model, UserModel userModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/login/loginProcLDAP.json");
		//logger.debug("user_id : "+ userModel.getUser_id());		
		//logger.debug("user_type : "+ userModel.getUser_type());		
		
		String user_id = userModel.getUser_id();
		String user_pw = userModel.getUser_pw();
		String user_type = userModel.getUser_type();
		
		try{
			//로그인사용자 데이터 가져오기	
			LdapModel ldapModel = new LdapModel();
			ldapModel.setLdap_id(user_id);
			ldapModel.setLdap_pw(user_pw);
			HashMap<String, Object> userMap = ldapService.requestUserAuth(ldapModel);	//AD에서 사용자 정보 가져오기
			
			if(userMap != null && (Integer)userMap.get("success")==1){		//AD에 사용자가 있는 경우
				userModel.setUser_id(user_id);
				userModel.setUser_pw(user_pw);
				userModel.setUser_type(user_type);			//사용자
				userModel.setUser_type_nm("사용자");			//사용자
				userModel.setUser_nm((String)userMap.get("user_nm"));
				userModel.setUser_dep((String)userMap.get("user_dep"));
				userModel.setUser_mobile((String)userMap.get("user_mobile"));
				userModel.setUser_email((String)userMap.get("user_email")); 
				
//				EmpModel empModel = new EmpModel();
//				empModel.setUser_id(user_id);
//				empModel = empService.requestDetail(empModel);	//AD의 사용자 user_id 인사정보의 사번 가져오기
//				userModel.setEmp_no(empModel.getEmp_no());
//				userModel.setExtension(empModel.getExtension());
				
				HttpSession session = req.getSession();
				session.setMaxInactiveInterval(3600);					
				session.setAttribute("ISUP_USER", userModel);				//세션에 사용자 정보 담기
						
				//user_type에 해당하는 메뉴 가져오기
				setSessionMenu(session, user_type);		//세션에 사용자 메뉴 담기
				setSessionConfig(session);				//세션에 config 담기

				model.put("success", 1);	
//				model.put("emp_no", empModel.getEmp_no());
					
				UserLogModel userLogModel = new UserLogModel();
				String ip_addr = req.getRemoteAddr();
				userLogModel.setIp_addr(ip_addr);
				userLogModel.setUser_id(userModel.getUser_id());
				userLogModel.setEmp_nm(userModel.getUser_nm());
				userLogModel.setOrg_nm(userModel.getUser_dep());
				userLogModel.setPos_nm(userModel.getUser_pos());
				userLogService.requestInsert(userLogModel);
				
			}else{ //사용자ID 일치, PW 틀린경우
				model.put("msg", "아이디/비밀번호 확인하세요");
				model.put("success", 2);
			}	
		} catch (Exception e){			
			model.put("msg", "오류가 발생하였습니다");
			model.put("success", 0);
			logger.debug("Exception", e);	
		}		
		return new ModelAndView("jsonView", model);
	}
	
	
	
	//관리자/시스템관리자 로그인 처리(DB)
	@RequestMapping(value="/login/loginProcAdmin.json")
	public ModelAndView loginProcAdmin(Map<String, Object> model, UserModel userModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/login/loginProcAdmin.json");
		logger.debug("user_id : "+ userModel.getUser_id());		
		logger.debug("user_type : "+ userModel.getUser_type());	
		
		HttpSession session = null;
		
		try{
			String user_pw = userModel.getUser_pw();
			user_pw = CommonUtil.encrypt(user_pw, db_encrypt_key);
			//String user_pw = CommonUtil.encryptPwd(userModel.getUser_pw());	//param
			
			//로그인사용자 데이터 가져오기	
			userModel.setUse_yn("Y");
			userModel.setUser_pw(user_pw);
			userModel = userService.requestDetail(userModel);			
			
			if(userModel != null){										//DB에 사용자가 있는 경우
				session = req.getSession();
				session.setMaxInactiveInterval(3600);					
				session.setAttribute("ISUP_USER", userModel);			//세션에 사용자 정보 담기
					
				//user_type에 해당하는 메뉴 가져오기
				setSessionMenu(session, userModel.getUser_type());		//세션에 메뉴 담기
				setSessionConfig(session);								//세션에 config 담기								
				model.put("success", 1);		
				
				if("0002".equals(userModel.getUser_type())) {
					UserLogModel userLogModel = new UserLogModel();
					String ip_addr = req.getRemoteAddr();
					userLogModel.setIp_addr(ip_addr);
					userLogModel.setUser_id(userModel.getUser_id());
					userLogModel.setEmp_nm(userModel.getUser_nm());
					userLogModel.setOrg_nm(userModel.getUser_dep());
					userLogModel.setPos_nm("admin");
					userLogService.requestInsert(userLogModel);
				}
			
			} else {
				model.put("msg", "아이디/비밀번호 확인하시기 바랍니다");				
				model.put("success", 0);
			}
			//ApplicationContext context=new ClassPathXmlApplicationContext("properties.xml");	
			//PropertiesModel propertiesModel=(PropertiesModel)context.getBean("propertiesModel");			
		} catch (Exception e){			
			model.put("msg", "오류가 발생하였습니다");
			model.put("success", 0);
			logger.debug("Exception", e);	
		}		
		return new ModelAndView("jsonView", model);
	}
	
		
	//로그아웃 처리
	@RequestMapping(value="/login/logoutProc.json")
	public ModelAndView logoutProc(Map<String, Object> model, UserModel userModel, HttpServletRequest req, HttpServletResponse res){		
		logger.debug("/login/logoutProc.json");	
		try{
			HttpSession session = req.getSession(false);	
			session.removeAttribute("ISUP_USER");
			session.removeAttribute("ISUP_MENU");
			session.removeAttribute("ISUP_MENU_FIRST");
			session.removeAttribute("ISUP_CONFIG");
			session.removeAttribute("access_token");
			session.invalidate();
			
			model.put("msg","로그아웃되었습니다"); // 로그아웃되었습니다.
			model.put("success","1");
			
		}catch(Exception e){			
			model.put("msg",""); // 로그아웃 실패했습니다.
			model.put("success","0");
			logger.debug("Exception", e);	
		}
		return new ModelAndView("jsonView", model);
	}
	

	/**
	* 쿠키값을 설정한다.
	* @param cookieInfo
	* @param res
	* @param string
	* @throws ConfigurationException
	* @throws UnsupportedEncodingException
	
    private void setCookie(String cookieInfo, HttpServletResponse res, String cookieName) throws ConfigurationException, UnsupportedEncodingException {
    	cookieInfo = HttpUtility.encode(cookieInfo);
    	Cookie cookie = new Cookie(cookieName, cookieInfo);
    	cookie.setPath("/");
    	cookie.setMaxAge(-1);
    	//cookie.setMaxAge(60 * 120);
    	res.addCookie(cookie);
    }
    */
    
   
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
	
	
	private void setSessionMenu(HttpSession session, String user_type) throws Exception {
		//user_type에 해당하는 메뉴 가져오기
		MenuCodeModel menuCodeModel = new MenuCodeModel();
		menuCodeModel.setUser_type(user_type);
		List<MenuCodeModel> menu_list = menuCodeService.requestMenuMapList(menuCodeModel);		
		List<MenuCodeModel> main_menu_list = createMenuList(menu_list);					
		session.setAttribute("ISUP_MENU", main_menu_list);
		if(menu_list.size()>0) {
			MenuCodeModel _menuInfoModel = menu_list.get(0);
			if(CommonUtil.isNull(_menuInfoModel.getMenu_url())){
				_menuInfoModel = menu_list.get(1);
			} 
			session.setAttribute("ISUP_MENU_FIRST", _menuInfoModel);
		}
	}
	
	
	private void setSessionConfig(HttpSession session) throws Exception {
		//환경설정 가져오기
		CommCodeModel commCodeModel = new CommCodeModel();
		List<CommCodeModel> resultList = commCodeService.requestConfigCodeList(commCodeModel);	//group_id in ('CD02', CD03') 시스템설정, 운영환경
		LinkedHashMap<String, String> linkedHashMap = new LinkedHashMap<String, String>();
		for(int i=0; i<resultList.size(); i++) {
			commCodeModel = (CommCodeModel)resultList.get(i);
			linkedHashMap.put(commCodeModel.getCode_alias(), commCodeModel.getCode_value());
			
			//언어설정
			if("system_language".equals(commCodeModel.getCode_alias())) {
				String language = commCodeModel.getCode_value();
				Locale locale = Locale.KOREAN; 
				if("en".equals(language)) locale = Locale.ENGLISH; 
				session.setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, locale);
			}
		}
		session.setAttribute("ISUP_CONFIG", linkedHashMap);
	}
	
	
}

