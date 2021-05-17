package com.insung.isup.log.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.insung.isup.log.dao.UserLogDao;
import com.insung.isup.log.model.UserLogModel;
import com.insung.isup.log.service.UserLogService;


@Service
public class UserLogServiceImpl implements UserLogService {
	
	private static final Logger logger = LoggerFactory.getLogger(UserLogServiceImpl.class);	
	
	@Autowired
	private UserLogDao userLogDao;
	 
	//List Count
	@Override
	public UserLogModel requestListCount(UserLogModel userLogModel) throws SQLException{
		return userLogDao.requestListCount(userLogModel);
	}
	
	//List
	@Override
	public List<UserLogModel> requestList(UserLogModel userLogModel) throws SQLException{
		return userLogDao.requestList(userLogModel);
	}
	
	//Insert
	@Override
	public void requestInsert(UserLogModel userLogModel) {
		try {
			userLogDao.requestInsert(userLogModel);
		}catch(Exception e){
			logger.debug("Exception", e);	
		}
	}
}
