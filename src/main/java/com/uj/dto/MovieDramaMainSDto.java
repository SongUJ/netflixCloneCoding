package com.uj.dto;

public class MovieDramaMainSDto {
	private int movieDramaId;
	private String title;
	private String releaseDay;
	private int age;
	private String stringAge;
	private String director;
	private String actor;
	private String genre;
	private String summary;
	private String posterImage;
	private String titleImage;
	private String priview;
	private String priviewImage;
	private int hitCount;
	private String firstVideo;
	private String firstPlayTime;
	
	public MovieDramaMainSDto(){}
	public MovieDramaMainSDto(int movieDramaId, String title, String releaseDay, int age, String stringAge,
			String director, String actor, String genre, String summary, String posterImage, String titleImage,
			String priview, String priviewImage, int hitCount, String firstVideo, String firstPlayTime) {
		super();
		this.movieDramaId = movieDramaId;
		this.title = title;
		this.releaseDay = releaseDay;
		this.age = age;
		this.stringAge = stringAge;
		this.director = director;
		this.actor = actor;
		this.genre = genre;
		this.summary = summary;
		this.posterImage = posterImage;
		this.titleImage = titleImage;
		this.priview = priview;
		this.priviewImage = priviewImage;
		this.hitCount = hitCount;
		this.firstVideo = firstVideo;
		this.firstPlayTime = firstPlayTime;
	}
	public int getMovieDramaId() {
		return movieDramaId;
	}
	public void setMovieDramaId(int movieDramaId) {
		this.movieDramaId = movieDramaId;
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
	public String getStringAge() {
		return stringAge;
	}
	public void setStringAge(String stringAge) {
		this.stringAge = stringAge;
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
	public String getPosterImage() {
		return posterImage;
	}
	public void setPosterImage(String posterImage) {
		this.posterImage = posterImage;
	}
	public String getTitleImage() {
		return titleImage;
	}
	public void setTitleImage(String titleImage) {
		this.titleImage = titleImage;
	}
	public String getPriview() {
		return priview;
	}
	public void setPriview(String priview) {
		this.priview = priview;
	}
	public String getPriviewImage() {
		return priviewImage;
	}
	public void setPriviewImage(String priviewImage) {
		this.priviewImage = priviewImage;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public String getFirstVideo() {
		return firstVideo;
	}
	public void setFirstVideo(String firstVideo) {
		this.firstVideo = firstVideo;
	}
	public String getFirstPlayTime() {
		return firstPlayTime;
	}
	public void setFirstPlayTime(String firstPlayTime) {
		this.firstPlayTime = firstPlayTime;
	}
	
	
}
