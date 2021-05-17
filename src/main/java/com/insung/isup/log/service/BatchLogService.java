package com.insung.isup.log.service;

import java.sql.SQLException;
import java.util.List;

import com.insung.isup.log.model.BatchLogModel;


public interface BatchLogService {	

	//List Count
	public BatchLogModel requestListCount(BatchLogModel batchLogModel) throws SQLException;
	 
	//List
	public List<BatchLogModel> requestList(BatchLogModel batchLogModel) throws SQLException;
	
	//Insert
	public void requestInsert(BatchLogModel batchLogModel) throws SQLException;
	
	
}
