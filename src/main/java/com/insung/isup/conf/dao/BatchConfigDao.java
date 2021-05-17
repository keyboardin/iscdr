package com.insung.isup.conf.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.insung.isup.conf.model.BatchConfigModel;

@Repository @Transactional(value="transactionManager")
public class BatchConfigDao {

	@Autowired
    private SqlSession sqlSession; 
	
	//List Count
	public BatchConfigModel requestListCount(BatchConfigModel batchConfigModel) throws SQLException {
		return sqlSession.selectOne("BatchConfigDao.requestListCount", batchConfigModel);	
	} 
	
	//List 
	public List<BatchConfigModel> requestList(BatchConfigModel batchConfigModel) throws SQLException {
		return sqlSession.selectList("BatchConfigDao.requestList", batchConfigModel);		
	}
	
	//Detail
	public BatchConfigModel requestDetail(BatchConfigModel batchConfigModel) throws SQLException {
		return sqlSession.selectOne("BatchConfigDao.requestDetail", batchConfigModel);	
	}	
	
	//Insert
	public void requestInsert(BatchConfigModel batchConfigModel) throws SQLException {
		sqlSession.insert("BatchConfigDao.requestInsert", batchConfigModel);
	}
	
	//Update
	public void requestUpdate(BatchConfigModel batchConfigModel) throws SQLException {
		sqlSession.update("BatchConfigDao.requestUpdate", batchConfigModel);
	}
	
	//Delete
	public void requestDelete(BatchConfigModel batchConfigModel) throws SQLException {
		sqlSession.delete("BatchConfigDao.requestDelete", batchConfigModel);
	}
	
}
