package com.insung.isup.log.service;

import java.sql.SQLException;
import java.util.List;

import com.insung.isup.log.model.UserLogModel;

public interface UserLogService {
	
	//List Count
	public UserLogModel requestListCount(UserLogModel empModel) throws SQLException;
	 
	//List
	public List<UserLogModel> requestList(UserLogModel empModel) throws SQLException;
		
	//Insert
	public void requestInsert(UserLogModel empModel) throws SQLException;
		
		
}
