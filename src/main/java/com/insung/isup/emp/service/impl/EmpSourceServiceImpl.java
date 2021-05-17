package com.insung.isup.emp.service.impl;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.insung.isup.emp.dao.EmpSourceDao;
import com.insung.isup.emp.model.EmpModel;
import com.insung.isup.emp.service.EmpSourceService;

@Service
public class EmpSourceServiceImpl implements  EmpSourceService {

	@Autowired
	private EmpSourceDao empSourceDao;
	 
	//고객사 인사정보 원장 리스트
	@Override
	public List<LinkedHashMap<String, Object>> requestEmpList() throws Exception {
		return empSourceDao.requestEmpList();
	}
	
	//고객사 인사정보 원장 상세보기
	@Override
	public EmpModel requestEmpDetail(String user_id) throws Exception {
		return empSourceDao.requestEmpDetail(user_id);
	}
	
	//고객 조직정보 원장
	@Override
	public List<LinkedHashMap<String, Object>> requestOrgList() throws Exception {
		return empSourceDao.requestOrgList();
	}
	
	
}
