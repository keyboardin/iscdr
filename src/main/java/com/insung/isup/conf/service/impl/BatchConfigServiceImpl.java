package com.insung.isup.conf.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.insung.isup.conf.dao.BatchConfigDao;
import com.insung.isup.conf.model.BatchConfigModel;
import com.insung.isup.conf.service.BatchConfigService;


@Service
public class BatchConfigServiceImpl implements BatchConfigService {

	@Autowired
	private BatchConfigDao batchConfigDao;
	 
	//List Count
	@Override
	public BatchConfigModel requestListCount(BatchConfigModel batchConfigModel) throws SQLException {
		return batchConfigDao.requestListCount(batchConfigModel);
	}
	
	//List
	@Override
	public List<BatchConfigModel> requestList(BatchConfigModel batchConfigModel) throws SQLException {
		return batchConfigDao.requestList(batchConfigModel);
	}
	
	//Detail
	@Override
	public BatchConfigModel requestDetail(BatchConfigModel batchConfigModel) throws SQLException {
		return batchConfigDao.requestDetail(batchConfigModel);
	}
	
	//Insert
	@Override
	public void requestInsert(BatchConfigModel batchConfigModel) throws SQLException {
		batchConfigDao.requestInsert(batchConfigModel);
	}
	
	//Update
	@Override
	public void requestUpdate(BatchConfigModel batchConfigModel) throws SQLException {
		batchConfigDao.requestUpdate(batchConfigModel);
	}
	
	//Delete
	@Override
	public void requestDelete(BatchConfigModel batchConfigModel) throws SQLException {
		batchConfigDao.requestDelete(batchConfigModel);
	}
	
}
