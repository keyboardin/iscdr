package com.insung.isup.statsipcc.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.insung.isup.statsipcc.dao.StatsIpccDao;
import com.insung.isup.statsipcc.model.StatsIpccModel;
import com.insung.isup.wizard.model.WizardModel;
import com.insung.isup.statsipcc.service.StatsIpccService;


@Service
public class StatsIpccServiceImpl implements StatsIpccService {

	@Autowired
	StatsIpccDao StatsIpccDao;
	
	//List
	@Override
	public List<HashMap<String, Object>> requestList(StatsIpccModel statsIpccModel) throws SQLException{
		return StatsIpccDao.requestList(statsIpccModel);
	}
	
	
	//MainTel List
	@Override
	public List<LinkedHashMap<String, Object>> requestMainTelList(WizardModel wizardModel) throws SQLException{
		return StatsIpccDao.requestMainTelList(wizardModel);
	}
	
	//Agent List
	@Override
	public List<LinkedHashMap<String, Object>> requestAgentList(WizardModel wizardModel) throws SQLException{
		return StatsIpccDao.requestAgentList(wizardModel);
	}
	
	//Agent Tree
	@Override
	public List<LinkedHashMap<String, Object>> requestAgentTree(WizardModel wizardModel) throws SQLException{
		return StatsIpccDao.requestAgentTree(wizardModel);
	}
	
}
