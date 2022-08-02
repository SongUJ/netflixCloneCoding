//package com.uj.dao;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//
//import com.yg.dao.DBConnection;
//
//public class CommentWriteDao {
//	public int addComment() {
//		Connection conn = DBConnection.getConnection();
//		String sql = "";
//		
//		int result = 0;
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(sql);
//			result = pstmt.executeUpdate();
//		}catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return result;
//	}
//}
