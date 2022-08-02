package com.uj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Random;

import com.uj.dto.MainRandomDto;
import com.uj.dto.MovieDramaMainSDto;
import com.yg.dao.DBConnection;

public class MainRandomDao {
	public ArrayList<MainRandomDto> getRandom() throws Exception{
		ArrayList<MainRandomDto> mainTop = new ArrayList<MainRandomDto>();
		Connection conn = DBConnection.getConnection();
		String sql = "select movie_drama_id,age,priview_image,title_image,summary,first_video from movie_drama_main where movie_drama_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,randomValue());
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String priviewImage = rs.getString("priview_image");
			String titleImage = rs.getString("title_image");
			String summary = rs.getString("summary");
			String firstVideo = rs.getString("first_video");
			int age = rs.getInt("age");
			
			mainTop.add(new MainRandomDto(movieDramaId,priviewImage,titleImage,summary,firstVideo,age));
		}
		rs.close();
		pstmt.close();
		return mainTop;
		
	}
	static int randomValue() throws Exception {
		Random rd = new Random();
		Connection conn = DBConnection.getConnection();
		String sql2 = "select movie_drama_id from movie_drama_main";

		PreparedStatement pstmt = conn.prepareStatement(sql2);
		ResultSet rs = pstmt.executeQuery();
		MovieDramaMainSDto vI = new MovieDramaMainSDto();
		ArrayList<MovieDramaMainSDto> list = new ArrayList<MovieDramaMainSDto>();
		
		while(rs.next()) {
			vI.setMovieDramaId(rs.getInt("movie_drama_id"));
			list.add(vI);
		}
		int[] arr = new int[1];
		arr[0] = rd.nextInt(vI.getMovieDramaId()+1);

		return arr[0];
	}
}
