package com.insung.isup.wizard.dao;

import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.insung.isup.wizard.model.WizardModel;

@Repository 
@Transactional(value="transactionManagerMs")
public class WizardDao {

	@Autowired
    private SqlSession sqlSessionMs; 
	
	//List 
	public List<LinkedHashMap<String, Object>> requestList(WizardModel model) throws SQLException {
		return sqlSessionMs.selectList("WizardDao.requestList", model);
	}
	
}
