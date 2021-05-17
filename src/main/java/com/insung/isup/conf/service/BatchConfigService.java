package com.insung.isup.conf.service;

import java.sql.SQLException;
import java.util.List;

import com.insung.isup.conf.model.BatchConfigModel;


public interface BatchConfigService {
	
	//List Count
	public BatchConfigModel requestListCount(BatchConfigModel batchConfigModel) throws SQLException;
	 
	//List
	public List<BatchConfigModel> requestList(BatchConfigModel batchConfigModel) throws SQLException;
	
	//Detail
	public BatchConfigModel requestDetail(BatchConfigModel batchConfigModel) throws SQLException;
	
	//Insert
	public void requestInsert(BatchConfigModel batchConfigModel) throws SQLException;
	
	//Update
	public void requestUpdate(BatchConfigModel batchConfigModel) throws SQLException;
	
	//Delete
	public void requestDelete(BatchConfigModel batchConfigModel) throws SQLException;

	
	
}
