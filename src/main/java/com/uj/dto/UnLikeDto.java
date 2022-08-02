package com.uj.dto;

public class UnLikeDto {
	private int profileId;
	
	public UnLikeDto(int profileId) {
		this.profileId = profileId;
	}

	public int getProfileId() {
		return profileId;
	}

	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}
}
