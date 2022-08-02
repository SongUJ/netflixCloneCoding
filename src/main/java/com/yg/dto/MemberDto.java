package com.yg.dto;

public class MemberDto {
	private String id;
	private int pw;
	private String name;
	
	
	
	public MemberDto() {}
	public MemberDto(String id, int pw, String name) {
		this.id=id;
		this.pw=pw;
		this.name=name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPw() {
		return pw;
	}
	public void setPw(int pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
