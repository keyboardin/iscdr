package com.insung.isup.common.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;

import com.insung.isup.common.model.BaseModel;
import com.insung.isup.user.model.UserModel;

public class BaseController {	
	
	//@Autowired
	//private MessageSource messageSource;
	
	//@Autowired
	//private RestTemplate restTemplate;
	
	//@Bean
	//public static PropertySourcesPlaceholderConfigurer placeHolderConfigurer() {
	//	return new PropertySourcesPlaceholderConfigurer();
	//} 
	
	//@Value("${rest.url}") 
	//public String REST_SERVER_URL;
	
	//REST API 호출쪽에서 인증키 세팅한 HttpHeaders 리턴
	protected HttpHeaders getHttpHeader(){
		HttpHeaders headers = new HttpHeaders();
		return headers;
	}
		
	//REST API 호출쪽에서 인증키를 가진 http header를 세팅한 HttpEntity 리턴
	@SuppressWarnings({ "rawtypes", "unchecked" })
	protected HttpEntity getHttpEntity(){
		HttpHeaders headers = new HttpHeaders();
		HttpEntity entity = new HttpEntity(headers);	
		return entity;
	}
	
	//rest api timeout
//	protected ClientHttpRequestFactory clientHttpRequestFactory(){
//        HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
//        factory.setReadTimeout(5000);
//        factory.setConnectTimeout(5000);
//        return factory;
//    }
//	//RestTemplate set timeout(servlet-context.xml)
//	protected RestTemplate getRestTemplate(){
//	
//		return restTemplate;
//	}
	protected void setPageInfo(Map<String, Object> model, BaseModel baseModel){
        model.put("total",Double.valueOf(Math.ceil((float)baseModel.getRecords()/(float)baseModel.getRows())));
        model.put("page", baseModel.getPage()==0 ? 1:baseModel.getPage());
        model.put("records",Integer.valueOf(baseModel.getRecords())); 
    }
	
	protected String getStartPage(BaseModel baseModel) {
		int page = baseModel.getPage()==0 ? 1:baseModel.getPage();
		return ((page-1)*baseModel.getRows())+"";
	}
	
	protected UserModel getUserSession(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		return (UserModel)session.getAttribute("ISUP_USER");	
	}
	
	protected String getOrderColumn(HttpServletRequest req) throws Exception {
		return req.getParameter("columns["+req.getParameter("order[0][column]")+"][data]");
	}
	
}
