package com.insung.isup.wizard.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.insung.isup.wizard.dao.TableSchemaDao;
import com.insung.isup.wizard.model.TableSchemaModel;
import com.insung.isup.wizard.service.TableSchemaService;


@Service
public class TableSchemaServiceImpl implements TableSchemaService {

	@Autowired
	TableSchemaDao dao;
	
	//List
	@Override
	public List<TableSchemaModel> tableList(TableSchemaModel model) throws SQLException{
		return dao.tableList(model);
	}
	
	//List
	@Override
	public List<TableSchemaModel> tableColumnList(TableSchemaModel model) throws SQLException{
		return dao.tableColumnList(model);
	}
	
}
