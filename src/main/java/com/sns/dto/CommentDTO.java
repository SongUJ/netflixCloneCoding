package com.sns.dto;

public class CommentDTO {
	private int comment_id;
	private int post_id;
	private String comments;
	private String nickname;
	private String profile_img;
	private String writedate;
	
	public CommentDTO(int comment_id, int post_id, String comments, String nickname, String profile_img,
			String writedate) {
		this.comment_id = comment_id;
		this.post_id = post_id;
		this.comments = comments;
		this.nickname = nickname;
		this.profile_img = profile_img;
		this.writedate = writedate;
	}

	public int getCommentID() {
		return comment_id;
	}

	public void setCommentID(int comment_id) {
		this.comment_id = comment_id;
	}

	public int getPostID() {
		return post_id;
	}

	public void setPostID(int post_id) {
		this.post_id = post_id;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfileImg() {
		return profile_img;
	}

	public void setProfileImg(String profile_img) {
		this.profile_img = profile_img;
	}

	public String getWriteDate() {
		return writedate;
	}

	public void setWriteDate(String writedate) {
		this.writedate = writedate;
	}
	
	

}
