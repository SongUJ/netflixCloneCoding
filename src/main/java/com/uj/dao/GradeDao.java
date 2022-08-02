package com.uj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.uj.dto.CommentBoxDto;
import com.uj.dto.GradeDto;
import com.yg.dao.DBConnection;

public class GradeDao {
	public ArrayList<GradeDto> grade(int movieDramaId) throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<GradeDto> userCommentData = new ArrayList<GradeDto>();
		String sql = "select round(avg(sum(gb.user_grade)/count(gb.grade_id)),2) as 평점, \n"
				+ "count(gb.grade_id) as 참여 \n"
				+ "from grade_board gb,user_grade ug,movie_drama_main mdm \n"
				+ "where gb.profile_id = ug.profile_id \n"
				+ "and mdm.movie_drama_id = gb.movie_drama_id \n"
				+ "and gb.movie_drama_id = ?\n"
				+ "group by ug.user_grade,gb.grade_id";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,movieDramaId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			double grade = rs.getDouble("평점");
			int participation = rs.getInt("참여");
			
			userCommentData.add(new GradeDto(grade,participation));
		}
		rs.close();
		pstmt.close();
		return userCommentData;
	}
}
