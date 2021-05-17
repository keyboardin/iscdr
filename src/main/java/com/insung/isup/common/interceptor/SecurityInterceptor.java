package com.insung.isup.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.PropertySource;
//import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Service
public class SecurityInterceptor extends HandlerInterceptorAdapter {
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(SecurityInterceptor.class);
		
	
	@Override
	public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object controller, Exception e) throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object controller, ModelAndView modelAndView) throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object controller) throws Exception{	
		return true;
		
	}
}
