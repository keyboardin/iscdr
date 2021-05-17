package com.insung.isup.wizard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.insung.isup.wizard.model.ReportModel;

@Repository @Transactional(value="transactionManager")
public class ReportDao {

	@Autowired
    private SqlSession sqlSession; 
	
	//List Count
	public ReportModel requestListCount(ReportModel model) throws Exception {
		return sqlSession.selectOne("ReportDao.requestListCount", model);	
	} 
	
	//List 
	public List<ReportModel> requestList(ReportModel model) throws Exception {
		return sqlSession.selectList("ReportDao.requestList", model);		
	}
	
	//Detail
	public ReportModel requestDetail(ReportModel model) throws Exception {
		return sqlSession.selectOne("ReportDao.requestDetail", model);	
	}	
	
	//Insert
	public void requestInsert(ReportModel model) throws Exception {
		sqlSession.insert("ReportDao.requestInsert", model);
	}
	
	//Update
	public void requestUpdate(ReportModel model) throws Exception {
		sqlSession.update("ReportDao.requestUpdate", model);
	}
	
	//Delete
	public void requestDelete(ReportModel model) throws Exception {
		sqlSession.delete("ReportDao.requestDelete", model);
	}
	
}
