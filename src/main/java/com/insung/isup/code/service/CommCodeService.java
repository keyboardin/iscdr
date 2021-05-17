package com.insung.isup.code.service;

import java.util.HashMap;
import java.util.List;

import com.insung.isup.code.model.CommCodeModel;


public interface CommCodeService {
	
	//List Count
	public CommCodeModel requestListCount(CommCodeModel commCodeModel) throws Exception;
	 
	//List
	public List<CommCodeModel> requestList(CommCodeModel commCodeModel) throws Exception;
	
	//Detail
	public CommCodeModel requestDetail(CommCodeModel commCodeModel) throws Exception;
	
	//Insert
	public void requestInsert(CommCodeModel commCodeModel) throws Exception;
	
	//Update
	public void requestUpdate(CommCodeModel commCodeModel) throws Exception;
	
	//Delete
	public void requestDelete(CommCodeModel commCodeModel) throws Exception;
	
	//Group List
	public List<CommCodeModel> requestGroupList(CommCodeModel commCodeModel) throws Exception;
	
	//Tree
	public List<HashMap<String, Object>> requestTree(CommCodeModel commCodeModel) throws Exception;
	
	//Config Code List
	public List<CommCodeModel> requestConfigCodeList(CommCodeModel commCodeModel) throws Exception;
	
}
