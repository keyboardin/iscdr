package com.insung.isup.ldap.dao;

import java.util.HashMap;
import java.util.Hashtable;

import javax.naming.AuthenticationException;
import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
import javax.naming.ldap.InitialLdapContext;
import javax.naming.ldap.LdapContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.insung.isup.ldap.model.LdapModel;

@Repository @Transactional(value="transactionManager")
public class LdapDao {

	private static final Logger logger = LoggerFactory.getLogger(LdapDao.class);
	
	//@Autowired
    //private SqlSession sqlSession; 
	
	//사용자 인증
	public HashMap<String, Object> requestUserAuth(LdapModel ldapModel) throws Exception {
		HashMap<String, Object> userMap = new HashMap<String, Object>();
		String ldap_server = "ldap://"+ldapModel.getLdap_ip()+":"+ldapModel.getLdap_port();
		String ldap_id = String.format("cn=%s", ldapModel.getLdap_id())+","+ldapModel.getBase_dn();
		String ldap_pw = ldapModel.getLdap_pw();
		String base_dn = ldapModel.getBase_dn();
		String search_filter = String.format("cn=%s", ldapModel.getLdap_id()); 
		
		logger.debug("ldap_server : "+ldap_server);
		logger.debug("ldap_id : "+ldap_id);
		logger.debug("base_dn : "+base_dn);
		logger.debug("search_filter : "+search_filter);
		
		Hashtable<String, Object> env = new Hashtable<String, Object>();
        env.put(Context.SECURITY_AUTHENTICATION, "simple");
        env.put(Context.SECURITY_PRINCIPAL, ldap_id);
        env.put(Context.SECURITY_CREDENTIALS, ldap_pw);
        env.put(Context.PROVIDER_URL, ldap_server);
        env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
        //env.put("java.naming.ldap.attributes.binary", "objectSID");
        
        LdapContext ctx = null;
        String msg = "Connection Success";
		try {
			ctx = new InitialLdapContext(env, null);			 
			logger.debug("ctx : "+ctx);
			
			SearchControls ctls = new SearchControls();
			ctls.setSearchScope(SearchControls.SUBTREE_SCOPE);
			//ctls.setReturningAttributes(new String[] {"cn", "displayname", "department", "mobile", "mail"});
			String[] column =  {"cn", "displayname", "department", "mobile", "mail"};
			ctls.setReturningAttributes(column);		
			
			NamingEnumeration<SearchResult> results = ctx.search(base_dn, search_filter, ctls);
			SearchResult searchResult = null;
			while(results.hasMore()) {
				searchResult = (SearchResult) results.nextElement();
				String user_id = searchResult.getAttributes().get("cn").get().toString();
				String user_nm = searchResult.getAttributes().get("displayName").get().toString();
				String user_dep = searchResult.getAttributes().get("department").get().toString();
				String user_mobile = searchResult.getAttributes().get("mobile").get().toString();
				String user_email = searchResult.getAttributes().get("mail").get().toString();
				userMap.put("user_id", user_id);
				userMap.put("user_nm", user_nm);
				userMap.put("user_dep", user_dep);
				userMap.put("user_mobile", user_mobile);
				userMap.put("user_email", user_email);				
				logger.debug("user_id : "+user_id);
				logger.debug("user_nm : "+user_nm);
				logger.debug("user_dep : "+user_dep);
				logger.debug("user_mobile : "+user_mobile);
				logger.debug("user_email : "+user_email);
			}
			userMap.put("msg", "Login Success");
			userMap.put("success", 1);
		}catch(AuthenticationException e) {
			msg = e.getMessage();
			logger.debug("msg : "+msg);
			if (msg.indexOf("data 525") > 0) {   
				msg = "사용자를 찾을 수 없습니다";
			} else if (msg.indexOf("data 773") > 0) { 
				msg = "사용자는 암호를 재설정해야합니다";
			} else if (msg.indexOf("data 52e") > 0) {
				msg = "아이디/비밀번호 확인하시기 바랍니다";
			} else if (msg.indexOf("data 533") > 0) {
				msg = "입력한 ID는 비활성화 상태 입니다";
			} else if(msg.indexOf("data 532") > 0) {
				msg = "암호가 만료되었습니다";
			} else if(msg.indexOf("data 701") > 0) {
				msg = "AD에서 계정이 만료되었습니다";
			}			
			userMap.put("msg", msg);
			userMap.put("success", 0);
		} finally {
			if(ctx!=null) ctx.close();
		}
		
		return userMap;
	}
}
