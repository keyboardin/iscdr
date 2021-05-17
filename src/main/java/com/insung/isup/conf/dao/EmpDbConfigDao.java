package com.insung.isup.conf.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.insung.isup.common.util.CommonUtil;
import com.insung.isup.conf.model.EmpDbConfigModel;

@Repository @Transactional(value="transactionManager")
public class EmpDbConfigDao {
	
	private static final Logger logger = LoggerFactory.getLogger(EmpDbConfigDao.class);
	
	@Autowired
    private SqlSession sqlSession; 
	
	//List Count
	public EmpDbConfigModel requestListCount(EmpDbConfigModel empDbConfigModel) throws Exception {
		return sqlSession.selectOne("EmpDbConfigDao.requestListCount", empDbConfigModel);		
	} 
	
	//List 
	public List<EmpDbConfigModel> requestList(EmpDbConfigModel empDbConfigModel) throws Exception {
		return sqlSession.selectList("EmpDbConfigDao.requestList", empDbConfigModel);		
	}
	
	//Detail
	public EmpDbConfigModel requestDetail(EmpDbConfigModel empDbConfigModel) throws Exception {
		return sqlSession.selectOne("EmpDbConfigDao.requestDetail", empDbConfigModel);	
	}	
	
	//Insert
	public void requestInsert(EmpDbConfigModel empDbConfigModel) throws Exception {
		sqlSession.insert("EmpDbConfigDao.requestInsert", empDbConfigModel);
	}
	
	//Update
	public void requestUpdate(EmpDbConfigModel empDbConfigModel) throws Exception {
		sqlSession.update("EmpDbConfigDao.requestUpdate", empDbConfigModel);
	}
	
	//Delete
	public void requestDelete(EmpDbConfigModel empDbConfigModel) throws Exception {
		sqlSession.delete("EmpDbConfigDao.requestDelete", empDbConfigModel);
	}
	
	
	//Connection Valid
	public List<LinkedHashMap<String, Object>> requestValid(EmpDbConfigModel empDbConfigModel) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		
		List<LinkedHashMap<String, Object>> resultList = new ArrayList<LinkedHashMap<String, Object>>();
		
		String driver = empDbConfigModel.getDriver();
		String url = empDbConfigModel.getUrl();
		String id = empDbConfigModel.getId();
		String pw = empDbConfigModel.getPw();
		String query = empDbConfigModel.getQuery();
		String split_flag = empDbConfigModel.getSplit_flag();
		logger.debug(query);
		
		try {
			Class.forName(driver);		
			con = DriverManager.getConnection(url, id, pw);
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
				logger.debug("user_id : "+rs.getString("user_id"));
				map.put("emp_no", rs.getString("emp_no"));
				map.put("user_id", rs.getString("user_id"));
				map.put("emp_nm", rs.getString("emp_nm"));
				map.put("org_cd", rs.getString("org_cd"));
				map.put("org_nm", rs.getString("org_nm"));
				map.put("pos_nm", rs.getString("pos_nm"));
				String emp_tel = rs.getString("emp_tel");
				map.put("emp_tel", emp_tel);
				String extension = "";
				if(!CommonUtil.isNull(emp_tel)&&emp_tel.length()>3) {
					if("1".equals(split_flag)) {
						extension = emp_tel.substring(0, 4); //앞부터 4자리
					} else if("2".equals(split_flag)) {
						extension = emp_tel.substring(emp_tel.length()-4, emp_tel.length()); //뒤부터 4자리
					}
				}
				
				map.put("extension", extension);
				map.put("emp_mobile", rs.getString("emp_mobile"));
				map.put("emp_email", rs.getString("emp_email"));
				map.put("upd_dt", rs.getString("upd_dt"));
				resultList.add(map);
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try{
				rs.close();
				pstmt.close();
				con.close();
			}catch(SQLException ex){
				ex.printStackTrace();
			}			
		}
		
		return resultList;
	}
}
