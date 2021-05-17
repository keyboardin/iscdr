package com.insung.isup.emp.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.insung.isup.emp.dao.EmpDao;
import com.insung.isup.emp.dao.EmpSourceDao;
import com.insung.isup.emp.model.EmpModel;
import com.insung.isup.emp.service.EmpService;


@Service
public class EmpServiceImpl implements EmpService {

	private static final Logger logger = LoggerFactory.getLogger(EmpServiceImpl.class);
	
	@Autowired
	private EmpDao empDao;
	 
	@Autowired
	private EmpSourceDao empSourceDao;

	//@Autowired
	//private EmpXmlDao empXmlDao;
	
	
	//List Count
	@Override
	public EmpModel requestListCount(EmpModel empModel) throws SQLException{
		return empDao.requestListCount(empModel);
	}
	
	//List
	@Override
	public List<EmpModel> requestList(EmpModel empModel) throws SQLException{
		return empDao.requestList(empModel);
	}
	
	//Detail
	@Override
	public EmpModel requestDetail(EmpModel empModel) throws SQLException{
		return empDao.requestDetail(empModel);
	}
	
	//Insert
	@Override
	public void requestInsert(EmpModel empModel) throws SQLException{
		empDao.requestInsert(empModel);
	}
	
	//Update
	@Override
	public void requestUpdate(EmpModel empModel) throws SQLException{
		empDao.requestUpdate(empModel);
	}
	
	//Delete
	@Override
	public void requestDelete(EmpModel empModel) throws SQLException{
		empDao.requestDelete(empModel);
	}
	
	//PwReset
	@Override
	public void requestPwReset(EmpModel empModel) throws SQLException{
		empDao.requestPwReset(empModel);
	}
	
	//List
	@Override
	public List<LinkedHashMap<String, Object>> requestTree(EmpModel empModel) throws SQLException{
		return empDao.requestTree(empModel);
	}
	
	//Delete/Insert Batch - 인사정보
	@Override 
	public void requestSyncEmp(LinkedHashMap<String, Object> linkedHashMap) throws SQLException{ 
		empDao.requestSyncEmp(linkedHashMap); 
	}
	
	//Delete/Insert Batch - 조직정보
	@Override
	public void requestSyncOrg(LinkedHashMap<String, Object> linkedHashMap) throws SQLException{
		empDao.requestSyncOrg(linkedHashMap);
	}
	
	//인사정보 Sync
	@Override
	public String requestSyncEmp(EmpModel empModel) throws Exception {
		String result="";
		List<EmpModel> deleteList = new ArrayList<EmpModel>();
		List<LinkedHashMap<String, Object>> insertList = new ArrayList<LinkedHashMap<String, Object>>();
		
		List<EmpModel> old_list = empDao.requestList(empModel);								//기존 데이터
		List<LinkedHashMap<String, Object>> new_list = empSourceDao.requestEmpList();		//새로운 인사정보
		logger.debug("현재건수 "+old_list.size());
		logger.debug("인사건수 "+new_list.size());
		
		//기존데이터 맵
		LinkedHashMap<String, Object> old_map = new LinkedHashMap<String, Object>();
		for(int i=0; i<old_list.size(); i++) {
			EmpModel _empModel = old_list.get(i);
			old_map.put(_empModel.getEmp_no(), _empModel);
		}
		
		//신규데이터 맵
		LinkedHashMap<String, Object> new_map = new LinkedHashMap<String, Object>();
		for(int i=0; i<new_list.size(); i++) {
			LinkedHashMap<String, Object> map = new_list.get(i);
			new_map.put((String)map.get("emp_no"), map);				
		}
		
		//삭제대상
		for(int i=0; i<old_list.size(); i++) {
			EmpModel _empModel = old_list.get(i);
			String emp_no = _empModel.getEmp_no();
			if(!new_map.containsKey(emp_no)){	//기존사번이 원장에 없으면 삭제대상
				deleteList.add(_empModel);
			}
		}
		
		//등록대상
		for(int i=0; i<new_list.size(); i++) {
			LinkedHashMap<String, Object> map = new_list.get(i);
			String emp_no = (String)map.get("emp_no");
			if(!old_map.containsKey(emp_no)) {
				insertList.add(map);
			}
		}
		
		int delete_count = deleteList.size();
		int update_count = new_list.size() - insertList.size();
		int insert_count = insertList.size();
		logger.debug("삭제건수 >>>>> "+delete_count);
		logger.debug("수정건수 >>>>> "+update_count);
		logger.debug("신규건수 >>>>> "+insert_count);
		
		//재직자 테이블
		LinkedHashMap<String, Object> linkedHashMap = new LinkedHashMap<String, Object>();
		linkedHashMap.put("deleteList", deleteList);		//삭제대상 삭제	
		linkedHashMap.put("upsertList", new_list);			//있으면 Update 없으면 Insert
		empDao.requestSyncEmp(linkedHashMap);				//tb_m_emp 동기화
		
		result = "삭제건수:"+delete_count+", 수정건수:"+update_count+", 신규건수:"+insert_count;
		//재직자 XML 정보 테이블
//		LinkedHashMap<String, Object> linkedHashMap2 = new LinkedHashMap<String, Object>();
//		linkedHashMap2.put("deleteList", deleteList);		//삭제대상 삭제	
//		linkedHashMap2.put("upsertList", new_list);			//있으면 Update 없으면 Insert
//		empXmlDao.requestSyncEmp(linkedHashMap2);			//tb_m_emp_xml 동기화
		
		return result;
	}
	
	
	//이메일로 사번가져오기
	public EmpModel requestEmpNo(EmpModel empModel) throws Exception {
		return empDao.requestEmpNo(empModel);
	}
	
}
