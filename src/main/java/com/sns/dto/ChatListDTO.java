package com.sns.dto;

public class ChatListDTO {
	int chatListID;
	String CreateDate;
	int nickname;
	int profileImg;
	
	public ChatListDTO() {}
	public ChatListDTO(int chatListID, String createDate) {
		
		this.chatListID = chatListID;
		CreateDate = createDate;
	}
	public int getChatListID() {
		return chatListID;
	}
	public void setChatListID(int chatListID) {
		this.chatListID = chatListID;
	}
	public String getCreateDate() {
		return CreateDate;
	}
	public void setCreateDate(String createDate) {
		CreateDate = createDate;
	}
	

}
