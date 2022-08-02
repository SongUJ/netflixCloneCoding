package com.uj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.uj.dto.ProfilesDto;
import com.yg.dao.DBConnection;

public class ProfilesDao {
	public ArrayList<ProfilesDto> profiles(String email) throws Exception {
		System.out.println(email);
		Connection conn = DBConnection.getConnection();
		ArrayList<ProfilesDto> profile = new ArrayList<ProfilesDto>();
		String sql ="select p.profile_id,p.nickname,p.profile_img from member m, profile p where m.member_id = p.member_id and m.email_address = 'cy97@gmail.com' order by p.profile_id";
		PreparedStatement pstmt = conn.prepareStatement(sql);
//		pstmt.setString(1, "'"+email+"'");
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int profile_id = rs.getInt("profile_id");
			String nickname = rs.getString("nickname");
			String photo = rs.getString("profile_img");
		}
		rs.close();
		pstmt.close();
		return profile;
	}
}
