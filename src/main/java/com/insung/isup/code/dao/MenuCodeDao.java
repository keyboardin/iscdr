package com.insung.isup.code.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.insung.isup.code.model.MenuCodeModel;

@Repository @Transactional(value="transactionManager")
public class MenuCodeDao {

	@Autowired
    private SqlSession sqlSession; 
	
	//List Count
	public MenuCodeModel requestListCount(MenuCodeModel menuCodeModel) throws SQLException {
		return sqlSession.selectOne("MenuCodeDao.requestListCount", menuCodeModel);	
	} 
	
	//List 
	public List<MenuCodeModel> requestList(MenuCodeModel menuCodeModel) throws SQLException {
		return sqlSession.selectList("MenuCodeDao.requestList", menuCodeModel);		
	}
	
	//Detail
	public MenuCodeModel requestDetail(MenuCodeModel menuCodeModel) throws SQLException {
		return sqlSession.selectOne("MenuCodeDao.requestDetail", menuCodeModel);	
	}	
	
	//Insert
	public void requestInsert(MenuCodeModel menuCodeModel) throws SQLException {
		sqlSession.insert("MenuCodeDao.requestInsert", menuCodeModel);
	}
	
	//Update
	public void requestUpdate(MenuCodeModel menuCodeModel) throws SQLException {
		sqlSession.update("MenuCodeDao.requestUpdate", menuCodeModel);
	}
	
	//Delete
	public void requestDelete(MenuCodeModel menuCodeModel) throws SQLException {
		sqlSession.delete("MenuCodeDao.requestDelete", menuCodeModel);
	}
	

	//사용자별 메뉴 리스트 
	public List<MenuCodeModel> requestMenuMapList(MenuCodeModel menuCodeModel) throws SQLException {
		return sqlSession.selectList("MenuCodeDao.requestMenuMapList", menuCodeModel);		
	}
	
	
	//Tree 
	public List<HashMap<String, Object>> requestTree(MenuCodeModel menuCodeModel) throws SQLException {
		return sqlSession.selectList("MenuCodeDao.requestTree", menuCodeModel);		
	}
	
}
