package com.insung.isup.statsipcc.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import com.insung.isup.statsipcc.model.StatsIpccModel;
import com.insung.isup.wizard.model.WizardModel;


public interface StatsIpccService {
	
	 
	//List
	public List<HashMap<String, Object>> requestList(StatsIpccModel statsIpccModel) throws SQLException;
	
	//MainTel List
	public List<LinkedHashMap<String, Object>> requestMainTelList(WizardModel model) throws SQLException;

	//Agent List
	public List<LinkedHashMap<String, Object>> requestAgentList(WizardModel model) throws SQLException;
	
	//Agent Tree
	public List<LinkedHashMap<String, Object>> requestAgentTree(WizardModel model) throws SQLException;

}
