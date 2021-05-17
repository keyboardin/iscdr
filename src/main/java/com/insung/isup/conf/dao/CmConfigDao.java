package com.insung.isup.conf.dao;

import java.util.LinkedHashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.insung.isup.conf.model.CmConfigModel;

@Repository @Transactional(value="transactionManager")
public class CmConfigDao {
	
	@Autowired
    private SqlSession sqlSession;

	//List Count
	public CmConfigModel requestListCount(CmConfigModel cmConfigModel) throws Exception {
		return sqlSession.selectOne("CmConfigDao.requestListCount", cmConfigModel);
	}

	//List
	public List<CmConfigModel> requestList(CmConfigModel cmConfigModel) throws Exception {
		return sqlSession.selectList("CmConfigDao.requestList", cmConfigModel);
	}

	//Detail
	public CmConfigModel requestDetail(CmConfigModel cmConfigModel) throws Exception {
		return sqlSession.selectOne("CmConfigDao.requestDetail", cmConfigModel);
	}

	//Insert
	public void requestInsert(CmConfigModel cmConfigModel) throws Exception {
		sqlSession.insert("CmConfigDao.requestInsert", cmConfigModel);
	}

	//Update
	public void requestUpdate(CmConfigModel cmConfigModel) throws Exception {
		sqlSession.update("CmConfigDao.requestUpdate", cmConfigModel);
	}

	//Delete
	public void requestDelete(CmConfigModel cmConfigModel) throws Exception {
		sqlSession.delete("CmConfigDao.requestDelete", cmConfigModel);
	}
	
	//Tree
	public List<LinkedHashMap<String, Object>> requestTree(CmConfigModel cmConfigModel) throws Exception {
		return sqlSession.selectList("CmConfigDao.requestTree", cmConfigModel);
	}
		
	//Active Cm 정보(priority min)
	public CmConfigModel requestActiveCm() throws Exception {
		List<CmConfigModel> list = sqlSession.selectList("CmConfigDao.requestActiveCmList");
		CmConfigModel cmConfigModel = list.get(0);
		return cmConfigModel;
	}
	
	//디바이스수량포함 리스트
	public List<CmConfigModel> requestCmStateList() throws Exception {
		return sqlSession.selectList("CmConfigDao.requestCmStateList");
	}
		
}
