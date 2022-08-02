package com.uj.dto;

public class ProfileGetDto {
	private int profileId;
	
	public ProfileGetDto(int profileId) {
		this.profileId = profileId;
	}

	public int getProfileId() {
		return profileId;
	}

	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}
	
	
}
