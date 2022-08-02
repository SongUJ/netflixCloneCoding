package com.cy.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LoginDAO {
	Connection conn= null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public LoginDAO() {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@192.168.1.12:1521:xe";
		String dbId = "oraclePort";
		String dbPw = "1234";
		
//		String driver = "oracle.jdbc.driver.OracleDriver";
//		String url = "jdbc:oracle:thin:@192.168.19.142:1521:xe";
//		String dbId = "myNetflix";
//		String dbPw = "1234";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,dbId,dbPw);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	public int Login(String email, String pw) {
		String pwData = null;
		
		String sql = "SELECT PASSWORD FROM MEMBER WHERE EMAIL_ADDRESS =?";
		try {
			pstmt = conn.prepareStatement(sql);//31번행 sql문을 사용하겠다
			pstmt.setString(1,email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pwData = rs.getString("password");	
			}
			rs.close();
			pstmt.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} 
		if(pw.equals(pwData)==true) {
			return 1; // 로그인 성공
		}else {
			return 0; // 로그인 실패
		}
	}
	public ArrayList<String> getemailList() {
		String sql = "select email_address from member";
		ArrayList<String> emailList = new ArrayList<String>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String email = rs.getString(1);
				emailList.add(email);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return emailList;
	}
	public void registkakao(String email) {
		String pw = ""+(int)((Math.random()*1000000));
		String name = "카카오";
		String sql = "insert into member values(seq_member.nextval,?,?,null,null,null,null,null,null,null,?,null,null,null,null,null,null,null,null,null,null,null)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void registnaver(String email) {
		String pw = ""+(int)((Math.random()*1000000));
		String name = "네이버";
		String sql = "insert into member values(seq_member.nextval,?,?,null,null,null,null,null,null,null,?,null,null,null,null,null,null,null,null,null,null,null)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
