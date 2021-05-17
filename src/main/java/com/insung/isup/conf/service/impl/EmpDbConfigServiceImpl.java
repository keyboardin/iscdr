package com.insung.isup.conf.service.impl;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.insung.isup.conf.dao.EmpDbConfigDao;
import com.insung.isup.conf.model.EmpDbConfigModel;
import com.insung.isup.conf.service.EmpDbConfigService;

@Service
public class EmpDbConfigServiceImpl implements EmpDbConfigService {

	@Autowired
	EmpDbConfigDao empDbConfigDao;
	 
	//List Count
	@Override
	public EmpDbConfigModel requestListCount(EmpDbConfigModel empDbConfigModel) throws Exception {
		return empDbConfigDao.requestListCount(empDbConfigModel);
	}
	
	//List
	public List<EmpDbConfigModel> requestList(EmpDbConfigModel empDbConfigModel) throws Exception {
		return empDbConfigDao.requestList(empDbConfigModel);
	}
	
	//Detail
	public EmpDbConfigModel requestDetail(EmpDbConfigModel empDbConfigModel) throws Exception {
		return empDbConfigDao.requestDetail(empDbConfigModel);
	}
	
	//Insert
	public void requestInsert(EmpDbConfigModel empDbConfigModel) throws Exception {
		empDbConfigDao.requestInsert(empDbConfigModel);
	}
	
	//Update
	public void requestUpdate(EmpDbConfigModel empDbConfigModel) throws Exception {
		empDbConfigDao.requestUpdate(empDbConfigModel);
	}
	
	//Delete
	public void requestDelete(EmpDbConfigModel empDbConfigModel) throws Exception {
		empDbConfigDao.requestDelete(empDbConfigModel);
	}
	
	//Connection Valid
	public List<LinkedHashMap<String, Object>> requestValid(EmpDbConfigModel empDbConfigModel) throws Exception {
		return empDbConfigDao.requestValid(empDbConfigModel);
	}
}
