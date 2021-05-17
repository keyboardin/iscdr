package com.insung;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class InsightLogTest {

	public static void main(String[] args) {
		
		FileInputStream fis = null;
//		#spring.datasource.hikari.postgresql.driverClassName=org.postgresql.Driver 
//		#spring.datasource.hikari.postgresql.jdbUrl=jdbc:postgresql://192.168.230.142:5432/isteams
//		spring.datasource.hikari.postgresql.driverClassName=net.sf.log4jdbc.sql.jdbcapi.DriverSpy
//		spring.datasource.hikari.postgresql.jdbcUrl=jdbc:log4jdbc:postgresql://192.168.230.142:5432/isstats
//		#spring.datasource.hikari.postgresql.jdbcUrl=jdbc:log4jdbc:postgresql://127.0.0.1:5432/isteams
//		spring.datasource.hikari.postgresql.username=insung
//		spring.datasource.hikari.postgresql.password=!Insung2018@
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	

		try {
			String driver = "net.sf.log4jdbc.sql.jdbcapi.DriverSpy";
			String url = "jdbc:log4jdbc:postgresql://192.168.230.142:5432/isstats";
			String id = "insung";
			String pw = "!Insung2018@";
			
			Class.forName(driver);		
			con = DriverManager.getConnection(url, id, pw);
			System.out.println(con);
			/*
			 * 
			 * //File myFile = new File("D:\\inSight_Collector.txt"); File myFile = new
			 * File("D:\\inSight_Collector_20201202.txt"); fis = new
			 * FileInputStream(myFile); BufferedReader rd = new BufferedReader(new
			 * InputStreamReader(fis));
			 * 
			 * String line = ""; int idx=1; while ((line = rd.readLine()) != null) {
			 * if(line.contains("SNMP_RAREQ_STATE_TIMEDOUT")) {
			 * //System.out.println(idx+" : "+line); //System.out.println(line.substring(1,
			 * 20)); System.out.println(idx+" : "+line.substring(line.lastIndexOf("=")+1,
			 * line.lastIndexOf("]"))); idx++; } }
			 */
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fis.close();
			}catch(IOException io) { 
				
			}
		}

	}
	
}
