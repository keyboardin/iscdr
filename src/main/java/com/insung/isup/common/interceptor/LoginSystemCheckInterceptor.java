package com.insung.isup.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.insung.isup.common.util.CommonUtil;

@Service
public class LoginSystemCheckInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(LoginSystemCheckInterceptor.class);
 
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		HttpSession session = req.getSession(false);		
		String referer = req.getHeader("referer");
		logger.debug("referer : "+referer);
		//String sessionId = req.getRequestedSessionId();
		//logger.debug("sessionId : "+sessionId);
		
		String contextpath = req.getContextPath();
		logger.debug("Intercepted contextpath : "+contextpath);
		
		if(session==null){
			logger.debug("Intercepted by session : "+session);
			res.sendRedirect(contextpath + "/interceptor?url="+contextpath+"/system");
			return false;
		}		
	
	
		String system_user_id = (String)session.getAttribute("system_user_id");
		logger.debug("system_user_id : "+system_user_id);
		if(CommonUtil.isNull(system_user_id)){
			logger.debug("Session Intercepted by system_user_id : "+system_user_id);
			res.sendRedirect(contextpath + "/interceptor?url="+contextpath+"/system");
			return false;
		}
		
		return true;
	}
}