package com.uj.dto;

public class DramaRoundDto {
	private int movieDramaId;
	private int episodeRound;
	private String episodeImage;
	private String episodeTitle;
	private String episodeSummary;
	private String fullVideo;
	private String playTime;
	
	public DramaRoundDto(int movieDramaId,int episodeRound,String episodeImage, String episodeTitle, String episodeSummary, String fullVideo, String playTime) {
		this.movieDramaId = movieDramaId;
		this.episodeRound = episodeRound;
		this.episodeImage = episodeImage;
		this.episodeTitle = episodeTitle;
		this.episodeSummary = episodeSummary;
		this.fullVideo = fullVideo;
		this.playTime = playTime;
	}

	public int getMovieDramaId() {
		return movieDramaId;
	}

	public void setMovieDramaId(int movieDramaId) {
		this.movieDramaId = movieDramaId;
	}

	public int getEpisodeRound() {
		return episodeRound;
	}

	public void setEpisodeRound(int episodeRound) {
		this.episodeRound = episodeRound;
	}

	public String getEpisodeImage() {
		return episodeImage;
	}

	public void setEpisodeImage(String episodeImage) {
		this.episodeImage = episodeImage;
	}

	public String getEpisodeTitle() {
		return episodeTitle;
	}

	public void setEpisodeTitle(String episodeTitle) {
		this.episodeTitle = episodeTitle;
	}

	public String getEpisodeSummary() {
		return episodeSummary;
	}

	public void setEpisodeSummary(String episodeSummary) {
		this.episodeSummary = episodeSummary;
	}

	public String getFullVideo() {
		return fullVideo;
	}

	public void setFullVideo(String fullVideo) {
		this.fullVideo = fullVideo;
	}

	public String getPlayTime() {
		return playTime;
	}

	public void setPlayTime(String playTime) {
		this.playTime = playTime;
	}
}
