package com.insung.isup.conf.service.impl;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.insung.isup.conf.dao.CmConfigDao;
import com.insung.isup.conf.model.CmConfigModel;
import com.insung.isup.conf.service.CmConfigService;

@Service
public class CmConfigServiceImpl implements CmConfigService {

	@Autowired
	CmConfigDao cmConfigDao;
	 
	//List Count
	public CmConfigModel requestListCount(CmConfigModel cmConfigModel) throws Exception {
		return cmConfigDao.requestListCount(cmConfigModel);
	}
	
	//List
	public List<CmConfigModel> requestList(CmConfigModel cmConfigModel) throws Exception {
		return cmConfigDao.requestList(cmConfigModel);
	}
	
	//Detail
	public CmConfigModel requestDetail(CmConfigModel cmConfigModel) throws Exception {
		return cmConfigDao.requestDetail(cmConfigModel);
	}
	
	//Insert
	public void requestInsert(CmConfigModel cmConfigModel) throws Exception {
		cmConfigDao.requestInsert(cmConfigModel);
	}
	
	//Update
	public void requestUpdate(CmConfigModel cmConfigModel) throws Exception {
		cmConfigDao.requestUpdate(cmConfigModel);
	}
	
	//Delete
	public void requestDelete(CmConfigModel cmConfigModel) throws Exception {
		cmConfigDao.requestDelete(cmConfigModel);
	}
	
	//Tree
	public List<LinkedHashMap<String, Object>> requestTree(CmConfigModel cmConfigModel) throws Exception {
		return cmConfigDao.requestTree(cmConfigModel);
	}
	
	
	//디바이스수량포함 리스트
			public List<CmConfigModel> requestCmStateList() throws Exception {
				return cmConfigDao.requestCmStateList();
			}
		
}
