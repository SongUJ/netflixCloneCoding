package com.sns.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sns.dto.HashtagPostDTO;
import com.sns.dto.PostViewDTO;
import com.sns.dto.ProfileDTO;
import com.sns.dto.StartProfileDTO;

public class PostViewDAO {
	 
	 
	
	//타임라인 포스트 보기
	public ArrayList<PostViewDTO> timeLine(int loginID) throws Exception {
		ArrayList<PostViewDTO> postList = new ArrayList<PostViewDTO>();

		Connection conn = DBConnection.getConnection();

		String sql = "select p.nickname, p.profile_id, p.profile_img, ps.content, ps.img_file_name, ps.post_id ,like_cnt,to_char(ps.write_date, 'mm.dd HH24:mi') as writedate "
				+ " from profile p, post ps, follow f " + " where p.profile_id = ps.writer "
				+ " and ps.writer = f.following " + " and f.follower = ?"
				+ " union"
				+ " select p.nickname, p.profile_id, p.profile_img, ps.content, ps.img_file_name, ps.post_id ,like_cnt, to_char(ps.write_date, 'mm.dd HH24:mi') as writedate "
				+ " from profile p, post ps " + " where p.profile_id = ps.writer "
				+ " and writer = ? order by writedate desc";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, loginID);
		pstmt.setInt(2, loginID);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			int postID = rs.getInt("post_id");
			String writer = rs.getString("nickname");
			String writeDate = rs.getString("writedate");
			String content = rs.getString("content");
			String profileImg = rs.getString("profile_img");
			String imgFile = rs.getString("img_file_name");
			int likeCnt = rs.getInt("like_cnt");
			int profileID = rs.getInt("profile_id");
			PostViewDTO pDto = new PostViewDTO(postID,writer, writeDate, content, profileImg, imgFile, likeCnt,profileID);
			postList.add(pDto);

		}
		
		return postList;

	} 
	
	//프로필정보
	public ArrayList<ProfileDTO> viewProfile(int loginID) throws Exception {
		ArrayList<ProfileDTO> profileList = new ArrayList<ProfileDTO>();
		  
		Connection conn = DBConnection.getConnection();
		String sql ="select profile_id, profile_img, nickname, back_img, statemsg from profile where profile_id= ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, loginID);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()){
			
			String nickname= rs.getString("nickname");
			String profileImg = rs.getString("profile_img");
			String backImg = rs.getString("back_img");
			String stateMsg = rs.getString("statemsg");
			int profileID = rs.getInt("profile_id");
			ProfileDTO prDto = new ProfileDTO(nickname,profileImg,backImg,stateMsg,profileID);
			profileList.add(prDto);
			
		}
		
		return profileList;
		
	}
	
	//입장 프로필 결정하기
	public ArrayList<StartProfileDTO> startProfile(int memberID) throws Exception {
		ArrayList<StartProfileDTO> profileList = new ArrayList<StartProfileDTO>();
		  
		Connection conn = DBConnection.getConnection();
		String sql ="select profile_id,profile_img, nickname, back_img, statemsg from profile where member_id= ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, memberID);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			int profileID = rs.getInt("profile_id");
			String nickname= rs.getString("nickname");
			String profileImg = rs.getString("profile_img");
			String backImg = rs.getString("back_img");
			String stateMsg = rs.getString("statemsg");
			StartProfileDTO prDto = new StartProfileDTO(profileID,nickname,profileImg,backImg,stateMsg);
			profileList.add(prDto);
			
		}
		
		return profileList;
		
	}
	
	
	//내가 쓴 글
	public ArrayList<PostViewDTO> myPost(int loginID) throws Exception{
		ArrayList<PostViewDTO> myPostList = new ArrayList<PostViewDTO>();
		Connection conn = DBConnection.getConnection();
		String sql = "select content, nickname, p.profile_id,to_char(write_date,'mm.dd  HH24:mi') as writedate, profile_img, img_file_name, post_id, like_cnt " 
					+ " FROM profile p, post ps "
					+ " where ps.writer = p.profile_id and p.profile_id= ? order by writedate desc";
	      	PreparedStatement pstmt = conn.prepareStatement(sql);
	      	pstmt.setInt(1, loginID);
			ResultSet rs = pstmt.executeQuery();
			 
			while(rs.next()){
				int postID = rs.getInt("post_id");
				String writer = rs.getString("nickname");
				String writeDate = rs.getString("writedate");
				String content = rs.getString("content");
				String profileImg = rs.getString("profile_img");
				String imgFile = rs.getString("img_file_name");
				int likeCnt = rs.getInt("like_cnt");
				int profileID = rs.getInt("profile_id");
				PostViewDTO mpDto = new PostViewDTO(postID,writer, writeDate, content, profileImg, imgFile, likeCnt,profileID);
				myPostList.add(mpDto);
			}
			return myPostList;
	}
	
	//좋아요 누른 게시글
	public ArrayList<PostViewDTO> likePost(int loginID) throws Exception{
		ArrayList<PostViewDTO> likePostList = new ArrayList<PostViewDTO>();
		Connection conn = DBConnection.getConnection();
		
		String sql = "select content, nickname, p.profile_id,to_char(write_date,'mm.dd HH24:MI') as writedate, profile_img, img_file_name, post_id , like_cnt" 
				+ " from post ps, profile p ,like_manage_post lmp where ps.writer = p.profile_id "
				+ " and ps.post_id = lmp.like_post_id "
				+ " and lmp.like_user = ? order by writedate desc";
	  	PreparedStatement pstmt = conn.prepareStatement(sql);
	  	pstmt.setInt(1, loginID);
		ResultSet rs = pstmt.executeQuery();
		 
		while(rs.next()){
			int postID = rs.getInt("post_id");
			String writer = rs.getString("nickname");
			String writeDate = rs.getString("writedate");
			String content = rs.getString("content");
			String profileImg = rs.getString("profile_img");
			String imgFile = rs.getString("img_file_name");
			int likeCnt = rs.getInt("like_cnt");
			int profileID = rs.getInt("profile_id");
			PostViewDTO lpDto = new PostViewDTO(postID,writer, writeDate, content, profileImg, imgFile, likeCnt,profileID);
			likePostList.add(lpDto);
		}
		return likePostList;
	}
	
	//포스트 검색하기
	public ArrayList<HashtagPostDTO> searchPost(String keyword) throws Exception{
		ArrayList<HashtagPostDTO> searchPList = new ArrayList<HashtagPostDTO>();
		Connection conn = DBConnection.getConnection();
		
		String sql="select  p.nickname, ps.like_cnt, p.profile_img, ps.content, ps.img_file_name, ps.post_id ,to_char(ps.write_date, 'mm.dd HH24:mi') as writedate, ht.hashtag_name "
				+ " from profile p, post ps, hashtag ht ,post_hashtag pht "
				+ "	where ps.post_id =pht.post_id and ht.hashtag_id = pht.hashtag_id "
				+ " and p.profile_id = ps.writer "
				+ "	and ht.hashtag_name like ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,"%"+keyword+"%");
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			int postID = rs.getInt("post_id");
			String writer = rs.getString("nickname");
			String writeDate = rs.getString("writedate");
			String content = rs.getString("content");
			String profileImg = rs.getString("profile_img");
			String imgFile = rs.getString("img_file_name");
			int likeCnt = rs.getInt("like_cnt");
			String hashtag = rs.getString("hashtag_name");
	
			HashtagPostDTO spDto = new HashtagPostDTO(postID,writer, writeDate, content, profileImg, imgFile, likeCnt,hashtag);
			searchPList.add(spDto);
		}
		return searchPList;
		
	}
		
	
	//boolean 눌렸냐 = 다오.좋아요를눌렀나요(post.getPostID(), my_login_idx);
	public boolean likeIt(int postID, int loginID) throws Exception {
		Connection conn = DBConnection.getConnection();
		String sql =  "SELECT count(*) FROM like_manage_post WHERE like_post_id=? AND like_user=?";
    	PreparedStatement pstmt = conn.prepareStatement(sql);
    	pstmt.setInt(1, postID);
    	pstmt.setInt(2, loginID);
    	ResultSet rs = pstmt.executeQuery();
    	boolean result = false;
    	if(rs.next()) {
    		result = rs.getInt(1)==1;
 
    	}
    	rs.close();
    	pstmt.close();
    	return result;
	}

	
	
	//실시간 해시태그 달리는 글 보여주기
	public ArrayList<PostViewDTO> getTrendPost() throws Exception{
		ArrayList<PostViewDTO> trendList = new ArrayList<PostViewDTO>();
		Connection conn = DBConnection.getConnection();
		String sql ="select distinct  ps.post_id,p.profile_id, to_char(write_date,'mm.dd') as writedate, like_cnt, img_file_name, content , p.nickname, profile_img "
				+ " from post ps, profile p, post_hashtag ht"
				+ " where p.profile_id = ps.writer"
				+ " and ht.trend_date = ps.write_date"
				+ " and ps.post_id = ht.post_id"
				+ " and to_char(write_date,'mm.dd') = '04.29' ";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int postID = rs.getInt("post_id");
			String writer = rs.getString("nickname");
			String writeDate = rs.getString("writedate");
			String content = rs.getString("content");
			String profileImg = rs.getString("profile_img");
			String imgFile = rs.getString("img_file_name");
			int likeCnt = rs.getInt("like_cnt");
			int profileID = rs.getInt("profile_id");
			PostViewDTO trendDto = new PostViewDTO(postID,writer, writeDate, content, profileImg, imgFile, likeCnt,profileID);
			trendList.add(trendDto);
		}
		return trendList;
		
	}
	
	//그 bno의 포스팅 보기
	public ArrayList<PostViewDTO> thisPost(int PostID) throws Exception{
		ArrayList<PostViewDTO> thisList = new ArrayList<PostViewDTO>();
		Connection conn = DBConnection.getConnection();
		String sql = " select p.nickname,p.profile_img,p.profile_id, ps.content ,to_char(ps.write_date, 'mm.dd') as writedate, ps.img_file_name,ps.post_id, ps.like_cnt "
						+ " from profile p, post ps" + " where p.profile_id = ps.writer" + " and post_id = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, PostID);
		ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				int postID = rs.getInt("post_id");
				String writer = rs.getString("nickname");
				String writeDate = rs.getString("writedate");
				String content = rs.getString("content");
				String profileImg = rs.getString("profile_img");
				String imgFile = rs.getString("img_file_name");
				int likeCnt = rs.getInt("like_cnt");
				int profileID = rs.getInt("profile_id");
				PostViewDTO thisDto = new PostViewDTO(postID,writer, writeDate, content, profileImg, imgFile, likeCnt,profileID);
				thisList.add(thisDto);
			}
			return thisList;
	}
	
	
}

