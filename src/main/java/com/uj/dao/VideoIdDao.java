package com.uj.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.uj.dto.VideoIdDto;
import com.yg.dao.DBConnection;

public class VideoIdDao {
	public ArrayList<VideoIdDto> moviePosterImage() throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<VideoIdDto> moviePosterList = new ArrayList<VideoIdDto>();
		String sql = "select rownum,movie_drama_id,poster_image from movie_drama_main where movie_drama_id >= 158 and movie_drama_id <= 160 order by dbms_random.random()";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String posterImage = rs.getString("poster_image");
			VideoIdDto image = new VideoIdDto(movieDramaId,posterImage);
			moviePosterList.add(image);
		}
		rs.close();
    	pstmt.close();
		return moviePosterList;
	}
	public ArrayList<VideoIdDto> dramaPosterImage() throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<VideoIdDto> moviePosterList = new ArrayList<VideoIdDto>();
		String sql = "select rownum,movie_drama_id,poster_image from movie_drama_main where movie_drama_id >= 1 and movie_drama_id <= 3 order by dbms_random.random()";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String posterImage = rs.getString("poster_image");
			VideoIdDto image = new VideoIdDto(movieDramaId,posterImage);
			moviePosterList.add(image);
		}
		rs.close();
    	pstmt.close();
		return moviePosterList;
	}
	public ArrayList<VideoIdDto> viewingContents() throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<VideoIdDto> viewingContents = new ArrayList<VideoIdDto>();
		String sql = "select v.movie_drama_id,mdm.poster_image from movie_drama_main mdm, viewing v where mdm.movie_drama_id = v.movie_drama_id and v.profile_id = 1 order by viewing_date";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String posterImage = rs.getString("poster_image");
			
			viewingContents.add(new VideoIdDto(movieDramaId,posterImage));
		}
		rs.close();
    	pstmt.close();
    	return viewingContents;
	}
	public ArrayList<VideoIdDto> dibContents() throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<VideoIdDto> dibContents = new ArrayList<VideoIdDto>();
		String sql = "select dc.movie_drama_id,dc.profile_id,mdm.poster_image from dib_contents dc,movie_drama_main mdm,profile p where dc.movie_drama_id = mdm.movie_drama_id and dc.profile_id = p.profile_id and dc.profile_id = 1";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next() ) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String posterImage = rs.getString("poster_image");
			
			dibContents.add(new VideoIdDto(movieDramaId,posterImage));
		}
		rs.close();
    	pstmt.close();
    	return dibContents;
	}
	 public ArrayList<VideoIdDto> top1Movie() throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<VideoIdDto> topMovie = new ArrayList<VideoIdDto>();
		String sql = "select s2.* from(select rownum rnum,s.* from (select movie_drama_id,poster_image, rank() over(order by hitcount desc) as rank from movie_drama_main where movie_drama_id >= 158 and movie_drama_id <= 402 order by rank) s) s2 where rnum = 1";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String posterImage = rs.getString("poster_image");
			
			topMovie.add(new VideoIdDto(movieDramaId,posterImage));
		}
		rs.close();
		pstmt.close();
		return topMovie;
	 }
	 public ArrayList<VideoIdDto> top2Movie() throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<VideoIdDto> topMovie = new ArrayList<VideoIdDto>();
		String sql = "select s2.* from(select rownum rnum,s.* from (select movie_drama_id,poster_image, rank() over(order by hitcount desc) as rank from movie_drama_main where movie_drama_id >= 158 and movie_drama_id <= 402 order by rank) s) s2 where rnum = 2";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String posterImage = rs.getString("poster_image");
			
			topMovie.add(new VideoIdDto(movieDramaId,posterImage));
		}
		rs.close();
		pstmt.close();
		return topMovie;
	 }
	 public ArrayList<VideoIdDto> top3Movie() throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<VideoIdDto> topMovie = new ArrayList<VideoIdDto>();
		String sql = "select s2.* from(select rownum rnum,s.* from (select movie_drama_id,poster_image, rank() over(order by hitcount desc) as rank from movie_drama_main where movie_drama_id >= 158 and movie_drama_id <= 402 order by rank) s) s2 where rnum = 3";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String posterImage = rs.getString("poster_image");
			
			topMovie.add(new VideoIdDto(movieDramaId,posterImage));
		}
		rs.close();
		pstmt.close();
		return topMovie;
	 }
	 public ArrayList<VideoIdDto> top4Movie() throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<VideoIdDto> topMovie = new ArrayList<VideoIdDto>();
		String sql = "select s2.* from(select rownum rnum,s.* from (select movie_drama_id,poster_image, rank() over(order by hitcount desc) as rank from movie_drama_main where movie_drama_id >= 158 and movie_drama_id <= 402 order by rank) s) s2 where rnum = 4";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String posterImage = rs.getString("poster_image");
			
			topMovie.add(new VideoIdDto(movieDramaId,posterImage));
		}
		rs.close();
		pstmt.close();
		return topMovie;
	 }
	 public ArrayList<VideoIdDto> top5Movie() throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<VideoIdDto> topMovie = new ArrayList<VideoIdDto>();
		String sql = "select s2.* from(select rownum rnum,s.* from (select movie_drama_id,poster_image, rank() over(order by hitcount desc) as rank from movie_drama_main where movie_drama_id >= 158 and movie_drama_id <= 402 order by rank) s) s2 where rnum = 5";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String posterImage = rs.getString("poster_image");
			
			topMovie.add(new VideoIdDto(movieDramaId,posterImage));
		}
		rs.close();
		pstmt.close();
		return topMovie;
	 }
	 public ArrayList<VideoIdDto> top6Movie() throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<VideoIdDto> topMovie = new ArrayList<VideoIdDto>();
		String sql = "select s2.* from(select rownum rnum,s.* from (select movie_drama_id,poster_image, rank() over(order by hitcount desc) as rank from movie_drama_main where movie_drama_id >= 158 and movie_drama_id <= 402 order by rank) s) s2 where rnum = 6";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String posterImage = rs.getString("poster_image");
			
			topMovie.add(new VideoIdDto(movieDramaId,posterImage));
		}
		rs.close();
		pstmt.close();
		return topMovie;
	 }
	 public ArrayList<VideoIdDto> top7Movie() throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<VideoIdDto> topMovie = new ArrayList<VideoIdDto>();
		String sql = "select s2.* from(select rownum rnum,s.* from (select movie_drama_id,poster_image, rank() over(order by hitcount desc) as rank from movie_drama_main where movie_drama_id >= 158 and movie_drama_id <= 402 order by rank) s) s2 where rnum = 7";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String posterImage = rs.getString("poster_image");
			
			topMovie.add(new VideoIdDto(movieDramaId,posterImage));
		}
		rs.close();
		pstmt.close();
		return topMovie;
	 }
	 public ArrayList<VideoIdDto> top8Movie() throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<VideoIdDto> topMovie = new ArrayList<VideoIdDto>();
		String sql = "select s2.* from(select rownum rnum,s.* from (select movie_drama_id,poster_image, rank() over(order by hitcount desc) as rank from movie_drama_main where movie_drama_id >= 158 and movie_drama_id <= 402 order by rank) s) s2 where rnum = 8";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String posterImage = rs.getString("poster_image");
			
			topMovie.add(new VideoIdDto(movieDramaId,posterImage));
		}
		rs.close();
		pstmt.close();
		return topMovie;
	 }
	 public ArrayList<VideoIdDto> top9Movie() throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<VideoIdDto> topMovie = new ArrayList<VideoIdDto>();
		String sql = "select s2.* from(select rownum rnum,s.* from (select movie_drama_id,poster_image, rank() over(order by hitcount desc) as rank from movie_drama_main where movie_drama_id >= 158 and movie_drama_id <= 402 order by rank) s) s2 where rnum = 9";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String posterImage = rs.getString("poster_image");
			
			topMovie.add(new VideoIdDto(movieDramaId,posterImage));
		}
		rs.close();
		pstmt.close();
		return topMovie;
	 }
	 public ArrayList<VideoIdDto> top10Movie() throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<VideoIdDto> topMovie = new ArrayList<VideoIdDto>();
		String sql = "select s2.* from(select rownum rnum,s.* from (select movie_drama_id,poster_image, rank() over(order by hitcount desc) as rank from movie_drama_main where movie_drama_id >= 158 and movie_drama_id <= 402 order by rank) s) s2 where rnum = 10";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String posterImage = rs.getString("poster_image");
			
			topMovie.add(new VideoIdDto(movieDramaId,posterImage));
		}
		rs.close();
		pstmt.close();
		return topMovie;
	 }
 
	 public ArrayList<VideoIdDto> top2Drama() throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<VideoIdDto> topDrama = new ArrayList<VideoIdDto>();
		String sql = "select s2.* from(select rownum rnum,s.* from (select movie_drama_id,poster_image, rank() over(order by hitcount desc) as rank from movie_drama_main where movie_drama_id >= 1 and movie_drama_id <= 157 order by rank) s) s2 where rnum = 2";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String posterImage = rs.getString("poster_image");
			
			topDrama.add(new VideoIdDto(movieDramaId,posterImage));
		}
		return topDrama;
	 }
	 public ArrayList<VideoIdDto> top3Drama() throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<VideoIdDto> topDrama = new ArrayList<VideoIdDto>();
		String sql = "select s2.* from(select rownum rnum,s.* from (select movie_drama_id,poster_image, rank() over(order by hitcount desc) as rank from movie_drama_main where movie_drama_id >= 1 and movie_drama_id <= 157 order by rank) s) s2 where rnum = 3";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String posterImage = rs.getString("poster_image");
			
			topDrama.add(new VideoIdDto(movieDramaId,posterImage));
		}
		return topDrama;
	 }
	 public ArrayList<VideoIdDto> top4Drama() throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<VideoIdDto> topDrama = new ArrayList<VideoIdDto>();
		String sql = "select s2.* from(select rownum rnum,s.* from (select movie_drama_id,poster_image, rank() over(order by hitcount desc) as rank from movie_drama_main where movie_drama_id >= 1 and movie_drama_id <= 157 order by rank) s) s2 where rnum = 4";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String posterImage = rs.getString("poster_image");
			
			topDrama.add(new VideoIdDto(movieDramaId,posterImage));
		}
		return topDrama;
	 }
	 public ArrayList<VideoIdDto> top5Drama() throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<VideoIdDto> topDrama = new ArrayList<VideoIdDto>();
		String sql = "select s2.* from(select rownum rnum,s.* from (select movie_drama_id,poster_image, rank() over(order by hitcount desc) as rank from movie_drama_main where movie_drama_id >= 1 and movie_drama_id <= 157 order by rank) s) s2 where rnum = 5";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String posterImage = rs.getString("poster_image");
			
			topDrama.add(new VideoIdDto(movieDramaId,posterImage));
		}
		return topDrama;
	 }
	 public ArrayList<VideoIdDto> top6Drama() throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<VideoIdDto> topDrama = new ArrayList<VideoIdDto>();
		String sql = "select s2.* from(select rownum rnum,s.* from (select movie_drama_id,poster_image, rank() over(order by hitcount desc) as rank from movie_drama_main where movie_drama_id >= 1 and movie_drama_id <= 157 order by rank) s) s2 where rnum = 6";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String posterImage = rs.getString("poster_image");
			
			topDrama.add(new VideoIdDto(movieDramaId,posterImage));
		}
		return topDrama;
	 }
	 public ArrayList<VideoIdDto> top7Drama() throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<VideoIdDto> topDrama = new ArrayList<VideoIdDto>();
		String sql = "select s2.* from(select rownum rnum,s.* from (select movie_drama_id,poster_image, rank() over(order by hitcount desc) as rank from movie_drama_main where movie_drama_id >= 1 and movie_drama_id <= 157 order by rank) s) s2 where rnum = 7";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String posterImage = rs.getString("poster_image");
			
			topDrama.add(new VideoIdDto(movieDramaId,posterImage));
		}
		return topDrama;
	 }
	 public ArrayList<VideoIdDto> top8Drama() throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<VideoIdDto> topDrama = new ArrayList<VideoIdDto>();
		String sql = "select s2.* from(select rownum rnum,s.* from (select movie_drama_id,poster_image, rank() over(order by hitcount desc) as rank from movie_drama_main where movie_drama_id >= 1 and movie_drama_id <= 157 order by rank) s) s2 where rnum = 8";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String posterImage = rs.getString("poster_image");
			
			topDrama.add(new VideoIdDto(movieDramaId,posterImage));
		}
		return topDrama;
	 }
	 public ArrayList<VideoIdDto> top9Drama() throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<VideoIdDto> topDrama = new ArrayList<VideoIdDto>();
		String sql = "select s2.* from(select rownum rnum,s.* from (select movie_drama_id,poster_image, rank() over(order by hitcount desc) as rank from movie_drama_main where movie_drama_id >= 1 and movie_drama_id <= 157 order by rank) s) s2 where rnum = 9";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String posterImage = rs.getString("poster_image");
			
			topDrama.add(new VideoIdDto(movieDramaId,posterImage));
		}
		return topDrama;
	 }
	 public ArrayList<VideoIdDto> top10Drama() throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<VideoIdDto> topDrama = new ArrayList<VideoIdDto>();
		String sql = "select s2.* from(select rownum rnum,s.* from (select movie_drama_id,poster_image, rank() over(order by hitcount desc) as rank from movie_drama_main where movie_drama_id >= 1 and movie_drama_id <= 157 order by rank) s) s2 where rnum = 10";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String posterImage = rs.getString("poster_image");
			
			topDrama.add(new VideoIdDto(movieDramaId,posterImage));
		}
		return topDrama;
	 }
	 public ArrayList<VideoIdDto> top1Drama() throws Exception {
		Connection conn = DBConnection.getConnection();
		ArrayList<VideoIdDto> topDrama = new ArrayList<VideoIdDto>();
		String sql = "select s2.* from(select rownum rnum,s.* from (select movie_drama_id,poster_image, rank() over(order by hitcount desc) as rank from movie_drama_main where movie_drama_id >= 1 and movie_drama_id <= 157 order by rank) s) s2 where rnum = 1";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int movieDramaId = rs.getInt("movie_drama_id");
			String posterImage = rs.getString("poster_image");
			
			topDrama.add(new VideoIdDto(movieDramaId,posterImage));
		}
		return topDrama;
	 }
	 public ArrayList<VideoIdDto> koreaDrama() throws Exception {
	 	Connection conn = DBConnection.getConnection();
	 	ArrayList<VideoIdDto> koreaDrama = new ArrayList<VideoIdDto>();
	 	String sql = "select rownum,movie_drama_id,poster_image from movie_drama_main where movie_drama_id >= 1 and movie_drama_id <= 157 and genre like '%한국%' and rownum<=35 order by dbms_random.random()";
	 	PreparedStatement pstmt = conn.prepareStatement(sql);
	 	ResultSet rs = pstmt.executeQuery();
	 	
	 	while(rs.next()) {
	 		int movieDramaId = rs.getInt("movie_drama_id");
	 		String posterImage = rs.getString("poster_image");
	 		
	 		koreaDrama.add(new VideoIdDto(movieDramaId,posterImage));
	 	}
	 	return koreaDrama;
 	 }
	 public ArrayList<VideoIdDto> SFDrama() throws Exception {
	 	Connection conn = DBConnection.getConnection();
	 	ArrayList<VideoIdDto> sfDrama = new ArrayList<VideoIdDto>();
	 	String sql = "select rownum,movie_drama_id,poster_image from movie_drama_main where movie_drama_id >= 1 and movie_drama_id <= 157 and genre like '%SF%' and rownum<=35 order by dbms_random.random()";
	 	PreparedStatement pstmt = conn.prepareStatement(sql);
	 	ResultSet rs = pstmt.executeQuery();
	 	
	 	while(rs.next()) {
	 		int movieDramaId = rs.getInt("movie_drama_id");
	 		String posterImage = rs.getString("poster_image");
	 		
	 		sfDrama.add(new VideoIdDto(movieDramaId,posterImage));
	 	}
	 	return sfDrama;
	 }
	 public ArrayList<VideoIdDto> comedyDrama() throws Exception {
		 Connection conn = DBConnection.getConnection();
		 ArrayList<VideoIdDto> comedyDrama = new ArrayList<VideoIdDto>();
		 String sql = "select rownum,movie_drama_id,poster_image from movie_drama_main where movie_drama_id >= 1 and movie_drama_id <= 157 and genre like '%코%' and rownum<=35 order by dbms_random.random()";
		 PreparedStatement pstmt = conn.prepareStatement(sql);
		 ResultSet rs = pstmt.executeQuery();
		 
		 while(rs.next()) {
			 int movieDramaId = rs.getInt("movie_drama_id");
	 		 String posterImage = rs.getString("poster_image");
	 		
	 		 comedyDrama.add(new VideoIdDto(movieDramaId,posterImage));
		 }
		 return comedyDrama;
	 }
	 public ArrayList<VideoIdDto> romanceDrama() throws Exception {
		 Connection conn = DBConnection.getConnection();
		 ArrayList<VideoIdDto> romanceDrama = new ArrayList<VideoIdDto>();
		 String sql = "select rownum,movie_drama_id,poster_image from movie_drama_main where movie_drama_id >= 1 and movie_drama_id <= 157 and genre like '%로%' and rownum<=35 order by dbms_random.random()";
		 PreparedStatement pstmt = conn.prepareStatement(sql);
		 ResultSet rs = pstmt.executeQuery();
		 
		 while(rs.next()) {
			 int movieDramaId = rs.getInt("movie_drama_id");
			 String posterImage = rs.getString("poster_image");
			 
			 romanceDrama.add(new VideoIdDto(movieDramaId,posterImage));
		 }
		 return romanceDrama;
	 }
	 public ArrayList<VideoIdDto> overseasDrama() throws Exception {
		 Connection conn = DBConnection.getConnection();
		 ArrayList<VideoIdDto> overseasDrama = new ArrayList<VideoIdDto>();
		 String sql = "select rownum,movie_drama_id,poster_image from movie_drama_main where movie_drama_id >= 1 and movie_drama_id <= 157 and genre like '%로%' and rownum<=35 order by dbms_random.random()";
		 PreparedStatement pstmt = conn.prepareStatement(sql);
		 ResultSet rs = pstmt.executeQuery();
		 
		 while(rs.next()) {
			 int movieDramaId = rs.getInt("movie_drama_id");
			 String posterImage = rs.getString("poster_image");
			 
			 overseasDrama.add(new VideoIdDto(movieDramaId,posterImage));
		 }
		 return overseasDrama;
	 }
	 public ArrayList<VideoIdDto> romanceMovie() throws Exception {
		 Connection conn = DBConnection.getConnection();
		 ArrayList<VideoIdDto> romanceMovie = new ArrayList<VideoIdDto>();
		 String sql = "select rownum,movie_drama_id,poster_image from movie_drama_main where movie_drama_id >= 158 and movie_drama_id <= 402 and genre like '%로%' and rownum<=35 order by dbms_random.random()";
		 PreparedStatement pstmt = conn.prepareStatement(sql);
		 ResultSet rs = pstmt.executeQuery();
		 
		 while(rs.next()) {
			 int movieDramaId = rs.getInt("movie_drama_id");
			 String posterImage = rs.getString("poster_image");
			 
			 romanceMovie.add(new VideoIdDto(movieDramaId,posterImage));
		 }
		 return romanceMovie;
	 }
	 public ArrayList<VideoIdDto> animationMovie() throws Exception {
		 Connection conn = DBConnection.getConnection();
		 ArrayList<VideoIdDto> animationMovie = new ArrayList<VideoIdDto>();
		 String sql = "select rownum,movie_drama_id,poster_image from movie_drama_main where movie_drama_id >= 158 and movie_drama_id <= 402 and genre like '%애니%' and rownum<=35 order by dbms_random.random()";
		 PreparedStatement pstmt = conn.prepareStatement(sql);
		 ResultSet rs = pstmt.executeQuery();
		 
		 while(rs.next()) {
			 int movieDramaId = rs.getInt("movie_drama_id");
			 String posterImage = rs.getString("poster_image");
			 
			 animationMovie.add(new VideoIdDto(movieDramaId,posterImage));
		 }
		 return animationMovie;
	 }
	 public ArrayList<VideoIdDto> adventureMovie() throws Exception {
		 Connection conn = DBConnection.getConnection();
		 ArrayList<VideoIdDto> adventureMovie = new ArrayList<VideoIdDto>();
		 String sql = "select rownum,movie_drama_id,poster_image from movie_drama_main where movie_drama_id >= 158 and movie_drama_id <= 402 and genre like '%SF%' and rownum<=35 order by dbms_random.random()";
		 PreparedStatement pstmt = conn.prepareStatement(sql);
		 ResultSet rs = pstmt.executeQuery();
		 
		 while(rs.next()) {
			 int movieDramaId = rs.getInt("movie_drama_id");
			 String posterImage = rs.getString("poster_image");
			 
			 adventureMovie.add(new VideoIdDto(movieDramaId,posterImage));
		 }
		 return adventureMovie;
	 }
	 public ArrayList<VideoIdDto> comedyMovie() throws Exception {
		 Connection conn = DBConnection.getConnection();
		 ArrayList<VideoIdDto> comedyMovie = new ArrayList<VideoIdDto>();
		 String sql = "select rownum,movie_drama_id,poster_image from movie_drama_main where movie_drama_id >= 158 and movie_drama_id <= 402 and genre like '%코미디%' and rownum<=35 order by dbms_random.random()";
		 PreparedStatement pstmt = conn.prepareStatement(sql);
		 ResultSet rs = pstmt.executeQuery();
		 
		 while(rs.next()) {
			 int movieDramaId = rs.getInt("movie_drama_id");
			 String posterImage = rs.getString("poster_image");
			 
			 comedyMovie.add(new VideoIdDto(movieDramaId,posterImage));
		 }
		 return comedyMovie;
	 }
	 public ArrayList<VideoIdDto> actionMovie() throws Exception {
		 Connection conn = DBConnection.getConnection();
		 ArrayList<VideoIdDto> actionMovie = new ArrayList<VideoIdDto>();
		 String sql = "select rownum,movie_drama_id,poster_image from movie_drama_main where movie_drama_id >= 158 and movie_drama_id <= 402 and genre like '%액션%' and rownum<=35 order by dbms_random.random()";
		 PreparedStatement pstmt = conn.prepareStatement(sql);
		 ResultSet rs = pstmt.executeQuery();
		 
		 while(rs.next()) {
			 int movieDramaId = rs.getInt("movie_drama_id");
			 String posterImage = rs.getString("poster_image");
			 
			 actionMovie.add(new VideoIdDto(movieDramaId,posterImage));
		 }
		 return actionMovie;
	 } 
	 public ArrayList<VideoIdDto> searchContents(String search) throws Exception {
			Connection conn = DBConnection.getConnection();
			ArrayList<VideoIdDto> searchList = new ArrayList<VideoIdDto>();
			String sql = "select movie_drama_id, poster_image\r\n"
					+ "from movie_drama_main\r\n"
					+ "where title like ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int movieDramaId = rs.getInt("movie_drama_id");
				String posterImage = rs.getString("poster_image");
				VideoIdDto image = new VideoIdDto(movieDramaId,posterImage);
				searchList.add(image);
			}
			rs.close();
	    	pstmt.close();
	    	
	    	
	    	String sql1 = "select movie_drama_id, poster_image\r\n"
					+ "from movie_drama_main\r\n"
					+ "where actor like ?";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, "%"+search+"%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int movieDramaId = rs.getInt("movie_drama_id");
				String posterImage = rs.getString("poster_image");
				VideoIdDto image = new VideoIdDto(movieDramaId,posterImage);
				searchList.add(image);
			}
			rs.close();
			pstmt.close();
			
			
			String sql2 = "select movie_drama_id, poster_image\r\n"
					+ "from movie_drama_main\r\n"
					+ "where genre like ?";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, "%"+search+"%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int movieDramaId = rs.getInt("movie_drama_id");
				String posterImage = rs.getString("poster_image");
				VideoIdDto image = new VideoIdDto(movieDramaId,posterImage);
				searchList.add(image);
			}
			rs.close();
			pstmt.close();
	    	
			return searchList;
		}
	 public ArrayList<VideoIdDto> movieInfinityScroll(int startPage,int endPage) throws Exception {
		 Connection conn = DBConnection.getConnection();
		 ArrayList<VideoIdDto> infinityScroll = new ArrayList<VideoIdDto>();
		 String sql = "select movie_drama_id,poster_image "
					+ "from(select rownum rnum, s1.movie_drama_id,poster_image "
					+ "from(select movie_drama_id,poster_image from movie_drama_main where movie_drama_id >= 158 and movie_drama_id <= 402)s1)s2 "
					+ "where rnum>=? and rnum<=?"
					+ "order by dbms_random.random()";
		 PreparedStatement pstmt = conn.prepareStatement(sql);
		 pstmt.setInt(1,startPage);
		 pstmt.setInt(2,endPage);
		 ResultSet rs = pstmt.executeQuery();
		 while(rs.next()) {
			 int movieDramaId = rs.getInt("movie_drama_id");
			 String posterImage = rs.getString("poster_image");
			 infinityScroll.add(new VideoIdDto(movieDramaId,posterImage));
		 }
		 rs.close();
		 pstmt.close();
		 return infinityScroll;
	 }
	 public ArrayList<VideoIdDto> dramaInfinityScroll(int startPage,int endPage) throws Exception {
		 Connection conn = DBConnection.getConnection();
		 ArrayList<VideoIdDto> infinityScroll = new ArrayList<VideoIdDto>();
		 String sql = "select movie_drama_id,poster_image "
					+ "from(select rownum rnum, s1.movie_drama_id,poster_image "
					+ "from(select movie_drama_id,poster_image from movie_drama_main where movie_drama_id >= 1 and movie_drama_id <= 157)s1)s2 "
					+ "where rnum>=? and rnum<=?"
					+ "order by dbms_random.random()";
		 PreparedStatement pstmt = conn.prepareStatement(sql);
		 pstmt.setInt(1,startPage);
		 pstmt.setInt(2,endPage);
		 ResultSet rs = pstmt.executeQuery();
		 while(rs.next()) {
			 int movieDramaId = rs.getInt("movie_drama_id");
			 String posterImage = rs.getString("poster_image");
			 infinityScroll.add(new VideoIdDto(movieDramaId,posterImage));
		 }
		 rs.close();
		 pstmt.close();
		 return infinityScroll;
	 }
}























