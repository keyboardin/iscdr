package com.insung.isup.log.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.insung.isup.log.dao.BatchLogDao;
import com.insung.isup.log.model.BatchLogModel;
import com.insung.isup.log.service.BatchLogService;


@Service
public class BatchLogServiceImpl implements BatchLogService {

	@Autowired
	private BatchLogDao batchLogDao;
		
	//List Count
	@Override
	public BatchLogModel requestListCount(BatchLogModel batchLogModel) throws SQLException{
		return batchLogDao.requestListCount(batchLogModel);
	}
		 
	//List
	@Override
	public List<BatchLogModel> requestList(BatchLogModel batchLogModel) throws SQLException {
		return batchLogDao.requestList(batchLogModel);
	}
		
	//Insert Batch Log
	@Override
	public void requestInsert(BatchLogModel batchLogModel) throws SQLException {
		batchLogDao.requestInsert(batchLogModel);
	}
		
}
