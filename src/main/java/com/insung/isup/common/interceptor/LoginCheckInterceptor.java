package com.insung.isup.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.insung.isup.user.model.UserModel;


@Service
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
		String req_uri = req.getRequestURI();
		logger.debug("Intercepted URI : "+req_uri);
		
		HttpSession session = req.getSession(false);			
		String contextpath = req.getContextPath();
		logger.debug("Intercepted contextpath : "+contextpath);		
		
		//String referer = req.getHeader("referer");
		//logger.debug("referer : "+referer);
		//String sessionId = req.getRequestedSessionId();
		//logger.debug("sessionId : "+sessionId);
		
		
		//phone xml service 예외 처리 - wiseo
		if(req_uri.startsWith("/isSwp/phone/xml")) {
			return true;
		}
		
		if(session==null){
			logger.debug("Intercepted by session : "+session);
			res.sendRedirect(contextpath + "/interceptor?url="+contextpath);
			return false;
		}
		
		UserModel userModel = (UserModel)session.getAttribute("ISUP_USER");
		if(userModel==null){
			//logger.debug("Session Intercepted by system_user_id : "+system_user_id);
			res.sendRedirect(contextpath + "/interceptor?url="+contextpath);
			return false;
		}
		
		return true;
	}
}