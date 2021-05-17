package com.insung.isup.log.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.insung.isup.log.model.UserLogModel;

@Repository @Transactional(value="transactionManager")
public class UserLogDao {

	@Autowired
    private SqlSession sqlSession; 
	
	//List Count
	public UserLogModel requestListCount(UserLogModel userLogModel) throws SQLException {
		return sqlSession.selectOne("UserLogDao.requestListCount", userLogModel);	
	} 
	
	//List
	public List<UserLogModel> requestList(UserLogModel userLogModel) throws SQLException {
		return sqlSession.selectList("UserLogDao.requestList", userLogModel);		
	}
	
	//Insert
	public void requestInsert(UserLogModel userLogModel) throws SQLException {
		sqlSession.insert("UserLogDao.requestInsert", userLogModel);
	}
	
}
