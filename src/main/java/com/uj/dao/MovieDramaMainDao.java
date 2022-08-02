package com.uj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import com.uj.dto.MovieDramaMainSDto;
import com.yg.dao.DBConnection;

public class MovieDramaMainDao {
	static Random rd = new Random();
	
//	MovieDramaMainDao() {}
	
	public ArrayList<MovieDramaMainSDto> getVideoInformation() throws Exception,SQLException {
		ArrayList<MovieDramaMainSDto> Dtolist = new ArrayList<MovieDramaMainSDto>();
		Connection conn = DBConnection.getConnection();
		String sql = "select * from movie_drama_main order by movie_drama_id";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String title = rs.getString("title");
			String releaseDay = rs.getString("release_day");
			int age = rs.getInt("age");
			String stringAge = rs.getString("string_age");
			String director = rs.getString("director");
			String actor = rs.getString("actor");
			String genre = rs.getString("genre");
			String summary = rs.getString("summary");
			String posterImage = rs.getString("poster_image");
			String titleImage = rs.getString("title_image");
			String priview = rs.getString("priview");
			String priviewImage = rs.getString("priview_image");
			int hitCount = rs.getInt("hitcount");
			String firstVideo = rs.getString("first_video");
			String firstPlayTime = rs.getString("first_play_time");
			
			Dtolist.add(new MovieDramaMainSDto(movieDramaId,title,releaseDay,age,stringAge,director,actor,genre,summary,posterImage,titleImage,priview,priviewImage,hitCount,firstVideo,firstPlayTime));
		}
    	rs.close();
    	pstmt.close();
		return Dtolist;
	}
	
	static void getMovieData() throws ClassNotFoundException, SQLException {
		Connection conn = DBConnection.getConnection();
		String sql1 = "select movie_drama_id,age,priview_image,title_image,summary,first_video from movie_drama_main where movie_drama_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql1);
		pstmt.setInt(1, mainRandom());
		ResultSet rs = pstmt.executeQuery();

		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String priviewImage = rs.getString("priview_image");
			String titleImage = rs.getString("title_image");
			String summary = rs.getString("summary");
			String firstVideo = rs.getString("first_video");
			int age = rs.getInt("age");
		}
		rs.close();
    	pstmt.close();
	}
	static int mainRandom() throws ClassNotFoundException, SQLException {
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
