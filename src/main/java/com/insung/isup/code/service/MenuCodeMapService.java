package com.insung.isup.code.service;

import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;

import com.insung.isup.code.model.MenuCodeMapModel;


public interface MenuCodeMapService {
	
	//List Count
	public MenuCodeMapModel requestListCount(MenuCodeMapModel menuCodeMapModel) throws SQLException;
	 
	//List
	public List<MenuCodeMapModel> requestList(MenuCodeMapModel menuCodeMapModel) throws SQLException;
	
	//Detail
	public MenuCodeMapModel requestDetail(MenuCodeMapModel menuCodeMapModel) throws SQLException;
	
	//Insert
	public void requestInsert(MenuCodeMapModel menuCodeMapModel) throws SQLException;

	//Delete
	public void requestDelete(MenuCodeMapModel menuCodeMapModel) throws SQLException;
	
	//Insert Batch
	public void requestInsertBatch(MenuCodeMapModel menuCodeMapModel, LinkedHashMap<String, Object> linkedHashMap) throws SQLException;
	
}
