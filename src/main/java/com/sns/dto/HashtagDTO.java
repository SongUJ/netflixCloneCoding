package com.sns.dto;

public class HashtagDTO {

	String hashtagName;
	int hashtagID;
	int hashtagCnt;
	String trendDate;
	
	public HashtagDTO() {}
	public HashtagDTO(String hashtagName, int hashtagCnt) {
		this.hashtagName = hashtagName;
		
		this.hashtagCnt = hashtagCnt;
		
	}
	public String getHashtagName() {
		return hashtagName;
	}
	public void setHashtagName(String hashtagName) {
		this.hashtagName = hashtagName;
	}
	
	public int getHashtagCnt() {
		return hashtagCnt;
	}
	public void setHashtagCnt(int hashtagCnt) {
		this.hashtagCnt = hashtagCnt;
	}
	
	
	
}
