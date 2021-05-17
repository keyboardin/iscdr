package com.insung.isup.wizard.service;

import java.sql.SQLException;
import java.util.List;

import com.insung.isup.wizard.model.TableSchemaModel;


public interface TableSchemaService {
	 
	//List
	public List<TableSchemaModel> tableList(TableSchemaModel model) throws SQLException;
	
	//List
	public List<TableSchemaModel> tableColumnList(TableSchemaModel model) throws SQLException;
	
}
