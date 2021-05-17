package com.insung.isup.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.insung.isup.user.model.UserModel;

@Repository @Transactional(value="transactionManager")
public class UserDao {

	@Autowired
    private SqlSession sqlSession; 
	
	//List Count
	public UserModel requestListCount(UserModel userModel) throws Exception {
		return sqlSession.selectOne("UserDao.requestListCount", userModel);	
	} 
	
	//List 
	public List<UserModel> requestList(UserModel userModel) throws Exception {
		return sqlSession.selectList("UserDao.requestList", userModel);		
	}
	
	//Detail
	public UserModel requestDetail(UserModel userModel) throws Exception {
		return sqlSession.selectOne("UserDao.requestDetail", userModel);	
	}	
	
	//Insert
	public void requestInsert(UserModel userModel) throws Exception {
		sqlSession.insert("UserDao.requestInsert", userModel);
	}
	
	//Update
	public void requestUpdate(UserModel userModel) throws Exception {
		sqlSession.update("UserDao.requestUpdate", userModel);
	}
	
	//Delete
	public void requestDelete(UserModel userModel) throws Exception {
		sqlSession.delete("UserDao.requestDelete", userModel);
	}

	//ChangePw
	public void requestChangePw(UserModel userModel) throws Exception {
		sqlSession.update("UserDao.requestChangePw",userModel);
	}

}
