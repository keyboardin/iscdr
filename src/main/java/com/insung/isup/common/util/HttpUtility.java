package com.insung.isup.common.util;

/**
 * @(#) HttpUtility.java
 *
 * NOTICE !      You can copy or redistribute this code freely,
 * but you should not remove the information about the copyright notice
 * and the author.
 *
 * @author  WonYoung Lee, javaservice@hanmail.net
 * 2000.04.25. getSessionObjectStore, getNewSessionObjectStore 수정
 *             모든 request의 value를 셋팅할 필요 없음.
 * 2000.11.21. getObjectStoreFromString 메쏘드(문자열-query string을 com.lib.common.servlet.ObjectStore에 저장) 추가
 * 2001.03.07. getSendIPFormat 메쏘드 추가
 * 2001.03.27. getObjectStoreFromString 메쏘드 수정
 * 2001.04.19. getAllCookie 메쏘드 수정
 */

import java.io.UnsupportedEncodingException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

public final class HttpUtility {
	/**
	 * You can't call the constructor.
	 */
	private HttpUtility() {}

	/**
	 * Decode a string from <code>x-www-form-urlencoded</code> format.
	 *
	 * @param   s   an decoded <code>String</code> to be translated.
	 * @return  the original <code>String</code>.
	 * @see		java.net.URLDecoder#decode(java.lang.String)
	 */
	public static String decode(String s) throws UnsupportedEncodingException{
		return java.net.URLDecoder.decode(s, "UTF-8");
	}

	/**
	 * Translates a string into <code>x-www-form-urlencoded</code> format.
	 *
	 * @param   s   <code>String</code> to be translated.
	 * @return  the translated <code>String</code>.
	 * @throws UnsupportedEncodingException
	 * @see		java.net.URLEncoder#encode(java.lang.String)
	 */
	public static String encode(String s) throws UnsupportedEncodingException {
		return java.net.URLEncoder.encode(s, "UTF-8");
	}

	/**
	 * @param req javax.servlet.http.HttpServletRequest
	 * @param name obj name for this SessionObjectStore
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static ObjectStore getObjectStore(HttpServletRequest req)  {
		ObjectStore obj = new ObjectStore("requestbox");

		Enumeration e = req.getParameterNames();
		
		while(e.hasMoreElements()){
			String key = (String)e.nextElement();
			obj.put(key, req.getParameterValues(key));
		}

		return obj;
	}

	/**
	 * @param req javax.servlet.http.HttpServletRequest
	 * @param name obj name for this SessionObjectStore
	 */
	@SuppressWarnings("unchecked")
	public static ObjectStore getObjectStoreFromCookie(HttpServletRequest req)  {
		ObjectStore cookiebox = new ObjectStore("cookiebox");
		javax.servlet.http.Cookie[] cookies = req.getCookies();
		if ( cookies == null ) return cookiebox;

		for(int i=0; cookies != null && i< cookies.length; i++) {
			String key = cookies[i].getName();
			String value = cookies[i].getValue();
			if ( value == null ) value = "";
			String[] values = new String[1];
			values[0] = value;
			cookiebox.put(key,values);
		}
		return cookiebox;

	}

	/**
	 *
	 * @return boolean
	 * @param req HttpServletRequest
	 */
	public static boolean isOverIE50(HttpServletRequest req) {
		String user_agent = (String) req.getHeader("user-agent");

		if ( user_agent == null ) 	return false;

		int index = user_agent.indexOf("MSIE");
		if ( index == -1 ) return false;

		int version = 0;
		try {
			version = Integer.parseInt(user_agent.substring(index+5, index+5+1));
		}
		catch(Exception e){}
		if ( version < 5 ) return false;

		return true;
	}
	
    /**
     * 문자열을 (name, value)의 pair를 가진 com.lib.common.servlet.ObjectStore로 전환한다.
     * @return com.lib.common.servlet.ObjectStore
     * @param source String 변환할 문자열(name=value&name=value...)
     * name과 value사이는 '='로 구분하고, 각 필드는 '&'로 구분한다.
     */
     public static ObjectStore getObjectStoreFromString(String str) {
     	//str = com.lib.common.StringUtility.replaceString(str, "===", "=");
     	ObjectStore obj = new ObjectStore("temp");
     	int index;
     	int beforeIndex = 0;
     	String temp;
     	String name;
     	String value;
     	while((index = str.indexOf("&", beforeIndex)) != -1)
     	{
     		temp = str.substring(beforeIndex, index);
     		name = temp.substring(0, temp.indexOf("="));
     		value = temp.substring(temp.indexOf("=")+1, temp.length());
     		beforeIndex = index + 1;
     		obj.put(name, value);
     		
     	}
     	if(beforeIndex + 1 < str.length())
     	{
     		temp = str.substring(beforeIndex, str.length());
     		name = temp.substring(0, temp.indexOf("="));
     		value = temp.substring(temp.indexOf("=")+1, temp.length());
     		obj.put(name, value);
     	}
     	
        return obj;
    }
}
