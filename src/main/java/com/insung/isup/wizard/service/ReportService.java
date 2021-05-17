package com.insung.isup.wizard.service;

import java.util.List;

import com.insung.isup.wizard.model.ReportModel;

public interface ReportService {
	
	//List Count
	public ReportModel requestListCount(ReportModel model) throws Exception;
	 
	//List
	public List<ReportModel> requestList(ReportModel model) throws Exception;
	
	//Detail
	public ReportModel requestDetail(ReportModel model) throws Exception;
	
	//Insert
	public void requestInsert(ReportModel model) throws Exception;
	
	//Update
	public void requestUpdate(ReportModel model) throws Exception;
	
	//Delete
	public void requestDelete(ReportModel model) throws Exception;
	
	
}
