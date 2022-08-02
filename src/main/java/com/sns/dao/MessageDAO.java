package com.sns.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sns.dto.ChatListDTO;
import com.sns.dto.MessageDTO;
import com.sns.dto.ProfileDTO;

public class MessageDAO {
	
	
	//마지막 메세지 보기
	public ArrayList<MessageDTO> showLastMsg(int chatListID) throws Exception {
		
		ArrayList<MessageDTO> mList = new ArrayList<MessageDTO>();
		Connection conn = DBConnection.getConnection();
		String sql ="select *from DM  where dm_id in(select Max(dm_id) from dm group by chat_list_id) and chat_list_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, chatListID);
		ResultSet rs = pstmt.executeQuery();

		if(rs.next()) {
			int dmID = rs.getInt("dm_id");
			int chatListId =rs.getInt("chat_list_id");
			int fromUser= rs.getInt("from_user");
			int toUser = rs.getInt("to_user");
			String writeTime = rs.getString("write_time");
			String readTime = rs.getString("read_time");
			String content = rs.getString("content");
			String ImgFileName = rs.getString("img_file_name");
			
			MessageDTO mDto= new MessageDTO(dmID, chatListId,fromUser,toUser,writeTime,readTime,content, ImgFileName);
			mList.add(mDto);
		}
		return mList;
	}
	//채팅방 리스트의 유저 정보 뽑기-- sql문 다시 봐주세요!! 
	public ArrayList<ProfileDTO> toUser(int chatRoomID) throws Exception{
		ArrayList<ProfileDTO> pList = new ArrayList<ProfileDTO>();
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT nickname, profile_img, back_img, statemsg, profile_id FROM profile"
					+" WHERE profile_id = (SELECT FIRST_VALUE(to_user) OVER(ORDER BY write_time) FROM DM WHERE chat_list_id = ? AND ROWNUM = 1)";	//채팅방 to_user칼럼을 통해 채팅 상대방 정보 조회
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, chatRoomID);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()){
			
			String nickname= rs.getString("nickname");
			String profileImg = rs.getString("profile_img");
			String backImg = rs.getString("back_img");
			String stateMsg = rs.getString("statemsg");
			int profileID = rs.getInt("profile_id");
			
			ProfileDTO pDto = new ProfileDTO(nickname,profileImg,backImg,stateMsg,profileID);
			pList.add(pDto);
			
		}
		return pList;
	}
	
	

	// 대화방 내용
	public ArrayList<MessageDTO> viewMsg(int chatListID) throws Exception{
		
		ArrayList<MessageDTO> mList = new ArrayList<MessageDTO>();
		Connection conn = DBConnection.getConnection();
		String sql ="SELECT d.*"
				+ " FROM profile p, dm d "
				+ " WHERE d.from_user = p.profile_id  AND chat_list_id = ?"
				+ " UNION "
				+ " SELECT d.*"
				+ " FROM profile p, dm d"
				+ " WHERE p.profile_id = d.from_user AND chat_list_id =?";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, chatListID);
		pstmt.setInt(2, chatListID);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {

			int dmID = rs.getInt("dm_id");
			int chatListId =rs.getInt("chat_list_id");
			int fromUser= rs.getInt("from_user");
			int toUser = rs.getInt("to_user");
			String writeTime = rs.getString("write_time");
			String readTime = rs.getString("read_time");
			String content = rs.getString("content");
			String ImgFileName = rs.getString("img_file_name");
			
			MessageDTO mDto= new MessageDTO(dmID, chatListId,fromUser,toUser,writeTime,readTime,content, ImgFileName);
			mList.add(mDto);
		}
		return mList;
	}
	
	//새로운 대화방 생성
	public int createChatList(int loginID, int userID) throws Exception {
		
		int result =0;
		Connection conn = DBConnection.getConnection();
		String sql = "INSERT INTO chat_list VALUES (seq_chat_list.nextval,to_char(sysdate,'mm.dd HH24:MI'), ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, loginID + "," + userID);
		result = pstmt.executeUpdate();
		return result;
		
	}
	
	//채팅방 리스트 뽑기
	public ArrayList<ChatListDTO> chatList (int loginID ) throws Exception {
		
		ArrayList<ChatListDTO> cList = new ArrayList<>();
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT chat_list_id , create_date FROM chat_list WHERE participants LIKE ? OR participants LIKE ? ORDER BY create_date desc";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "%"+loginID+",%");
		pstmt.setString(2, "%,"+loginID+"%");
		
		
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			int chatListID = rs.getInt("chat_list_id");
			String createDate = rs.getString("create_date");
			
			ChatListDTO cDto = new ChatListDTO(chatListID, createDate);
			cList.add(cDto);
			
		}
		return cList;
	}
	

	
	// 대화 insert
	public int insertMsg(int chatList, int loginID, int userID, String content, String img) throws Exception {
		
		int result =0;
		Connection conn = DBConnection.getConnection();
		String sql = "INSERT INTO DM (DM_id, chat_list_id, from_user, to_user, write_time, read_time, content, img_file_name) VALUES "
				+ "(seq_dm.nextval,?,?,?,sysdate, null, ? , ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, chatList);
		pstmt.setInt(2, loginID);
		pstmt.setInt(3, userID);
		pstmt.setString(4, content);
		pstmt.setString(5, img);

		result = pstmt.executeUpdate();
		return result;
		
	}
	
}
