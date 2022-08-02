package test;

import java.sql.Array;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;

public class Movie {
	public static Random rd = new Random();
	public static ArrayList<PriviewRandom> list = new ArrayList<PriviewRandom >();
	public static void getMovieData() throws ClassNotFoundException, SQLException {   // id <---- 293
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@192.168.1.12:1521:xe";
		String dbID = "oraclePort";
		String dbPW = "1234";
		Connection conn = null;
		Class.forName(driver);
		conn = DriverManager.getConnection(url, dbID, dbPW);
		
		String sql = "select poster_image,priview_image,first_video,age,string_age,first_play_time,genre\r\n"
				+ "from movie_drama_main\r\n"
				+ "where movie_drama_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, mainRandom());
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			String poster_image = rs.getString("poster_image");
			String priview_image = rs.getString("priview_image");
			String first_video = rs.getString("first_video");
			String first_play_time = rs.getString("first_play_time");
			String genre = rs.getString("genre");
		}
		
		rs.close();
		pstmt.close();
		conn.close();
	}
	public static int mainRandom() throws ClassNotFoundException, SQLException {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@192.168.1.12:1521:xe";
		String dbID = "oraclePort";
		String dbPW = "1234";
		
		Connection conn = null;
		Class.forName(driver);
		conn = DriverManager.getConnection(url,dbID,dbPW);
		
		String sql = "select movie_drama_id from movie_drama_main where movie_drama_id >= 158 and movie_drama_id <=402";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		PriviewRandom PR = new PriviewRandom();
		while(rs.next()) {
			PR.setNumber(rs.getInt("movie_drama_id"));
			list.add(PR);
		}
		int[] arr = new int[1];
		arr[0] = rd.nextInt(PR.getNumber()+1);
		return arr[0];
	}
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		System.out.println(mainRandom());
	}
}
