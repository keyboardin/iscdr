package com.insung.isup.user.service;

import java.util.List;

import com.insung.isup.user.model.UserModel;

public interface UserService {
	
	//List Count
	public UserModel requestListCount(UserModel userModel) throws Exception;
	 
	//List
	public List<UserModel> requestList(UserModel userModel) throws Exception;
	
	//Detail
	public UserModel requestDetail(UserModel userModel) throws Exception;
	
	//Insert
	public void requestInsert(UserModel userModel) throws Exception;
	
	//Update
	public void requestUpdate(UserModel userModel) throws Exception;
	
	//Delete
	public void requestDelete(UserModel userModel) throws Exception;
	
	//ChangePw
	public void requestChangePw(UserModel userModel) throws Exception;

	
}
