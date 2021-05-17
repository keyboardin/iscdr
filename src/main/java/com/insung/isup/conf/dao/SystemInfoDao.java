package com.insung.isup.conf.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.insung.isup.conf.model.SystemInfoModel;

@Repository @Transactional(value="transactionManager")
public class SystemInfoDao {

	@Autowired
    private SqlSession sqlSession; 
	
	
	//List 
	public List<SystemInfoModel> requestList(SystemInfoModel systemInfoModel) throws SQLException {
		return sqlSession.selectList("CommCodeDao.requestSystemInfoList", systemInfoModel);		
	}
	
	
	//Update
	public void requestUpdate(SystemInfoModel systemInfoModel) throws SQLException {
		sqlSession.update("CommCodeDao.requestSystemInfoUpdate", systemInfoModel);
	}
	
	
}
