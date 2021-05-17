package com.insung.isup.code.service.impl;

import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.insung.isup.code.dao.MenuCodeMapDao;
import com.insung.isup.code.model.MenuCodeMapModel;
import com.insung.isup.code.service.MenuCodeMapService;


@Service
public class MenuCodeMapServiceImpl implements MenuCodeMapService {

	@Autowired
	MenuCodeMapDao menuCodeMapDao;
	 
	//List Count
	@Override
	public MenuCodeMapModel requestListCount(MenuCodeMapModel menuCodeMapModel) throws SQLException{
		return menuCodeMapDao.requestListCount(menuCodeMapModel);
	}
	
	//List
	@Override
	public List<MenuCodeMapModel> requestList(MenuCodeMapModel menuCodeMapModel) throws SQLException{
		return menuCodeMapDao.requestList(menuCodeMapModel);
	}
	
	//Detail
	@Override
	public MenuCodeMapModel requestDetail(MenuCodeMapModel menuCodeMapModel) throws SQLException{
		return menuCodeMapDao.requestDetail(menuCodeMapModel);
	}
	
	//Insert
	@Override
	public void requestInsert(MenuCodeMapModel menuCodeMapModel) throws SQLException{
		menuCodeMapDao.requestInsert(menuCodeMapModel);
	}	
	
	//Delete
	@Override
	public void requestDelete(MenuCodeMapModel menuCodeMapModel) throws SQLException{
		menuCodeMapDao.requestDelete(menuCodeMapModel);
	}
	
	//Insert Batch
	@Override
	public void requestInsertBatch(MenuCodeMapModel menuCodeMapModel, LinkedHashMap<String, Object> linkedHashMap) throws SQLException{
		menuCodeMapDao.requestInsertBatch(menuCodeMapModel, linkedHashMap);
	}
	
}
