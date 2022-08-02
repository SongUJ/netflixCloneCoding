package com.sns.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sns.dto.CommentDTO;

public class CommentDAO {
	
	//댓글작성
	public int addComment(int loginID,int postID, String comments) {   // 1:성공, 0:실패
		Connection conn = DBConnection.getConnection();
		String sql = "insert into comments(comment_id, post_id, writer, write_date, comments, like_cnt)  values (seq_comments.nextval,?,?,sysdate,?,0)";
		int result = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,postID);
			pstmt.setInt(2, loginID);
			pstmt.setString(3,comments);
			result = pstmt.executeUpdate();   // 영향받은 행의 개수를 리턴.
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//최근댓글 가져오기
	public CommentDTO getRecentComment(int postID) {
		Connection conn = DBConnection.getConnection();
		String sql ="select c.comments,c.post_id,c.comment_id, p.nickname, p.profile_img, to_char(c.write_date,'mm.dd') as writedate" 
				+" from comments c, profile p, post ps where ps.post_id = c.post_id" 
				+" and p.profile_id = c.writer and ps.post_id = ? ORDER BY c.comment_id DESC";
		ResultSet rs = null;
		CommentDTO dto = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,postID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int comment_id = rs.getInt("comment_id");
				int post_id = rs.getInt("post_id");
				String comments = rs.getString("comments");
				String nickname = rs.getString("nickname");
				String profile_img = rs.getString("profile_img");
				String writedate = rs.getString("writedate");
				dto = new CommentDTO(comment_id, post_id, comments, nickname, profile_img, writedate);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	
	//달린댓글 가져오기
	public ArrayList<CommentDTO> comments(int postID) {
		Connection conn = DBConnection.getConnection();
		String sql ="select c.comments,ps.post_id, c.comment_id, p.nickname, p.profile_img, to_char(c.write_date,'mm.dd HH24:MI') as writedate"
				+ " from comments c, profile p, post ps where ps.post_id = c.post_id"
				+ " and p.profile_id = c.writer and ps.post_id = ? order by writedate asc";
		ResultSet rs = null;
		ArrayList<CommentDTO> cList = new ArrayList<CommentDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,postID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int comment_id = rs.getInt("comment_id");
				int post_id = rs.getInt("post_id");
				String comments = rs.getString("comments");
				String nickname = rs.getString("nickname");
				String profile_img = rs.getString("profile_img");
				String writedate = rs.getString("writedate");

				CommentDTO dto= new CommentDTO(comment_id, post_id, comments, nickname, profile_img, writedate);
				cList.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return cList;
	}
	
	//댓글삭제하기
	public int delComment(int commentID) throws SQLException {
		Connection conn = DBConnection.getConnection();
		int result = 0;
		//포스팅에 달린 댓글먼저 삭제
		String sql = "delete from comments where comment_id =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commentID);
			pstmt.executeUpdate(); // 영향받은 행의 개수를 리턴.
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return result;
	}

}
