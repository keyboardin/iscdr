package com.insung.isup.code.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.insung.isup.code.dao.MenuCodeDao;
import com.insung.isup.code.model.MenuCodeModel;
import com.insung.isup.code.service.MenuCodeService;


@Service
public class MenuCodeServiceImpl implements MenuCodeService {

	@Autowired
	MenuCodeDao menuCodeDao;
	 
	//List Count
	@Override
	public MenuCodeModel requestListCount(MenuCodeModel menuCodeModel) throws SQLException{
		return menuCodeDao.requestListCount(menuCodeModel);
	}
	
	//List
	@Override
	public List<MenuCodeModel> requestList(MenuCodeModel menuCodeModel) throws SQLException{
		return menuCodeDao.requestList(menuCodeModel);
	}
	
	//Detail
	@Override
	public MenuCodeModel requestDetail(MenuCodeModel menuCodeModel) throws SQLException{
		return menuCodeDao.requestDetail(menuCodeModel);
	}
	
	//Insert
	@Override
	public void requestInsert(MenuCodeModel menuCodeModel) throws SQLException{
		menuCodeDao.requestInsert(menuCodeModel);
	}
	
	//Update
	@Override
	public void requestUpdate(MenuCodeModel menuCodeModel) throws SQLException{
		menuCodeDao.requestUpdate(menuCodeModel);
	}
	
	//Delete
	@Override
	public void requestDelete(MenuCodeModel menuCodeModel) throws SQLException{
		menuCodeDao.requestDelete(menuCodeModel);
	}
	
	
	//사용자별 메뉴 리스트 
	public List<MenuCodeModel> requestMenuMapList(MenuCodeModel menuCodeModel) throws SQLException {
		return menuCodeDao.requestMenuMapList(menuCodeModel);		
	}
	
	
	//Tree 
	public List<HashMap<String, Object>> requestTree(MenuCodeModel menuCodeModel) throws SQLException {
		return menuCodeDao.requestTree(menuCodeModel);		
	}
}
