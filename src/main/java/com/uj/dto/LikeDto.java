package com.uj.dto;

public class LikeDto {
	private int profileId;
	
	public LikeDto(int profileId) {
		this.profileId = profileId;
	}

	public int getProfileId() {
		return profileId;
	}

	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}
}
