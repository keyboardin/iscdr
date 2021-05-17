package com.insung.isup.wizard.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.insung.isup.wizard.dao.ReportDao;
import com.insung.isup.wizard.model.ReportModel;
import com.insung.isup.wizard.service.ReportService;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	ReportDao ReportDao;
	 
	//List Count
	@Override
	public ReportModel requestListCount(ReportModel model) throws Exception {
		return ReportDao.requestListCount(model);
	}
	
	//List
	@Override
	public List<ReportModel> requestList(ReportModel model) throws Exception {
		return ReportDao.requestList(model);
	}
	
	//Detail
	@Override
	public ReportModel requestDetail(ReportModel model) throws Exception {
		return ReportDao.requestDetail(model);
	}
	
	//Insert
	@Override
	public void requestInsert(ReportModel model) throws Exception {
		ReportDao.requestInsert(model);
	}
	
	//Update
	@Override
	public void requestUpdate(ReportModel model) throws Exception {
		ReportDao.requestUpdate(model);
	}
	
	//Delete
	@Override
	public void requestDelete(ReportModel model) throws Exception {
		ReportDao.requestDelete(model);
	}
	
}



