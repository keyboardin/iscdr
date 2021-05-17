package com.insung.isup.wizard.service;

import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;

import com.insung.isup.wizard.model.WizardModel;


public interface WizardService {
	 
	//List
	public List<LinkedHashMap<String, Object>> requestList(WizardModel model) throws SQLException;
	
}
