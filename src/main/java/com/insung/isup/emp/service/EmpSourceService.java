package com.insung.isup.emp.service;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.insung.isup.emp.model.EmpModel;

@Service
public interface EmpSourceService {
	
	//고객사 인사정보 원장 리스트
	public List<LinkedHashMap<String, Object>> requestEmpList() throws Exception;
	
	//고객사 인사정보 원장 상세보기
	public EmpModel requestEmpDetail(String user_id) throws Exception;
	 
	//고객 조직정보 원장
	public List<LinkedHashMap<String, Object>> requestOrgList() throws Exception;
	
}
