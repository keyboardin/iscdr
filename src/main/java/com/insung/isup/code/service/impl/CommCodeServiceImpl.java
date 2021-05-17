package com.insung.isup.code.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.insung.isup.code.dao.CommCodeDao;
import com.insung.isup.code.model.CommCodeModel;
import com.insung.isup.code.service.CommCodeService;


@Service
public class CommCodeServiceImpl implements CommCodeService {

	@Autowired
	CommCodeDao commCodeDao;
	 
	//List Count
	@Override
	public CommCodeModel requestListCount(CommCodeModel commCodeModel) throws Exception {
		return commCodeDao.requestListCount(commCodeModel);
	}
	
	//List
	@Override
	public List<CommCodeModel> requestList(CommCodeModel commCodeModel) throws Exception {
		return commCodeDao.requestList(commCodeModel);
	}
	
	//Detail
	@Override
	public CommCodeModel requestDetail(CommCodeModel commCodeModel) throws Exception {
		return commCodeDao.requestDetail(commCodeModel);
	}
	
	//Insert
	@Override
	public void requestInsert(CommCodeModel commCodeModel) throws Exception {
		commCodeDao.requestInsert(commCodeModel);
	}
	
	//Update
	@Override
	public void requestUpdate(CommCodeModel commCodeModel) throws Exception {
		commCodeDao.requestUpdate(commCodeModel);
	}
	
	//Delete
	@Override 
	public void requestDelete(CommCodeModel commCodeModel) throws Exception {
		commCodeDao.requestDelete(commCodeModel);
	}
	
	
	//Group List
	@Override
	public List<CommCodeModel> requestGroupList(CommCodeModel commCodeModel) throws Exception {
		return commCodeDao.requestGroupList(commCodeModel);
	}
	
	//Tree
	@Override
	public List<HashMap<String, Object>> requestTree(CommCodeModel commCodeModel) throws Exception {
		return commCodeDao.requestTree(commCodeModel);
	}
	
	//Config Code List
	@Override
	public List<CommCodeModel> requestConfigCodeList(CommCodeModel commCodeModel) throws Exception {
		return commCodeDao.requestConfigCodeList(commCodeModel);
	}
		
		
}
