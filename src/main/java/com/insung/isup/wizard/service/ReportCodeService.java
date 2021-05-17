package com.insung.isup.wizard.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.insung.isup.wizard.model.ReportCodeModel;
import com.insung.isup.wizard.model.TableSchemaModel;


public interface ReportCodeService {
	
	//List
	public List<ReportCodeModel> requestList(ReportCodeModel model) throws Exception;
	
	//List Child
	public List<ReportCodeModel> requestChildList(ReportCodeModel model) throws Exception;
	
	//Detail
	public ReportCodeModel requestDetail(ReportCodeModel model) throws Exception;
	
	//Insert
	public void requestInsert(ReportCodeModel model) throws Exception;
	
	//Update
	public void requestUpdate(ReportCodeModel model) throws Exception;
	
	//Delete
	public void requestDelete(ReportCodeModel model) throws Exception;
	
	//Tree
	public List<HashMap<String, Object>> requestTree(ReportCodeModel model) throws Exception;
	
	//Column List
	public List<TableSchemaModel> tableColumnList(TableSchemaModel model) throws SQLException;
	
	//InsertBatch
	public void requestInsertBatch(ReportCodeModel model) throws Exception;
}
