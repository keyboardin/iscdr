package com.insung.isup.wizard.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.insung.isup.wizard.dao.ReportCodeDao;
import com.insung.isup.wizard.model.ReportCodeModel;
import com.insung.isup.wizard.model.TableSchemaModel;
import com.insung.isup.wizard.service.ReportCodeService;


@Service
public class ReportCodeServiceImpl implements ReportCodeService {

	@Autowired
	ReportCodeDao dao;
	 
	//List
	@Override
	public List<ReportCodeModel> requestList(ReportCodeModel model) throws Exception {
		return dao.requestList(model);
	}
	
	//List Child
	@Override
	public List<ReportCodeModel> requestChildList(ReportCodeModel model) throws Exception {
		return dao.requestChildList(model);
	}
	
	//Detail
	@Override
	public ReportCodeModel requestDetail(ReportCodeModel model) throws Exception {
		return dao.requestDetail(model);
	}
	
	//Insert
	@Override
	public void requestInsert(ReportCodeModel model) throws Exception {
		dao.requestInsert(model);
	}
	
	//Update
	@Override
	public void requestUpdate(ReportCodeModel model) throws Exception {
		dao.requestUpdate(model);
	}
	
	//Delete
	@Override 
	public void requestDelete(ReportCodeModel model) throws Exception {
		dao.requestDelete(model);
	}
	
	//Tree
	@Override
	public List<HashMap<String, Object>> requestTree(ReportCodeModel model) throws Exception {
		return dao.requestTree(model);
	}
	
	//ColumnList
	@Override
	public List<TableSchemaModel> tableColumnList(TableSchemaModel model) throws SQLException{
		return dao.tableColumnList(model);
	}
	
	//InsertBatch
	@Override
	public void requestInsertBatch(ReportCodeModel model) throws Exception {
		dao.requestInsertBatch(model);
	}
	
}
