package com.sns.dto;

public class MessageDTO {

	int dmID;
	int chatListID;
	int fromUser;
	int toUesr;
	String writeTime;
	String readTime;
	String content;
	String ImgFileName;
	public MessageDTO() {}
	public MessageDTO(int dmID, int chatListID, int fromUser, int toUser, String writeTime, String readTime,
			String content, String imgFileName) {
	
		this.dmID = dmID;
		this.chatListID = chatListID;
		this.fromUser = fromUser;
		this.toUesr = toUser;
		this.writeTime = writeTime;
		this.readTime = readTime;
		this.content = content;
		ImgFileName = imgFileName;
	}
	public int getDmID() {
		return dmID;
	}
	public void setDmID(int dmID) {
		this.dmID = dmID;
	}
	public int getChatListID() {
		return chatListID;
	}
	public void setChatListID(int chatListID) {
		this.chatListID = chatListID;
	}
	public int getFromUser() {
		return fromUser;
	}
	public void setFromUser(int fromUser) {
		this.fromUser = fromUser;
	}
	public int getToUesr() {
		return toUesr;
	}
	public void setToUesr(int toUser) {
		this.toUesr = toUser;
	}
	public String getWriteTime() {
		return writeTime;
	}
	public void setWriteTime(String writeTime) {
		this.writeTime = writeTime;
	}
	public String getReadTime() {
		return readTime;
	}
	public void setReadTime(String readTime) {
		this.readTime = readTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImgFileName() {
		return ImgFileName;
	}
	public void setImgFileName(String imgFileName) {
		ImgFileName = imgFileName;
	}
	
	
}
