package com.insung.isup.emp.dao;

import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.insung.isup.emp.model.EmpModel;

@Repository @Transactional(value="transactionManager")
public class EmpDao {

	@Autowired
    private SqlSession sqlSession; 
	
	//List Count
	public EmpModel requestListCount(EmpModel empModel) throws SQLException {
		return sqlSession.selectOne("EmpDao.requestListCount", empModel);	
	} 
	
	//List 
	public List<EmpModel> requestList(EmpModel empModel) throws SQLException {
		return sqlSession.selectList("EmpDao.requestList", empModel);		
	}
	
	//Detail
	public EmpModel requestDetail(EmpModel empModel) throws SQLException {
		return sqlSession.selectOne("EmpDao.requestDetail", empModel);	
	}	
	
	//Insert
	public void requestInsert(EmpModel empModel) throws SQLException {
		sqlSession.insert("EmpDao.requestInsert", empModel);
	}
	
	//Update
	public void requestUpdate(EmpModel empModel) throws SQLException {
		sqlSession.update("EmpDao.requestUpdate", empModel);
	}
	
	//Delete
	public void requestDelete(EmpModel empModel) throws SQLException {
		sqlSession.delete("EmpDao.requestDelete", empModel);
		sqlSession.delete("EmpDao.requestPwDelete", empModel);	//tb_m_emp_pw
	}
	
	//Update
	public void requestPwReset(EmpModel empModel) throws SQLException {
		sqlSession.update("EmpDao.requestPwReset", empModel);
	}
	
	//Tree 
	public List<LinkedHashMap<String, Object>> requestTree(EmpModel empModel) throws SQLException {
		return sqlSession.selectList("EmpDao.requestTree", empModel);		
	}
	
	//동기화 Batch - 인사정보
	public void requestSyncEmp(LinkedHashMap<String, Object> linkedHashMap) throws SQLException {
		sqlSession.delete("EmpDao.requestDeleteBatchEmp", linkedHashMap);		//삭제
		sqlSession.insert("EmpDao.requestUpsertBatchEmp", linkedHashMap);		//Upsert
		
		//퇴직자처리
		linkedHashMap.put("upsertList", linkedHashMap.get("deleteList"));			//삭제대상자를 퇴직자 테이플에 Upsert
		sqlSession.insert("EmpRetireDao.requestUpsertBatchEmp", linkedHashMap);		//퇴직자
	}
	
	//Insert Batch - 조직정보
	public void requestSyncOrg(LinkedHashMap<String, Object> linkedHashMap) throws SQLException {
		sqlSession.delete("EmpDao.requestDeleteBatchOrg", new EmpModel());
		sqlSession.insert("EmpDao.requestInsertBatchOrg", linkedHashMap);
	}
	
	
	//이메일로 사번가져오기
	public EmpModel requestEmpNo(EmpModel empModel) throws Exception {
		return sqlSession.selectOne("EmpDao.requestEmpNo", empModel);
	}
	
}
