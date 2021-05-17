package com.insung.isup.conf.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.insung.isup.conf.dao.SystemInfoDao;
import com.insung.isup.conf.model.SystemInfoModel;
import com.insung.isup.conf.service.SystemInfoService;

@Service
public class SystemInfoServiceImpl implements SystemInfoService {
	 
	@Autowired
	private SystemInfoDao systemInfoDao; 
	
	@Override
	public List<SystemInfoModel> requestList(SystemInfoModel systemInfoModel) throws SQLException {
		return systemInfoDao.requestList(systemInfoModel);
	}
	
	@Override
	public void requestUpdate(SystemInfoModel systemInfoModel) throws SQLException {
		systemInfoDao.requestUpdate(systemInfoModel);
	}
	
	
}
