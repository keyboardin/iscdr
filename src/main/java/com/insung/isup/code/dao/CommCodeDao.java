package com.insung.isup.code.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.insung.isup.code.model.CommCodeModel;

@Repository @Transactional(value="transactionManager")
public class CommCodeDao {

	@Autowired
    private SqlSession sqlSession; 
	
	//List Count
	public CommCodeModel requestListCount(CommCodeModel commCodeModel) throws Exception {
		return sqlSession.selectOne("CommCodeDao.requestListCount", commCodeModel);		
	} 
	
	//List 
	public List<CommCodeModel> requestList(CommCodeModel commCodeModel) throws Exception {
		return sqlSession.selectList("CommCodeDao.requestList", commCodeModel);		
	}
	
	//Detail
	public CommCodeModel requestDetail(CommCodeModel commCodeModel) throws Exception {
		return sqlSession.selectOne("CommCodeDao.requestDetail", commCodeModel);	
	}	
	
	//Insert
	public void requestInsert(CommCodeModel commCodeModel) throws Exception {
		sqlSession.insert("CommCodeDao.requestInsert", commCodeModel);
	}
	
	//Update
	public void requestUpdate(CommCodeModel commCodeModel) throws Exception {
		sqlSession.update("CommCodeDao.requestUpdate", commCodeModel);
	}
	
	//Delete
	public void requestDelete(CommCodeModel commCodeModel) throws Exception {
		sqlSession.delete("CommCodeDao.requestDelete", commCodeModel);
	}
	
	//Group List 
	public List<CommCodeModel> requestGroupList(CommCodeModel commCodeModel) throws Exception {
		return sqlSession.selectList("CommCodeDao.requestGroupList", commCodeModel);		
	}
	
	//Tree 
	public List<HashMap<String, Object>> requestTree(CommCodeModel commCodeModel) throws Exception {
		return sqlSession.selectList("CommCodeDao.requestTree", commCodeModel);		
	}
	
	
	//Config Code List 
	public List<CommCodeModel> requestConfigCodeList(CommCodeModel commCodeModel) throws Exception {
		return sqlSession.selectList("CommCodeDao.requestConfigCodeList", commCodeModel);		
	}
	
}
