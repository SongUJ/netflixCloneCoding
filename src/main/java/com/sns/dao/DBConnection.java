package com.sns.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private static Connection conn = null;
	
	public static Connection getConnection() {
		if(conn != null) {	//이미 접속한 경우
			return conn;
		}else {		//새롭게 접속을 해야하는 경우
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@192.168.1.12:1521:xe";
			String dbId = "oraclePort";
			String dbPw = "1234";
			
//			String driver = "oracle.jdbc.driver.OracleDriver";
//			String url = "jdbc:oracle:thin:@192.168.19.142:1521:xe";
//			String dbId = "myNetflix";
//			String dbPw = "1234";
			
			try {
				Class.forName(driver);
				conn = DriverManager.getConnection(url, dbId, dbPw);
			}catch(Exception e) {
				e.printStackTrace();
			}
			return conn;
		}
	}

	
}
