package com.insung.isup.wizard.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.insung.isup.wizard.model.ReportCodeModel;

@Repository @Transactional(value="transactionManagerMs")
public class ReportCodeMsDao {

	@Autowired
    private SqlSession sqlSessionMs; 
	
	//List 
	public List<ReportCodeModel> requestList(ReportCodeModel model) throws Exception {
		return sqlSessionMs.selectList("ReportCodeDao.requestList", model);		
	}
	
	//List Child
	public List<ReportCodeModel> requestChildList(ReportCodeModel model) throws Exception {
		return sqlSessionMs.selectList("ReportCodeDao.requestChildList", model);		
	}
	
	//Detail
	public ReportCodeModel requestDetail(ReportCodeModel model) throws Exception {
		return sqlSessionMs.selectOne("ReportCodeDao.requestDetail", model);	
	}	
	
	//Insert
	public void requestInsert(ReportCodeModel model) throws Exception {
		sqlSessionMs.insert("ReportCodeDao.requestInsert", model);
	}
	
	//Update
	public void requestUpdate(ReportCodeModel model) throws Exception {
		sqlSessionMs.update("ReportCodeDao.requestUpdate", model);
	}
	
	//Delete
	public void requestDelete(ReportCodeModel model) throws Exception {
		sqlSessionMs.delete("ReportCodeDao.requestDelete", model);
	}
	
	//Tree 
	public List<HashMap<String, Object>> requestTree(ReportCodeModel model) throws Exception {
		return sqlSessionMs.selectList("ReportCodeDao.requestTree", model);		
	}
	
	
}
