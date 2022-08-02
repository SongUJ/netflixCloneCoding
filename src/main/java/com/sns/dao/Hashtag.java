package com.sns.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

class HashtagID {

	private int hashtagID;

	public int getHashtagID() {
		return hashtagID;
	}

	public void setHashtagID(int hashtagID) {
		this.hashtagID = hashtagID;
	}

}

public class Hashtag{
	static ArrayList<HashtagID> htList = new ArrayList<HashtagID>();
	
	public static int alterHashtagID(String hashtagName) throws Exception {
		
		  	String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbID = "sns";
			String dbPW = "1234";

			try {
				Class.forName(driver);
				DriverManager.getConnection(url, dbID, dbPW);

			} catch (Exception e) {
				e.printStackTrace();
			}	
			Connection conn = DriverManager.getConnection(url, dbID, dbPW);
			
			
		String sql = "select hashtag_id from hashtag where hashtag_name = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, hashtagName);
		ResultSet rs = pstmt.executeQuery();

		HashtagID ht = new HashtagID();
		while (rs.next()) {
			ht.setHashtagID(rs.getInt("hashtag_id"));
			htList.add(ht);

		}
		return ht.getHashtagID();

	}

	
}