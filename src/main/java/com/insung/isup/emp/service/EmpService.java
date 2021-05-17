package com.insung.isup.emp.service;

import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;

import com.insung.isup.emp.model.EmpModel;


public interface EmpService {
	
	//List Count
	public EmpModel requestListCount(EmpModel empModel) throws SQLException;
	 
	//List
	public List<EmpModel> requestList(EmpModel empModel) throws SQLException;
	
	//Detail
	public EmpModel requestDetail(EmpModel empModel) throws SQLException;
	
	//Insert
	public void requestInsert(EmpModel empModel) throws SQLException;
	
	//Update
	public void requestUpdate(EmpModel empModel) throws SQLException;
	
	//Delete
	public void requestDelete(EmpModel empModel) throws SQLException;
	
	//Update
	public void requestPwReset(EmpModel empModel) throws SQLException;
	
	//Tree
	public List<LinkedHashMap<String, Object>> requestTree(EmpModel empModel) throws SQLException;
	
	
	//Delete/Insert Batch - 인사정보 
	public void requestSyncEmp(LinkedHashMap<String, Object> linkedHashMap) throws SQLException;
	
	//Delete/Insert Batch - 조직정보
	public void requestSyncOrg(LinkedHashMap<String, Object> linkedHashMap) throws SQLException;
		
	//인사정보 Sync
	public String requestSyncEmp(EmpModel empModel) throws Exception;
	
	//이메일로 사번가져오기
	public EmpModel requestEmpNo(EmpModel empModel) throws Exception;
	
}
