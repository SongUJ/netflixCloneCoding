package com.sns.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

public class FollowDAO {

	
	
	public int follow(int userID,int loginID) throws Exception {
		int result =0;
		Connection conn = DBConnection.getConnection();
		try {
			
			String sql = "insert into follow (following, follower) values (?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, userID);
			pstmt.setInt(2, loginID);
			result =pstmt.executeUpdate();

			pstmt.close();
			return 1;
		
			//이미 해당데이터가 follow 테이블에 있다면
		} catch (SQLIntegrityConstraintViolationException e) {

			String sql = "delete from follow where following =? and follower= ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, userID);
			pstmt.setInt(2, loginID);
			result =pstmt.executeUpdate();

			pstmt.close();
			return -1;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	//팔로잉 했는지 판별
	public int existFollow(int userID, int loginID) throws Exception {
		
		Connection conn = DBConnection.getConnection();
		String sql = "select count(*) from follow where following=? and follower =? ";	//count(*)이 0개면 팔로잉 안되어있는것/ 1개면 팔로잉 되있는것
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, userID);
		pstmt.setInt(2, loginID);
		ResultSet rs = pstmt.executeQuery();
		
		int doFollow=0;
		if(rs.next()) {
			
			doFollow = rs.getInt("count(*)");
			System.out.println(doFollow);
			
		}
		
	
		return doFollow;
		
		
	}
	
	// 팔로잉 수
		public int getFollowingCnt(int userID) throws ClassNotFoundException, SQLException {
			
			Connection conn = DBConnection.getConnection();
			String sql = "SELECT p.nickname, count(f.following) as following_cnt from profile p, follow f "
					+ " where p.profile_id= f.follower and profile_id=?" +"group by nickname";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userID);
		
			int followingCnt = 0;
			
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				followingCnt = rs.getInt("following_cnt");
			
				
			}
			
			pstmt.close();
			rs.close();
		
			return followingCnt;
		}
			

		// 팔로워 수
		public int getFollowerCnt( int userID) throws Exception {
			Connection conn = DBConnection.getConnection();
			String sql = "SELECT p.nickname, count(f.follower) as follower_cnt from profile p, follow f "
					 	+" where p.profile_id= f.following and profile_id= ?" +" group by nickname";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userID);
			
			ResultSet rs = pstmt.executeQuery();
			int followerCnt = 0;
			if(rs.next()) {
				followerCnt = rs.getInt("follower_cnt");
			}
			
			rs.close();
			pstmt.close();
			
			return followerCnt;
		}
		
	
	
}
