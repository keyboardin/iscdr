package com.insung.isup.log.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.insung.isup.log.model.BatchLogModel;

@Repository @Transactional(value="transactionManager")
public class BatchLogDao {

	@Autowired
    private SqlSession sqlSession; 
	
	//List Count
	public BatchLogModel requestListCount(BatchLogModel batchLogModel) throws SQLException {
		return sqlSession.selectOne("BatchLogDao.requestListCount", batchLogModel);	
	} 
	
	//List
	public List<BatchLogModel> requestList(BatchLogModel batchLogModel) throws SQLException {
		return sqlSession.selectList("BatchLogDao.requestList", batchLogModel);		
	}
	
	//Insert
	public void requestInsert(BatchLogModel batchLogModel) throws SQLException {
		sqlSession.insert("BatchLogDao.requestInsert", batchLogModel);
	}	
	
	
	
}
