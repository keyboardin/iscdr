package com.insung.isup.code.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.insung.isup.code.model.MenuCodeModel;


public interface MenuCodeService {
	
	//List Count
	public MenuCodeModel requestListCount(MenuCodeModel menuCodeModel) throws SQLException;
	 
	//List
	public List<MenuCodeModel> requestList(MenuCodeModel menuCodeModel) throws SQLException;
	
	//Detail
	public MenuCodeModel requestDetail(MenuCodeModel menuCodeModel) throws SQLException;
	
	//Insert
	public void requestInsert(MenuCodeModel menuCodeModel) throws SQLException;
	
	//Update
	public void requestUpdate(MenuCodeModel menuCodeModel) throws SQLException;
	
	//Delete
	public void requestDelete(MenuCodeModel menuCodeModel) throws SQLException;
	
	
	//사용자별 메뉴 리스트 
	public List<MenuCodeModel> requestMenuMapList(MenuCodeModel menuCodeModel) throws SQLException;
	
	//Tree 
	public List<HashMap<String, Object>> requestTree(MenuCodeModel menuCodeModel) throws SQLException;
	
	
}
