package com.sns.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

public class PostLikeDAO {
	int loginID=1;
	
	public int likeAct(int postID) throws SQLException{
		Connection conn = DBConnection.getConnection();
		int result =0; //성공 1/ 실패 0
		try{
			
			String sql = "insert into like_manage_post (like_post_id, like_user) values (?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, postID);
			pstmt.setInt(2, loginID);
			pstmt.executeUpdate();

			pstmt.close();

			sql = "update post set like_cnt = (like_cnt+1) where post_id = " + postID;
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
			
		} catch (SQLIntegrityConstraintViolationException e) {
		
			/* Connection conn = DriverManager.getConnection(url, dbID, dbPW); */
			String sql = "delete from like_manage_post where like_post_id = ? and like_user = ? ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, postID);
			pstmt.setInt(2, loginID);
			pstmt.executeUpdate();
		
			pstmt.close();
		
			sql = "update post set like_cnt = (like_cnt-1) where post_id = " + postID;
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		
			pstmt.close();
			conn.close();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return result;
		
	}

}
