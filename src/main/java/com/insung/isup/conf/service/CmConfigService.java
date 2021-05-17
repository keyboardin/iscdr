package com.insung.isup.conf.service;

import java.util.LinkedHashMap;
import java.util.List;

import com.insung.isup.conf.model.CmConfigModel;

public interface CmConfigService {	

	//List Count
	public CmConfigModel requestListCount(CmConfigModel cmConfigModel) throws Exception;
	 
	//List
	public List<CmConfigModel> requestList(CmConfigModel cmConfigModel) throws Exception;
	
	//Detail
	public CmConfigModel requestDetail(CmConfigModel cmConfigModel) throws Exception;
	
	//Insert
	public void requestInsert(CmConfigModel cmConfigModel) throws Exception;
	
	//Update
	public void requestUpdate(CmConfigModel cmConfigModel) throws Exception;
	
	//Delete
	public void requestDelete(CmConfigModel cmConfigModel) throws Exception;
		
	//Tree
	public List<LinkedHashMap<String, Object>> requestTree(CmConfigModel cmConfigModel) throws Exception;
	
	
	//디바이스수량포함 리스트
	public List<CmConfigModel> requestCmStateList() throws Exception ;
	
}
