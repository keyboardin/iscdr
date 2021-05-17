package com.insung.isup.wizard.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.insung.isup.wizard.model.TableSchemaModel;

@Repository 
@Transactional(value="transactionManagerMs")
public class TableSchemaDao {

	@Autowired
    private SqlSession sqlSessionMs; 
	
	//List 
	public List<TableSchemaModel> tableList(TableSchemaModel model) throws SQLException {
		return sqlSessionMs.selectList("TableSchemaDao.tableList", model);		
	}
	
	//List 
	public List<TableSchemaModel> tableColumnList(TableSchemaModel model) throws SQLException {
		return sqlSessionMs.selectList("TableSchemaDao.tableColumnList", model);		
	}
	
}
