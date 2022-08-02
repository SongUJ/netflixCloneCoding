package com.sns.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class PostingDAO {

	
	public int doPosting(int loginID, String content,String fileImg) throws Exception{
		int result =1;
		Connection conn = DBConnection.getConnection();
	
		String sql = "insert into post(post_id, writer, write_date, content, like_cnt, img_file_name)  values (seq_post_id.nextval,?,sysdate,?,0,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, loginID);
		pstmt.setString(2, content);
		pstmt.setString(3,fileImg);
		result =pstmt.executeUpdate();
		
		
		//해시태그 판별 
		sql = "select max(post_id) from post";
		pstmt = conn.prepareStatement(sql);

		ResultSet rs = pstmt.executeQuery();
		int postID = 0;		//post_hashtag에 insert할 때 사용하기 위한 변수
		while (rs.next()) {
			postID = rs.getInt("max(post_id)");
		}
		
		rs.close();
		pstmt.close();

		// 해시태그 판별_"#" 다음에 오는 토큰을 해시태그로 판별
		ArrayList<String> hashtagList = new ArrayList<String>();
		StringTokenizer isHashtag = new StringTokenizer(content, "# ", true);
		String hashtag;
		boolean nextIsIt = false;

		
		while (isHashtag.hasMoreTokens()) {
			hashtag = isHashtag.nextToken();

			if (nextIsIt) {
				hashtagList.add(hashtag);
				nextIsIt = false;
			}

			if (hashtag.equals("#")) {
				nextIsIt = true;
			}
		}
		
		//arrayList를 배열로 변환. -> post_hashtag테이블에 insert할때 필요함
		String[] hashtagArray = hashtagList.toArray(new String[0]);
		
		// 해시태그 테이블에 이미 같은 hashtag_name이 존재하는지 판단.
		// 이미 존재하는 hashtagName이라면 HashtagList에서 삭제(insert x), 존재하지 않는다면 hashtag테이블에 insert
		sql = "select * from hashtag";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			String hName = rs.getString("hashtag_name");
			if (hashtagList.contains(hName)) {
				hashtagList.remove(hName);
			}
		}
		rs.close();
		pstmt.close();

		for (String hName : hashtagList) {
			sql = "insert into hashtag(hashtag_id , hashtag_name) values(seq_hashtag_id.nextval,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hName);
			pstmt.executeUpdate();
			pstmt.close();
		}

		
		// postID와 hashtagArray 각 요소들을 이용해서 insert into post_hashtag(post_id, hashtag_id, sysdate)
		for (String s : hashtagArray) {
			sql = "INSERT INTO post_hashtag(post_id, hashtag_id, trend_date) VALUES(?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postID);
			
			//해시태그 id를 insert 해야하기 떄문에 해시태그name을 id로 번환해주는 과정이 필요
			Hashtag alterHashtag = new Hashtag();
			int hashtagID = Hashtag.alterHashtagID(s);
			pstmt.setInt(2, hashtagID);
			pstmt.executeUpdate();
		}

			
		return result;
	}
	
	public int delPost(int postID) throws Exception{
		Connection conn = DBConnection.getConnection();
		int result =0;
		
		//포스팅에 달린 댓글먼저 삭제
		try {
		String sql = "delete from comments where post_id =?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, postID);
		pstmt.executeUpdate();
		pstmt.close();
		
		//포스팅에 달린 해시태그 먼저 삭제
		sql = "delete from post_hashtag where post_id =? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, postID);
		pstmt.executeUpdate();
		pstmt.close();
		
		//포스팅에 좋아요 삭제
		sql = "delete from like_manage_post where like_post_id =? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, postID);
		pstmt.executeUpdate();
		pstmt.close();

		//포스팅 삭제
		sql = "delete from post where post_id =?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, postID);
		pstmt.executeUpdate();
		pstmt.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	
		return result;
	}
	
	//포스트 수정
	public int postModify(String content, String imgFile, int postID) throws Exception {
		
		int result =0;
		Connection conn = DBConnection.getConnection();
		String sql = "update post set content = ? ,img_file_name=?, write_date = sysdate where post_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, content);
		pstmt.setString(2, imgFile);
		pstmt.setInt(3, postID);
		result =pstmt.executeUpdate();
		
		pstmt.close();
		return result;
		
	}
	
}
