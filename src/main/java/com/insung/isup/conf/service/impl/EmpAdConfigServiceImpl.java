package com.insung.isup.conf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.insung.isup.conf.dao.EmpAdConfigDao;
import com.insung.isup.conf.model.EmpAdConfigModel;
import com.insung.isup.conf.service.EmpAdConfigService;

@Service
public class EmpAdConfigServiceImpl implements EmpAdConfigService {

	@Autowired
	EmpAdConfigDao empAdConfigDao;
	 
	//List Count
	@Override
	public EmpAdConfigModel requestListCount(EmpAdConfigModel empAdConfigModel) throws Exception {
		return empAdConfigDao.requestListCount(empAdConfigModel);
	}
	
	//List
	public List<EmpAdConfigModel> requestList(EmpAdConfigModel empAdConfigModel) throws Exception {
		return empAdConfigDao.requestList(empAdConfigModel);
	}
	
	//Detail
	public EmpAdConfigModel requestDetail(EmpAdConfigModel empAdConfigModel) throws Exception {
		return empAdConfigDao.requestDetail(empAdConfigModel);
	}
	
	//Insert
	public void requestInsert(EmpAdConfigModel empAdConfigModel) throws Exception {
		empAdConfigDao.requestInsert(empAdConfigModel);
	}
	
	//Update
	public void requestUpdate(EmpAdConfigModel empAdConfigModel) throws Exception {
		empAdConfigDao.requestUpdate(empAdConfigModel);
	}
	
	//Delete
	public void requestDelete(EmpAdConfigModel empAdConfigModel) throws Exception {
		empAdConfigDao.requestDelete(empAdConfigModel);
	}
	
	//Connection Valid
	public String requestValid(EmpAdConfigModel empAdConfigModel) throws Exception {
		return empAdConfigDao.requestValid(empAdConfigModel);
	}
	
}
