package com.uj.dto;

public class GradeDto {
	private double grade;
	private int participation;
	
	public GradeDto(double grade,int Participation) {
		this.grade = grade;
		this.participation = Participation;
	}

	public double getGrade() {
		return grade;
	}

	public void setGrade(double grade) {
		this.grade = grade;
	}

	public int getParticipation() {
		return participation;
	}

	public void setParticipation(int participation) {
		this.participation = participation;
	}
}
