package com.insung.isup.emp.dao;

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
import com.insung.isup.emp.model.EmpModel;

@Repository @Transactional(value="transactionManager")
public class EmpSourceDao {
	
	private static final Logger logger = LoggerFactory.getLogger(EmpSourceDao.class);	
	
	@Autowired
    private SqlSession sqlSession; 
	
	//고객사 인사정보 원장 리스트
	public List<LinkedHashMap<String, Object>> requestEmpList() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		
		List<LinkedHashMap<String, Object>> resultList = new ArrayList<LinkedHashMap<String, Object>>();
		try{
			//String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
			//String url = "jdbc:sqlserver://192.168.229.44:1433;DatabaseName=ITSS";
			//String id = "sa";
			//String pw = "1234";
			
			EmpDbConfigModel empDbConfigModel = new EmpDbConfigModel();
			empDbConfigModel.setDb_id(1);
			empDbConfigModel = sqlSession.selectOne("EmpDbConfigDao.requestDetail", empDbConfigModel);	
			
			String driver = empDbConfigModel.getDriver();
			String url = empDbConfigModel.getUrl();
			String id = empDbConfigModel.getId();
			String pw = empDbConfigModel.getPw();
			String query = empDbConfigModel.getQuery();
			String split_flag = empDbConfigModel.getSplit_flag();
			
			Class.forName(driver);		
			con = DriverManager.getConnection(url, id, pw);
			//String sql = " SELECT USER_ID emp_no, USER_ID user_id, USER_NM emp_nm, GROUP_NM org_nm, "; 
			//sql += "POSITION pos_nm, OFFICE_TEL emp_tel, HP emp_mobile, UPD_DT upd_dt FROM BKL_VIEW_IP_PHONE_USERS ORDER BY UPD_DT ";			
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
				map.put("emp_no", rs.getString("emp_no"));
				map.put("user_id", rs.getString("user_id"));
				map.put("emp_nm", rs.getString("emp_nm"));
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
				map.put("upd_dt", rs.getString("UPD_DT"));
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
	
	
	//고객사 인사정보 원장 상세보기
	public EmpModel requestEmpDetail(String user_id) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		
		EmpModel empModel = null;
		
		try{
			EmpDbConfigModel empDbConfigModel = new EmpDbConfigModel();
			empDbConfigModel.setDb_id(1);
			empDbConfigModel = sqlSession.selectOne("EmpDbConfigDao.requestDetail", empDbConfigModel);	
			
			String driver = empDbConfigModel.getDriver();
			String url = empDbConfigModel.getUrl();
			String id = empDbConfigModel.getId();
			String pw = empDbConfigModel.getPw();
			String query = empDbConfigModel.getQuery();
			String split_flag = empDbConfigModel.getSplit_flag();
			
			Class.forName(driver);		
			con = DriverManager.getConnection(url, id, pw);
			
			//String sql = "SELECT USER_ID emp_no, USER_ID user_id, LOGINPWD user_pw, USER_NM user_nm, ";
			//sql += " GROUP_NM org_nm, POSITION pos_nm, OFFICE_TEL emp_tel, HP emp_mobile, UPD_DT upd_dt ";
			//sql+= "FROM BKL_VIEW_IP_PHONE_USERS WHERE UPPER(USER_ID)=UPPER(?) ";	
			String sql = " SELECT * FROM ( " ;
			sql = sql+query;
			sql = sql+" ) AS TT WHERE UPPER(user_id)=UPPER(?)";
			System.out.println(sql);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				empModel = new EmpModel();
				user_id = rs.getString("user_id");
				String user_pw = rs.getString("user_pw");
				String emp_no = rs.getString("user_id");
				String emp_nm = rs.getString("emp_nm");
				String org_nm = rs.getString("org_nm");
				String pos_nm = rs.getString("pos_nm");
				String emp_tel = rs.getString("emp_tel");
				
				String extension = "";
				if(!CommonUtil.isNull(emp_tel)&&emp_tel.length()>3) {
					if("1".equals(split_flag)) {
						extension = emp_tel.substring(0, 4); //앞부터 4자리
					} else if("2".equals(split_flag)) {
						extension = emp_tel.substring(emp_tel.length()-4, emp_tel.length()); //뒤부터 4자리
					}
				}
				
				String emp_mobile = rs.getString("emp_mobile");
				String upd_date = rs.getString("upd_dt");
				
				empModel.setUser_id(user_id);
				empModel.setEmp_no(emp_no);
				empModel.setUser_id(user_id);
				empModel.setUser_pw(user_pw);
				empModel.setEmp_nm(emp_nm);
				empModel.setOrg_nm(org_nm);
				empModel.setPos_nm(pos_nm);
				empModel.setEmp_tel(emp_tel);
				empModel.setExtension(extension);
				empModel.setEmp_mobile(emp_mobile);
				empModel.setUpd_date(upd_date);
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
		
		return empModel;
	}
	
	//고객 조직정보 원장
	public List<LinkedHashMap<String, Object>> requestOrgList() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		
		List<LinkedHashMap<String, Object>> resultList = new ArrayList<LinkedHashMap<String, Object>>();
		try{
			EmpDbConfigModel empDbConfigModel = new EmpDbConfigModel();
			empDbConfigModel.setDb_id(1);
			empDbConfigModel = sqlSession.selectOne("EmpDbConfigDao.requestDetail", empDbConfigModel);	
			
			String driver = empDbConfigModel.getDriver();
			String url = empDbConfigModel.getUrl();
			String id = empDbConfigModel.getId();
			String pw = empDbConfigModel.getPw();
			
			Class.forName(driver);		
			con = DriverManager.getConnection(url, id, pw);
			String sql = "SELECT * FROM DEPTINFO WHERE delflag='N' ORDER BY deptcode";			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
				logger.debug(rs.getString("deptcode"));
				map.put("org_cd", rs.getString("deptcode").trim());
				map.put("org_nm", rs.getString("deptname"));
				map.put("up_org_cd", rs.getString("maindeptcode").trim());
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
