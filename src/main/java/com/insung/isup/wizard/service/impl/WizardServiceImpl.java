package com.insung.isup.wizard.service.impl;

import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.insung.isup.wizard.dao.WizardDao;
import com.insung.isup.wizard.model.WizardModel;
import com.insung.isup.wizard.service.WizardService;


@Service
public class WizardServiceImpl implements WizardService {

	@Autowired
	WizardDao dao;
	
	//List
	@Override
	public List<LinkedHashMap<String, Object>> requestList(WizardModel model) throws SQLException{
		return dao.requestList(model);
	}
	
}
