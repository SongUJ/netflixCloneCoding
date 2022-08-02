package com.uj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

import com.uj.dto.LikeDto;
import com.uj.dto.UnLikeDto;
import com.yg.dao.DBConnection;

public class UnLikeDao {
	public int unLike(int commentId,int memberId) throws Exception,SQLException {
		ArrayList<UnLikeDto> Dtolist = new ArrayList<UnLikeDto>();
		Connection conn = DBConnection.getConnection();
		String sql = "select gb.profile_id\n"
				+ "from member m , profile p , grade_board gb\n"
				+ "where m.member_id = p.member_id\n"
				+ "and p.profile_id = gb.profile_id\n"
				+ "and p.member_id = ?\n"
				+ "and gb.profile_id = 1";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		UnLikeDto ulDto = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,memberId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				int profileId = rs.getInt("profile_id");
				ulDto = new UnLikeDto(profileId);
			}
			String sql2 = "insert into unlike_manage_board values(?,?)";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1,ulDto.getProfileId());
			pstmt.setInt(2,commentId);
			rs = pstmt.executeQuery();
			
			String sql3 = "update grade_board set unlike_hitcount=unlike_hitcount+1 where comment_id = ?";
			pstmt = conn.prepareStatement(sql3);
			pstmt.setInt(1,commentId);
			pstmt.executeUpdate();
			
			System.out.println("싫어요!");
			
			return 1;
		}catch (SQLIntegrityConstraintViolationException e) {
			String sql4 = "delete from unlike_manage_board where profile_id = ? and comment_id = ?";
			pstmt = conn.prepareStatement(sql4);
			pstmt.setInt(1,ulDto.getProfileId());
			pstmt.setInt(2,commentId);
			pstmt.executeUpdate();
			
			pstmt.close();
			
			String sql5 ="update grade_board set unlike_hitcount=unlike_hitcount-1 where comment_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,commentId);
			pstmt.executeUpdate();
			
			System.out.println("싫어요 취소!");

			return -1;
		}
	}
}
