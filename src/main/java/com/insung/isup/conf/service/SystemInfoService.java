package com.insung.isup.conf.service;

import java.sql.SQLException;
import java.util.List;

import com.insung.isup.conf.model.SystemInfoModel;

public interface SystemInfoService {
	 
	//List
	public List<SystemInfoModel> requestList(SystemInfoModel systemInfoModel) throws SQLException;
	
	//Update
	public void requestUpdate(SystemInfoModel systemInfoModel) throws SQLException;
	
}
