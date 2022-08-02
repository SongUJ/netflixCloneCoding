package com.uj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.uj.dto.DramaRoundDto;
import com.yg.dao.DBConnection;

public class DramaRoundDao {
	public ArrayList<DramaRoundDto> dramaRoundBox(int setMovieDramaId) throws Exception {
		ArrayList<DramaRoundDto> dramaRoundList = new ArrayList<DramaRoundDto>();
		Connection conn = DBConnection.getConnection();
		String sql = "select movie_drama_id,episode_round,episode_image,episode_title,episode_summary,full_video,play_time from movie_drama_episode where movie_drama_id = ? order by episode_round desc";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,setMovieDramaId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			int episodeRound = rs.getInt("episode_round");
			String episodeImage = rs.getString("episode_image");
			String episodeTitle = rs.getString("episode_title");
			String episodeSummary = rs.getString("episode_summary");
			String fullVideo = rs.getString("full_video");
			String playTime = rs.getString("play_time");
			
			dramaRoundList.add(new DramaRoundDto(movieDramaId,episodeRound,episodeImage,episodeTitle,episodeSummary,fullVideo,playTime));
		}
		rs.close();
		pstmt.close();
		return dramaRoundList;
	}
}
