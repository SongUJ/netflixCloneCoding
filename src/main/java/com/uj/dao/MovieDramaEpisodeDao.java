package com.uj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.uj.dto.MovieDramaEpisodeDto;
import com.yg.dao.DBConnection;

public class MovieDramaEpisodeDao {
	public ArrayList<MovieDramaEpisodeDto> getVideoDetailInformation() throws SQLException {
		ArrayList<MovieDramaEpisodeDto> list = new ArrayList<MovieDramaEpisodeDto>();
		Connection conn = DBConnection.getConnection();
		String sql = "select * from movie_drama_episode order by movie_drama_id";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_dram_id");
			int movieDramaIdx = rs.getInt("movie_drama_idx");
			int episodeRound = rs.getInt("episode_round");
			String episodeImage = rs.getString("episode_image");
			String episodeTitle = rs.getString("episode_titme");
			String episodeSummary = rs.getString("episode_summary");
			String fullVideo = rs.getString("full_video");
			String playTime = rs.getString("play_time");
			list.add(new MovieDramaEpisodeDto(movieDramaId,movieDramaIdx,episodeRound,episodeImage,episodeTitle,episodeSummary,fullVideo,playTime));
		}
		return list;
	}
//	public ArrayList<MovieDramaEpisodeDto> episodeInformation() throws Exception {
//		
//	}
}
