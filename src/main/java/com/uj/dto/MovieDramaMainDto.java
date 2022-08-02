package com.uj.dto;

public class MovieDramaMainDto {
	private String title;
	private String releaseDay;
	private int age;
	private String director;
	private String actor;
	private String genre;
	private String summary;
	private String priviewImage;
	private String titleImage;
	private String firstVideo;
	private String stringAge;
	private String priview;

	public MovieDramaMainDto() { }     // optional.
	public MovieDramaMainDto(String stringAge,String priview,String title,String releaseDay, int age, String director, String actor, String genre, String summary,
			String priviewImage, String titleImage, String firstVideo) {
		this.title = title;
		this.releaseDay = releaseDay;
		this.age = age;
		this.director = director;
		this.actor = actor;
		this.genre = genre;
		this.summary = summary;
		this.priviewImage = priviewImage;
		this.titleImage = titleImage;
		this.firstVideo = firstVideo;
		this.stringAge = stringAge;
		this.priview = priview;
		
	}
	
	public String getStringAge() {
		return stringAge;
	}
	public void setStringAge(String stringAge) {
		this.stringAge = stringAge;
	}
	public String getPriview() {
		return priview;
	}
	public void setPriview(String priview) {
		this.priview = priview;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getReleaseDay() {
		return releaseDay;
	}
	public void setReleaseDay(String releaseDay) {
		this.releaseDay = releaseDay;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
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
	public String getFirstVideo() {
		return firstVideo;
	}
	public void setFirstVideo(String firstVideo) {
		this.firstVideo = firstVideo;
	}
}
