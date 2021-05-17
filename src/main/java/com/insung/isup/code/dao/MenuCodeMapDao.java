package com.insung.isup.code.dao;

import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.insung.isup.code.model.MenuCodeMapModel;

@Repository @Transactional(value="transactionManager")
public class MenuCodeMapDao {

	@Autowired
    private SqlSession sqlSession; 
	
	//List Count
	public MenuCodeMapModel requestListCount(MenuCodeMapModel menuCodeMapModel) throws SQLException {
		return sqlSession.selectOne("MenuCodeMapDao.requestListCount", menuCodeMapModel);	
	} 
	
	//List 
	public List<MenuCodeMapModel> requestList(MenuCodeMapModel menuCodeMapModel) throws SQLException {
		return sqlSession.selectList("MenuCodeMapDao.requestList", menuCodeMapModel);		
	}
	
	//Detail
	public MenuCodeMapModel requestDetail(MenuCodeMapModel menuCodeMapModel) throws SQLException {
		return sqlSession.selectOne("MenuCodeMapDao.requestDetail", menuCodeMapModel);	
	}	
	
	//Insert
	public void requestInsert(MenuCodeMapModel menuCodeMapModel) throws SQLException {
		sqlSession.insert("MenuCodeMapDao.requestInsert", menuCodeMapModel);
	}
		
	//Delete
	public void requestDelete(MenuCodeMapModel menuCodeMapModel) throws SQLException {
		sqlSession.delete("MenuCodeMapDao.requestDelete", menuCodeMapModel);
	}
	
	//Insert Batch
	public void requestInsertBatch(MenuCodeMapModel menuCodeMapModel, LinkedHashMap<String, Object> linkedHashMap) throws SQLException {
		sqlSession.delete("MenuCodeMapDao.requestDelete", menuCodeMapModel);
		sqlSession.insert("MenuCodeMapDao.requestInsertBatch", linkedHashMap);
	}
}
