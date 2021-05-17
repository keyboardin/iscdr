package com.insung.isup.statsipcc.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.insung.isup.statsipcc.model.StatsIpccModel;
import com.insung.isup.wizard.model.WizardModel;

@Repository 
@Transactional(value="transactionManagerMs")
public class StatsIpccDao {

	@Autowired
    private SqlSession sqlSessionMs; 
	
	
	//List 
	public List<HashMap<String, Object>> requestList(StatsIpccModel statsIpccModel) throws SQLException {
		return sqlSessionMs.selectList("StatsIpccDao.requestList", statsIpccModel);		
	}
	
	//MainTel List
	public List<LinkedHashMap<String, Object>> requestMainTelList(WizardModel model) throws SQLException {
		return sqlSessionMs.selectList("WizardDao.requestMainTelList", model);
	}
	
	//Agent List
	public List<LinkedHashMap<String, Object>> requestAgentList(WizardModel model) throws SQLException {
		return sqlSessionMs.selectList("WizardDao.requestAgentList", model);
	}
	
	//Agent Tree
	public List<LinkedHashMap<String, Object>> requestAgentTree(WizardModel model) throws SQLException {
		return sqlSessionMs.selectList("WizardDao.requestAgentTree", model);
	}
	
}
