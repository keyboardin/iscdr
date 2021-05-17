package com.insung.isup.common.dao;

import java.security.SecureRandom;
import java.security.cert.X509Certificate;
import java.util.Base64;
import java.util.Base64.Encoder;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

public class RestBaseDao {
	
	private static final Logger logger = LoggerFactory.getLogger(RestBaseDao.class);		
	
	//GET Rest API
	@SuppressWarnings("rawtypes")
	public String restGet(String str_url, String id, String pw, String type) throws Exception {
		logger.debug("str_url >>>>>>>>>> "+str_url);	
		setCertPass();	//인증서패스
		String auth = getAuth(id, pw);		
		HttpEntity httpEntity = getHeader(type, auth);		
		RestTemplate restTemplate = new RestTemplate();				
		ResponseEntity responseEntity = restTemplate.exchange(str_url, HttpMethod.GET, httpEntity, String.class);
		String result = (String)responseEntity.getBody();		
		logger.debug("statusCode >>>>>>>>> "+responseEntity.getStatusCode());
		logger.debug("result >>>>>>>>> "+result);		
		return result;
	} 	
	
	//Auth
	public String getAuth(String id, String pw) throws Exception {
		String auth = "Basic "; 
		String account = id+":"+pw;
		byte[] targetBytes = account.getBytes();

		Encoder encoder = Base64.getEncoder();
		byte[] encodedBytes = encoder.encode(targetBytes);

		auth += new String(encodedBytes); 
		return auth;
	} 
	
	//Http Header
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public HttpEntity getHeader(String type, String auth) throws Exception {
		HttpHeaders headers = new HttpHeaders();
		headers.set("content-type", type);
		headers.set("Authorization", auth); 
		HttpEntity entity = new HttpEntity(headers);
		return entity;
	} 
	
	//SSL 인증서 패스
	public void setCertPass() throws Exception {  
		TrustManager[] trustAllCerts = new TrustManager[] { 
                new X509TrustManager() {
                    public X509Certificate[] getAcceptedIssuers() {
                        X509Certificate[] myTrustedAnchors = new X509Certificate[0];  
                        return myTrustedAnchors;
                    }        						
                    @Override
                    public void checkClientTrusted(X509Certificate[] certs, String authType) {}
        		  
                    @Override
                    public void checkServerTrusted(X509Certificate[] certs, String authType) {}
                }
        };			
        SSLContext sc = SSLContext.getInstance("TLSv1.2");
        sc.init(null, trustAllCerts, new SecureRandom());
        HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
        HttpsURLConnection.setDefaultHostnameVerifier(new HostnameVerifier() {
            @Override
            public boolean verify(String arg0, SSLSession arg1) {
                return true;
            }
        });
	}
	
	
	//CIMC XML Post
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String restCimcPost(String str_url, String xml_query) throws Exception {
		logger.debug("str_url >>>>>>>>>> "+str_url);	
		logger.debug("xml_query >>>>>>>>>> "+xml_query);
		setCertPass();	//인증서패스
		HttpHeaders httpHeaders = new HttpHeaders();		
		httpHeaders.set("content-type", "application/x-www-form-urlencoded");
		HttpEntity httpEntity = new HttpEntity(xml_query, httpHeaders);		
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity responseEntity = restTemplate.exchange(str_url, HttpMethod.POST, httpEntity, String.class);
		String result = (String)responseEntity.getBody();		
		logger.debug("statusCode >>>>>>>>> "+responseEntity.getStatusCode());
		logger.debug("result >>>>>>>>> "+result);		
		return result;
	}
	
	
}
