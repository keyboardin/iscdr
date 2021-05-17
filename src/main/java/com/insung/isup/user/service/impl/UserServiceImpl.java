package com.insung.isup.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.insung.isup.user.dao.UserDao;
import com.insung.isup.user.model.UserModel;
import com.insung.isup.user.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	 
	//List Count
	@Override
	public UserModel requestListCount(UserModel userModel) throws Exception {
		return userDao.requestListCount(userModel);
	}
	
	//List
	@Override
	public List<UserModel> requestList(UserModel userModel) throws Exception {
		return userDao.requestList(userModel);
	}
	
	//Detail
	@Override
	public UserModel requestDetail(UserModel userModel) throws Exception {
		return userDao.requestDetail(userModel);
	}
	
	//Insert
	@Override
	public void requestInsert(UserModel userModel) throws Exception {
		userDao.requestInsert(userModel);
	}
	
	//Update
	@Override
	public void requestUpdate(UserModel userModel) throws Exception {
		userDao.requestUpdate(userModel);
	}
	
	//Delete
	@Override
	public void requestDelete(UserModel userModel) throws Exception {
		userDao.requestDelete(userModel);
	}
	
	//ChangePw
	@Override
	public void requestChangePw(UserModel userModel) throws Exception {
		userDao.requestChangePw(userModel);
	}

}
