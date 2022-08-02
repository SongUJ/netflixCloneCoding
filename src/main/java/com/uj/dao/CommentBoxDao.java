package com.uj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.uj.dto.CommentBoxDto;
import com.yg.dao.DBConnection;

public class CommentBoxDao {
//	public ArrayList<CommentBoxDto> userCommentData() throws Exception {
//		Connection conn = DBConnection.getConnection();
//		ArrayList<CommentBoxDto> userCommentData = new ArrayList<CommentBoxDto>();
//		String sql = "select gb.user_grade,gb.comment_id,gb.profile_id,gb.user_comment,gb.comment_date,gb.like_hitcount,gb.unlike_hitcount from grade_board gb, profile p, movie_drama_main mdm where gb.profile_id = p.profile_id and gb.movie_drama_id = mdm.movie_drama_id and mdm.movie_drama_id=? order by comment_date desc";
//		PreparedStatement pstmt = conn.prepareStatement(sql);
//		pstmt.setInt(1,158);
//		ResultSet rs = pstmt.executeQuery();
//		
//		while(rs.next()) {
//			int userGrade = rs.getInt("user_grade");
//			int commentId = rs.getInt("comment_id");
//			int profileId = rs.getInt("profile_id");
//			String userComment = rs.getString("user_comment");
//			String commentDate = rs.getString("comment_date");
//			int likeHitCount = rs.getInt("like_hitcount");
//			int unlikeHitCount = rs.getInt("unlike_hitcount");
//			
//			userCommentData.add(new CommentBoxDto(userGrade,commentId,profileId,userComment,commentDate,likeHitCount,unlikeHitCount));
//		}
//		rs.close();
//		pstmt.close();
//		return userCommentData;
//	}
	public ArrayList<CommentBoxDto> userCommentDataMyComment(int movieDramaId,int memberId) throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<CommentBoxDto> userCommentData = new ArrayList<CommentBoxDto>();
		String sql = "select gb.user_grade,gb.comment_id,p.nickname,gb.user_comment,gb.comment_date,gb.like_hitcount,gb.unlike_hitcount\n"
				+ "from member m,profile p,grade_board gb,movie_drama_main mdm\n"
				+ "where m.member_id = p.member_id\n"
				+ "and p.profile_id = gb.profile_id\n"
				+ "and mdm.movie_drama_id = gb.movie_drama_id\n"
				+ "and gb.movie_drama_id = ? \n"
				+ "and gb.profile_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,movieDramaId);
		pstmt.setInt(2,memberId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int userGrade = rs.getInt("user_grade");
			int commentId = rs.getInt("comment_id");
			String profileId = rs.getString("nickname");
			String userComment = rs.getString("user_comment");
			String commentDate = rs.getString("comment_date");
			int likeHitCount = rs.getInt("like_hitcount");
			int unlikeHitCount = rs.getInt("unlike_hitcount");
			
			userCommentData.add(new CommentBoxDto(userGrade,commentId,profileId,userComment,commentDate,likeHitCount,unlikeHitCount));
		}
		rs.close();
		pstmt.close();
		return userCommentData;
	}
	public ArrayList<CommentBoxDto> userCommentDataRecent(int movieDramaId) throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<CommentBoxDto> userCommentData = new ArrayList<CommentBoxDto>();
		String sql = "select gb.user_grade,gb.comment_id,p.nickname,gb.user_comment,gb.comment_date,gb.like_hitcount,gb.unlike_hitcount from grade_board gb, profile p, movie_drama_main mdm where gb.profile_id = p.profile_id and gb.movie_drama_id = mdm.movie_drama_id and mdm.movie_drama_id=? order by comment_date";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,movieDramaId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int userGrade = rs.getInt("user_grade");
			int commentId = rs.getInt("comment_id");
			String profileId = rs.getString("nickname");
			String userComment = rs.getString("user_comment");
			String commentDate = rs.getString("comment_date");
			int likeHitCount = rs.getInt("like_hitcount");
			int unlikeHitCount = rs.getInt("unlike_hitcount");
			
			userCommentData.add(new CommentBoxDto(userGrade,commentId,profileId,userComment,commentDate,likeHitCount,unlikeHitCount));
		}
		rs.close();
		pstmt.close();
		return userCommentData;
	}
	public ArrayList<CommentBoxDto> userCommentDataSympathyServlet(int movieDramaId) throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<CommentBoxDto> userCommentData = new ArrayList<CommentBoxDto>();
		String sql = "select gb.user_grade,gb.comment_id,p.nickname,gb.user_comment,gb.comment_date,gb.like_hitcount,gb.unlike_hitcount from grade_board gb, profile p, movie_drama_main mdm where gb.profile_id = p.profile_id and gb.movie_drama_id = mdm.movie_drama_id and mdm.movie_drama_id=? order by gb.like_hitcount asc";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,movieDramaId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int userGrade = rs.getInt("user_grade");
			int commentId = rs.getInt("comment_id");
			String profileId = rs.getString("nickname");
			String userComment = rs.getString("user_comment");
			String commentDate = rs.getString("comment_date");
			int likeHitCount = rs.getInt("like_hitcount");
			int unlikeHitCount = rs.getInt("unlike_hitcount");
			
			userCommentData.add(new CommentBoxDto(userGrade,commentId,profileId,userComment,commentDate,likeHitCount,unlikeHitCount));
		}
		rs.close();
		pstmt.close();
		return userCommentData;
	}
}
