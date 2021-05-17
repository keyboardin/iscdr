package com.insung.isup.conf.dao;

import java.util.Hashtable;
import java.util.List;

import javax.naming.AuthenticationException;
import javax.naming.Context;
import javax.naming.ldap.InitialLdapContext;
import javax.naming.ldap.LdapContext;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.insung.isup.conf.model.EmpAdConfigModel;

@Repository @Transactional(value="transactionManager")
public class EmpAdConfigDao {

	private static final Logger logger = LoggerFactory.getLogger(EmpAdConfigDao.class);
	
	@Autowired
    private SqlSession sqlSession; 
	
	//List Count
	public EmpAdConfigModel requestListCount(EmpAdConfigModel empAdConfigModel) throws Exception {
		return sqlSession.selectOne("EmpAdConfigDao.requestListCount", empAdConfigModel);		
	} 
	
	//List 
	public List<EmpAdConfigModel> requestList(EmpAdConfigModel empAdConfigModel) throws Exception {
		return sqlSession.selectList("EmpAdConfigDao.requestList", empAdConfigModel);		
	}
	
	//Detail
	public EmpAdConfigModel requestDetail(EmpAdConfigModel empAdConfigModel) throws Exception {
		return sqlSession.selectOne("EmpAdConfigDao.requestDetail", empAdConfigModel);	
	}	
	
	//Insert
	public void requestInsert(EmpAdConfigModel empAdConfigModel) throws Exception {
		sqlSession.insert("EmpAdConfigDao.requestInsert", empAdConfigModel);
	}
	
	//Update
	public void requestUpdate(EmpAdConfigModel empAdConfigModel) throws Exception {
		sqlSession.update("EmpAdConfigDao.requestUpdate", empAdConfigModel);
	}
	
	//Delete
	public void requestDelete(EmpAdConfigModel empAdConfigModel) throws Exception {
		sqlSession.delete("EmpAdConfigDao.requestDelete", empAdConfigModel);
	}
	
	
	//Connection Valid
	public String requestValid(EmpAdConfigModel empAdConfigModel) throws Exception {
		String ldap_url = "ldap://"+empAdConfigModel.getAd_ip()+":"+empAdConfigModel.getAd_port();
		String ldap_id = empAdConfigModel.getAd_id();
		String ldap_pw = empAdConfigModel.getAd_pw();
		String base_dn = empAdConfigModel.getBase_dn();
		
		logger.debug("ldap_url : "+ldap_url);
		logger.debug("ldap_id : "+ldap_id);
		logger.debug("base_dn : "+base_dn);
		
		Hashtable<String, Object> env = new Hashtable<String, Object>();
        env.put(Context.SECURITY_AUTHENTICATION, "simple");
        env.put(Context.SECURITY_PRINCIPAL, ldap_id);
        env.put(Context.SECURITY_CREDENTIALS, ldap_pw);
        env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
        env.put(Context.PROVIDER_URL, ldap_url);
        env.put("java.naming.ldap.attributes.binary", "objectSID");
        
        LdapContext ctx = null;
        String msg = "Connection Success";
		try {
			ctx = new InitialLdapContext(env, null);			 
			logger.debug("ctx : "+ctx);
		}catch(AuthenticationException e) {
			msg = e.getMessage();
			logger.debug("msg : "+msg);
			if (msg.indexOf("data 525") > 0) {   
				msg = "사용자를 찾을 수 없음";
			} else if (msg.indexOf("data 773") > 0) { 
				msg = "사용자는 암호를 재설정해야합니다";
			} else if (msg.indexOf("data 52e") > 0) {
				msg = "ID와 비밀번호가 일치하지 않습니다";
			} else if (msg.indexOf("data 533") > 0) {
				msg = "입력한 ID는 비활성화 상태 입니다";
			} else if(msg.indexOf("data 532") > 0) {
				msg = "암호가 만료되었습니다";
			} else if(msg.indexOf("data 701") > 0) {
				msg = "AD에서 계정이 만료됨";
			}					
		} finally {
			if(ctx!=null) ctx.close();
		}
		
		return msg;
	}
}
