package com.insung.isup.conf.service;

import java.util.List;

import com.insung.isup.conf.model.EmpAdConfigModel;

public interface EmpAdConfigService {
	
	//List Count
	public EmpAdConfigModel requestListCount(EmpAdConfigModel empAdConfigModel) throws Exception;
	 
	//List
	public List<EmpAdConfigModel> requestList(EmpAdConfigModel empAdConfigModel) throws Exception;
	
	//Detail
	public EmpAdConfigModel requestDetail(EmpAdConfigModel empAdConfigModel) throws Exception;
	
	//Insert
	public void requestInsert(EmpAdConfigModel empAdConfigModel) throws Exception;
	
	//Update
	public void requestUpdate(EmpAdConfigModel empAdConfigModel) throws Exception;
	
	//Delete
	public void requestDelete(EmpAdConfigModel empAdConfigModel) throws Exception;
	
	//Connection Valid
	public String requestValid(EmpAdConfigModel empAdConfigModel) throws Exception;
	
}
