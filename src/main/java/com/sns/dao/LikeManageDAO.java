package com.sns.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;

public class LikeManageDAO {
	
 	int loginID = 1;
 	
	public int likeManage(int postID,int loginID) throws Exception {		// +1 리턴(채워줌) , -1 리턴(뺌) , 0 리턴(에러...)
		Connection conn = DBConnection.getConnection();

		try{
			
			String sql = "insert into like_manage_post (like_post_id, like_user) values (?,?)";		// 하트를 넣는 상황.
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, postID);
			pstmt.setInt(2, loginID);
			pstmt.executeUpdate();

			pstmt.close();

			sql = "update post set like_cnt = (like_cnt+1) where post_id = " + postID;
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
			return 1;
			
		} catch (SQLIntegrityConstraintViolationException e) {										// 하트를 뺴는 상황.
		
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

			return -1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0; 
	}
	
	
	
}
