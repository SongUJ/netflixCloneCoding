package com.uj.dto;

public class VideoIdDto {
	private int movieDramaId;
	private String posterImage;

	public VideoIdDto(int movieDramaId,String posterImage) {
		this.movieDramaId = movieDramaId;
		this.posterImage = posterImage; 
	}
	
	public String getPosterImage() {
		return posterImage;
	}
	
	public void setPosterImage(String posterImage) {
		this.posterImage = posterImage;
	}
	public int getMovieDramaId() {
		return movieDramaId;
	}
	public void setMovieDramaId(int movieDramaId) {
		this.movieDramaId = movieDramaId;
	}
}
