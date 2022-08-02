package com.uj.dto;

public class CommentBoxDto {
	private int userGrade;
	private int commentId;
	private String profileId;
	private String userComment;
	private String commentDate;
	private int likeHitCount;
	private int unlikeHitCount;
	
	public CommentBoxDto(int userGrade,int commentId,String profileId,String userComment,String commentDate, int likeHitCount, int unlikeHitCount) {
		this.userGrade = userGrade;
		this.commentId = commentId;
		this.profileId = profileId;
		this.userComment = userComment;
		this.commentDate = commentDate;
		this.likeHitCount = likeHitCount;
		this.unlikeHitCount = unlikeHitCount;
	}
	public int getUserGrade() {
		return userGrade;
	}
	public void setUserGrade(int userGrade) {
		this.userGrade = userGrade;
	}
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public String getProfileId() {
		return profileId;
	}

	public void setProfileId(String profileId) {
		this.profileId = profileId;
	}

	public String getUserComment() {
		return userComment;
	}

	public void setUserComment(String userComment) {
		this.userComment = userComment;
	}

	public String getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}

	public int getLikeHitCount() {
		return likeHitCount;
	}

	public void setLikeHitCount(int likeHitCount) {
		this.likeHitCount = likeHitCount;
	}

	public int getUnlikeHitCount() {
		return unlikeHitCount;
	}

	public void setUnlikeHitCount(int unlikeHitCount) {
		this.unlikeHitCount = unlikeHitCount;
	}
}
