package com.insung.isup.log.controller;

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
import com.insung.isup.log.model.UserLogModel;
import com.insung.isup.log.service.UserLogService;

@Controller
//@PropertySource("classpath:application.properties")
public class UserLogController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(UserLogController.class);
	
	@Autowired
	UserLogService userLogService;	
	
	//사용자관리
	@RequestMapping(value="/log/userLog.do")
	public String userLog(Map<String, Object> model, UserLogModel userLogModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/log/userLog.do >>>>> /log/userLog.jsp");
		return "/log/userLog";
	}	
	
	//requestList
	@RequestMapping(value="/log/userLogList.json")
	public ModelAndView userLogList(Map<String, Object> model, UserLogModel userLogModel, HttpServletRequest req, HttpServletResponse res){
		logger.debug("/log/userLogList.json");
		logger.debug("draw : "+ userLogModel.getDraw());
		logger.debug("start : "+ userLogModel.getStart());
		logger.debug("length : "+ userLogModel.getLength());
		logger.debug("filter : "+ CommonUtil.getFilter(req));
		
		String draw = userLogModel.getDraw();
		userLogModel.setFilter(CommonUtil.getFilter(req));			//filter		
		userLogModel.setSidx(CommonUtil.getOrderColumn(req));		
		userLogModel.setSord(CommonUtil.getOrderDir(req));			//ASC, DESC	
		
		try {		
			String records = userLogService.requestListCount(userLogModel).getRecords()+"";
			List<UserLogModel> resultList = userLogService.requestList(userLogModel);		
			
			model.put("draw", draw);
			model.put("recordsTotal", records);
			model.put("recordsFiltered", records);
			model.put("data", resultList);	
			
		} catch (Exception e) {
			logger.debug("Exception", e);
		}
		return new ModelAndView("jsonView", model);
	}	
	
}
