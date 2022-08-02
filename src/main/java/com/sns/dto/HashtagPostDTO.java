package com.sns.dto;

public class HashtagPostDTO {
	private int postID ;
	private String nickname ;
	private String writeDate ;
	private String content ;
	private String profileImg ;
	private String imgFile ;
	private int likeCnt ;
	private String hashtag ;
	
	public HashtagPostDTO() {}
	public HashtagPostDTO(int postID, String nickname, String writeDate, String content, String profileImg,
			String imgFile, int likeCnt, String hashtag) {

		this.postID = postID;
		this.nickname = nickname;
		this.writeDate = writeDate;
		this.content = content;
		this.profileImg = profileImg;
		this.imgFile = imgFile;
		this.likeCnt = likeCnt;
		this.hashtag = hashtag;
	}
	public int getPostID() {
		return postID;
	}
	public void setPostID(int postID) {
		this.postID = postID;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getImgFile() {
		return imgFile;
	}
	public void setImgFile(String imgFile) {
		this.imgFile = imgFile;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	
	

}
