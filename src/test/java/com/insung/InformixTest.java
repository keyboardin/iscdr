package com.insung;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class InformixTest {

	public static void main(String[] args) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		
		try {
			String driver = "com.informix.jdbc.IfxDriver";
			String url = "jdbc:informix-sqli://192.168.230.219:1504/db_cra:informixserver=uccx12_uccx";
			String id = "uccxhruser";
			String pw = "!Insung2020#";
			
			Class.forName(driver);		
			con = DriverManager.getConnection(url, id, pw);
			
			System.out.println(">>>>>>>>>>>>>>>.." +con);
//			String sql = "select * from BKL_VIEW_IP_PHONE_USERS2";
//			pstmt = con.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			while(rs.next()){
//				String query = "insert BKL_VIEW_IP_PHONE_USERS ( USER_ID, LOGINPWD, USER_NM, POSITION, GROUP_NM, OFFICE_TEL, HP, UPD_DT ) values ( ";
//				query += " '"+rs.getString("USER_ID")+"', ";
//				query += " '82887c86e972550aff484110bbd105eb', ";
//				query += " '"+rs.getString("USER_NM")+"', ";
//				query += " '"+rs.getString("POSITION")+"', ";
//				query += " '"+rs.getString("GROUP_NM")+"', ";
//				query += " '"+rs.getString("OFFICE_TEL")+"', ";
//				query += " '010-1111-1111', ";
//				query += " '"+rs.getString("UPD_DT")+"' ); ";
//				System.out.println(query);
//			}
			
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		
//		String phone = "";
//		if(!CommonUtil.isNull(phone)&&phone.contains("3400")) {
//			String a = phone.substring(phone.lastIndexOf("-")+1);
//			System.out.println(a);
//			/*String[] arr = CommonUtil.getSplit(phone, "-");
//			if(arr[1].equals("3400")) {
//				extension = arr[2];
//			}else {
//				extension="";
//			}*/
//		}
		
//		String id="admin";
//		String pw="spt4fkd!";
//		String auth = "Basic "; 
//		auth += new String(Base64.encode((id + ":" + pw).getBytes())); 
//		System.out.println(auth);
		
//		String a = "17";
//		String regex = "^[0-9]+$";
//		System.out.println(a.matches(regex));
	}
	
}
