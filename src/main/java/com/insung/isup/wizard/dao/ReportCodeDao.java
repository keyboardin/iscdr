package com.insung.isup.wizard.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.insung.isup.common.util.CommonUtil;
import com.insung.isup.wizard.model.ReportCodeModel;
import com.insung.isup.wizard.model.TableSchemaModel;

@Repository @Transactional(value="transactionManager")
public class ReportCodeDao {

	@Autowired
    private SqlSession sqlSession; 
	
	//List 
	public List<ReportCodeModel> requestList(ReportCodeModel model) throws Exception {
		return sqlSession.selectList("ReportCodeDao.requestList", model);		
	}
	
	//List Child
	public List<ReportCodeModel> requestChildList(ReportCodeModel model) throws Exception {
		return sqlSession.selectList("ReportCodeDao.requestChildList", model);		
	}
	
	//Detail
	public ReportCodeModel requestDetail(ReportCodeModel model) throws Exception {
		return sqlSession.selectOne("ReportCodeDao.requestDetail", model);	
	}	
	
	//Insert
	public void requestInsert(ReportCodeModel model) throws Exception {
		sqlSession.insert("ReportCodeDao.requestInsert", model);
	}
	
	//Update
	public void requestUpdate(ReportCodeModel model) throws Exception {
		sqlSession.update("ReportCodeDao.requestUpdate", model);
	}
	
	//Delete
	public void requestDelete(ReportCodeModel model) throws Exception {
		sqlSession.delete("ReportCodeDao.requestDelete", model);
	}
	
	//Tree 
	public List<HashMap<String, Object>> requestTree(ReportCodeModel model) throws Exception {
		return sqlSession.selectList("ReportCodeDao.requestTree", model);		
	}
	
	
	//Column List 
	public List<TableSchemaModel> tableColumnList(TableSchemaModel model) throws SQLException {
		return sqlSession.selectList("ReportCodeDao.tableColumnList", model);		
	}
	
	//InsertBatch
	public void requestInsertBatch(ReportCodeModel model) throws Exception {
		sqlSession.delete("ReportCodeDao.requestDeleteBatch", model);
		
		String rpt_par_id = model.getRpt_par_id();
		String rpt_div = model.getRpt_div();
		String[] rpt_nm_arr = CommonUtil.getSplit(model.getRpt_nm(), ",");
		String[] tv01_arr = CommonUtil.getSplit(model.getTv01(), ",");
		String[] tv02_arr = CommonUtil.getSplit(model.getTv02(), ",");
		for(int i=0; i<rpt_nm_arr.length; i++) {
			System.out.println(rpt_nm_arr[i]);
			System.out.println(rpt_div);
			System.out.println(rpt_par_id);
			ReportCodeModel _model = new ReportCodeModel();
			String rpt_id = "";
			if("WHERE".equals(rpt_div)) {				
				rpt_id = rpt_par_id.replace("RT", "WH")+"_"+i;
				System.out.println(rpt_id);
			}else {
				rpt_id = rpt_par_id.replace("RT", "CM")+"_"+i;
				System.out.println(rpt_id);
			}
			
			_model.setRpt_id(rpt_id);
			_model.setRpt_par_id(rpt_par_id);
			_model.setRpt_nm(rpt_nm_arr[i]);
			_model.setRpt_div(rpt_div);
			_model.setTv01(tv01_arr[i]);
			_model.setTv02(tv02_arr[i]);
			_model.setPriority(i);
			sqlSession.insert("ReportCodeDao.requestInsertBatch", _model);
		}
		
	}
	
}
