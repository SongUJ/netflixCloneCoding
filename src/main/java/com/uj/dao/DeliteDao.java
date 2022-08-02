package com.uj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.yg.dao.DBConnection;

public class DeliteDao {
	public void delite(int commentId) throws Exception {
		Connection conn = DBConnection.getConnection();
		int result = 0;
		String sql = "delite from grade_board where comment_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,commentId);
		result = pstmt.executeUpdate();
		pstmt.close();
	}
}
