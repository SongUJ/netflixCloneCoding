package com.sns.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ProfileUpdateDAO {
	
	int loginID = 1;
	
	
	public int pUpdate(String profileImg, String backImg, String nickname, String statement) throws Exception {
		Connection conn =  DBConnection.getConnection();
//		String profileImg = (String)request.getAttribute("filename1"); 
//		String backImg = (String)request.getAttribute("filename2"); 
//		String nickname = request.getParameter("nickname");  
//		String statement =request.getParameter("statement");
//		
		int result =1;
	
		String sql = "update profile set nickname= ? profile_img = ?, back_img = ? ,statemsg =? where profile_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		pstmt.setString(1, nickname);
		pstmt.setString(2, profileImg);
		pstmt.setString(3, backImg);
		pstmt.setString(4, statement);
		pstmt.setInt(5, loginID);
		pstmt.executeUpdate();		

		
		return result;
	}

//	public ArrayList<ProfileDTO>  bImgUpdate(String back_img) throws Exception {
//		ArrayList<ProfileDTO> pUpdateList = new ArrayList<>();
//		Connection conn =  DBConnection.getConnection();
//		String sql = "update profile set back_img = ?  where profile_id =?";
//		PreparedStatement pstmt = conn.prepareStatement(sql);
//		pstmt.setString(1,back_img);
//		pstmt.setInt(2, loginID);
//		
//		ResultSet rs = pstmt.executeQuery();
//		
//		if(rs.next()){
//			
//			String nickname= rs.getString("nickname");
//			String profileImg = rs.getString("profile_img");
//			String backImg = rs.getString("back_img");
//			String stateMsg = rs.getString("statemsg");
//			ProfileDTO prDto = new ProfileDTO(nickname,profileImg,backImg,stateMsg);
//			pUpdateList.add(prDto);
//			
//		}
//		return pUpdateList;
//	}
//	
//	public ArrayList<ProfileDTO>  stUpdate(String statement) throws Exception {
//		ArrayList<ProfileDTO> pUpdateList = new ArrayList<>();
//		Connection conn =  DBConnection.getConnection();
//		String sql = "update profile set statemsg= ?  where profile_id =?";
//		PreparedStatement pstmt = conn.prepareStatement(sql);
//		pstmt.setString(1,statement);
//		pstmt.setInt(2, loginID);
//		
//		ResultSet rs = pstmt.executeQuery();
//		
//		if(rs.next()){
//			
//			String nickname= rs.getString("nickname");
//			String profileImg = rs.getString("profile_img");
//			String backImg = rs.getString("back_img");
//			String stateMsg = rs.getString("statemsg");
//			ProfileDTO prDto = new ProfileDTO(nickname,profileImg,backImg,stateMsg);
//			pUpdateList.add(prDto);
//			
//		}
//		return pUpdateList;
//	}
	
	
		
	
}
