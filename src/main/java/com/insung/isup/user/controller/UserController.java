package com.insung.isup.user.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.insung.isup.common.controller.BaseController;
import com.insung.isup.common.util.CommonUtil;
import com.insung.isup.user.model.UserModel;
import com.insung.isup.user.service.UserService;

@Controller
public class UserController extends BaseController { 
	 
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Value("${db.encrypt_key}") 
	private String db_encrypt_key;	
	
	@Value("${user.default_pw}") 
	private String user_default_pw;	
	
	@Autowired
	UserService userService;
	
	//initList
	@RequestMapping(value="/user.do")
	public String user(Map<String, Object> model, UserModel userModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/user.do >>>>> user/user.jsp");
		return "user/user";
	}
	
	
	//requestListAll
	@RequestMapping(value="/user/userListAll.json")
	public ModelAndView userListAll(Map<String, Object> model, UserModel userModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/user/userListAll.json");
		try {		
			List<UserModel> resultList = userService.requestList(userModel);		
			model.put("data", resultList);	
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
	
	
	//requestList
	@RequestMapping(value="/user/userList.json")
	public ModelAndView userList(Map<String, Object> model, UserModel userModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/user/userList.json");
		logger.debug("draw : "+ userModel.getDraw()); 
		logger.debug("start : "+ userModel.getStart());
		logger.debug("length : "+ userModel.getLength());
		logger.debug("filter : "+ CommonUtil.getFilter(req));	
		logger.debug("user_type : "+userModel.getUser_type());
		
		String draw = userModel.getDraw();
		userModel.setSearch_value(CommonUtil.getFilter(req));	//filter		
		userModel.setSidx(CommonUtil.getOrderColumn(req));		
		userModel.setSord(CommonUtil.getOrderDir(req));			//ASC, DESC	
		
		try {	
			String records = userService.requestListCount(userModel)+"";
			List<UserModel> resultList = userService.requestList(userModel);	
			
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
	@RequestMapping(value="/user/userDetail.json")
	public ModelAndView userDetail(Map<String, Object> model, UserModel userModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/user/userDetail.json");
		logger.debug("user_id : "+userModel.getUser_id());
		
		try {		
			userModel = userService.requestDetail(userModel);		
			model.put("result", userModel);	
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}
		
	//requestInsert
	@RequestMapping(value="/user/userInsert.json")
	public ModelAndView userInsert(Map<String, Object> model, UserModel userModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/user/userInsert.json");
		logger.debug("user_id : "+ userModel.getUser_id());
		try {	
			userModel.setUser_pw(CommonUtil.encrypt(user_default_pw, db_encrypt_key));	//비밀번호 암호화
			userService.requestInsert(userModel);			
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
	@RequestMapping(value="/user/userUpdate.json")
	public ModelAndView userUpdate(Map<String, Object> model, UserModel userModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/user/userUpdate.json");
		logger.debug("user_id : "+ userModel.getUser_id());
		try {			
			userService.requestUpdate(userModel);
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
	@RequestMapping(value="/user/userDelete.json")
	public ModelAndView userDelete(Map<String, Object> model, UserModel userModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/user/userDelete.json");
		logger.debug("user_id : "+ userModel.getUser_id());
		try {				
			userService.requestDelete(userModel);		
			model.put("msg","삭제 되었습니다");
			model.put("success",1);			
		} catch (Exception e) {
			model.put("msg","오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}
	
	
	//아이디 중복 확인
	@RequestMapping(value="/user/userCheckId.json")
	public ModelAndView userCheckId(Map<String, Object> model, UserModel userModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/user/userCheckId.json");
		logger.debug("user_id : "+ userModel.getUser_id());
		try {		
			userModel = userService.requestDetail(userModel);
			if(userModel==null) {
				model.put("msg", "사용할 수 있는 ID 입니다");
				model.put("success", "1");
			}else {
				model.put("msg", "사용중인 ID 입니다");
				model.put("success", "2");
			}
		} catch (Exception e) {
			model.put("msg", "오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView",model);
	}

	
	//비밀번호 변경/초기화
	@RequestMapping(value="/user/userChangePw.json")
	public ModelAndView userChangePw(Map<String, Object> model, UserModel userModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/user/userChangePw.json");
		logger.debug("user_id : "+ userModel.getUser_id());
		//logger.debug("user_pw : "+ user_pw);
		String user_pw = CommonUtil.nullString(userModel.getUser_pw());
		try {		
			if(CommonUtil.isNull(user_pw)){		//비밀번호 초기화
				userModel.setUser_pw(CommonUtil.encrypt(user_default_pw, db_encrypt_key));	//비밀번호 암호화
				model.put("msg", "비밀번호가 "+user_default_pw+" 로 초기화 되었습니다");
			}else{				//비밀번호 변경					//비밀번호 변경
				userModel.setUser_pw(CommonUtil.encrypt(userModel.getUser_pw(), db_encrypt_key));
				model.put("msg", "비밀번호가 변경되었습니다");
			} 
			userService.requestChangePw(userModel);	
			model.put("success",1);
			
		} catch (Exception e) {
			model.put("msg", "오류가 발생했습니다");
			model.put("success",0);
			logger.debug("Exception", e);
		}
		
		return new ModelAndView("jsonView",model);
	}
}