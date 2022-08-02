package com.uj.dto;

public class MainRandomDto {
	private int movieDramaId;
	private String priviewImage;
	private String titleImage;
	private String summary;
	private String firstVideo;
	private int age;
	
	public MainRandomDto(int movieDramaId,String priviewImage, String titleImage, String summary, String firstVideo,int age) {
		this.movieDramaId = movieDramaId;
		this.priviewImage = priviewImage;
		this.titleImage = titleImage;
		this.summary = summary;
		this.firstVideo = firstVideo;
		this.age = age;
	}

	public int getMovieDramaId() {
		return movieDramaId;
	}

	public void setMovieDramaId(int movieDramaId) {
		this.movieDramaId = movieDramaId;
	}

	public String getPriviewImage() {
		return priviewImage;
	}

	public void setPriviewImage(String priviewImage) {
		this.priviewImage = priviewImage;
	}

	public String getTitleImage() {
		return titleImage;
	}

	public void setTitleImage(String titleImage) {
		this.titleImage = titleImage;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getFirstVideo() {
		return firstVideo;
	}

	public void setFirstVideo(String firstVideo) {
		this.firstVideo = firstVideo;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
}
