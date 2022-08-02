package com.uj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.uj.dto.ProfileGetDto;
import com.yg.dao.DBConnection;

public class ProfileGetDao {
	public ArrayList<ProfileGetDto> profileId(int memberId) {
		ArrayList<ProfileGetDto> profileNum = new ArrayList<ProfileGetDto>();
		Connection conn = DBConnection.getConnection();
		String sql1 = "select gb.profile_id\n"
				+ "from member m , profile p , grade_board gb\n"
				+ "where m.member_id = p.member_id\n"
				+ "and p.profile_id = gb.profile_id\n"
				+ "and p.member_id = ?\n"
				+ "and gb.profile_id = 1";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1,memberId);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next() ) {
				int profileId = rs.getInt("profile_id");
				
				profileNum.add(new ProfileGetDto(profileId));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return profileNum;
	}
//	public ProfileGetDto profile(int memberId) {
//		Connection conn = DBConnection.getConnection();
//		String sql1 = "select gb.profile_id\n"
//				+ "from member m , profile p , grade_board gb\n"
//				+ "where m.member_id = p.member_id\n"
//				+ "and p.profile_id = gb.profile_id\n"
//				+ "and p.member_id = ?\n"
//				+ "and gb.profile_id = 1";
//		PreparedStatement pstmt;
//		try {
//			pstmt = conn.prepareStatement(sql1);
//			pstmt.setInt(1,memberId);
//			ResultSet rs = pstmt.executeQuery();
//			
//			if(rs.next() ) {
//				int profileId = rs.getInt("profileId");
//				ProfileGetDto pDto = new ProfileGetDto(profileId);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}
}
