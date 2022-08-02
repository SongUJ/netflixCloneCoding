package com.uj.dto;

public class ProfilesDto {
	private int profileId;
	private String nickname;
	private String photo;
	
	ProfilesDto(int profileId,String nickname,String photo) {
		this.profileId = profileId;
		this.nickname = nickname;
		this.photo = photo;
	}

	public int getProfileId() {
		return profileId;
	}

	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
}
