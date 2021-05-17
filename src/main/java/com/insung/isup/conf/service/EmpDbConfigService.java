package com.insung.isup.conf.service;

import java.util.LinkedHashMap;
import java.util.List;

import com.insung.isup.conf.model.EmpDbConfigModel;

public interface EmpDbConfigService {
	
	//List Count
	public EmpDbConfigModel requestListCount(EmpDbConfigModel empDbConfigModel) throws Exception;
	 
	//List
	public List<EmpDbConfigModel> requestList(EmpDbConfigModel empDbConfigModel) throws Exception;
	
	//Detail
	public EmpDbConfigModel requestDetail(EmpDbConfigModel empDbConfigModel) throws Exception;
	
	//Insert
	public void requestInsert(EmpDbConfigModel empDbConfigModel) throws Exception;
	
	//Update
	public void requestUpdate(EmpDbConfigModel empDbConfigModel) throws Exception;
	
	//Delete
	public void requestDelete(EmpDbConfigModel empDbConfigModel) throws Exception;
	
	//Connection Valid
	public List<LinkedHashMap<String, Object>> requestValid(EmpDbConfigModel empDbConfigModel) throws Exception;
}
