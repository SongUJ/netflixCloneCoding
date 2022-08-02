<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.sns.dao.*"%>
<%@ page import="com.sns.dto.*"%>
<%@ page import="java.util.*"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/6ebfb758c0.js"crossorigin="anonymous"></script>
    <script src="../js/jquery-3.6.0.min.js"></script>
    <title>Message</title>
    <link rel="stylesheet" href="main.css" />
    <link rel="stylesheet" href="modal.css" />
    <script src="../js/common-sy.js"></script>

    
<%	
	int loginID = Integer.parseInt(request.getParameter("profileID"));
	int userID =2;	// 쟤
	int fromUser=1 ;
	int toUser=2 ; 


	/* int userID = (Integer)session.getAttribute("userID"); */
	
%>
<script>

	$(function(){
		  
		var webSocket = new WebSocket("ws://localhost:9090/PracticeCRUD/broadcasting");
		webSocket.onmessage = function(e) {
			onMessage(e);
		}
		webSocket.onopen = function(e) {
			onOpen(e);
		}
		webSocket.onerror = function(e) {
			onError(e);
		}
		
		function onOpen(e) {
			$(".chat").prepend("<div class='msgBox1'>채팅에 참여하였습니다</div>");
		}
		function onClose(e) {
			alert(e.data);
		}
		function onMessage(e) {
			$(".chatBox").append("<div class='cBox'><div class='recieveMsg'>"+e.data+"</div></div>");
		}
		
		
		//채팅방 ajax
		$(".chList").click(function (){
			var roomId = $(this).attr("chatRoomId");
			alert(roomId);
			
			$.ajax({
				type:'get',
				url: 'ChatRoomServlet',
				data: {"roomId" : roomId},
				datatype: "json",
				success: function(data) {
					
				},
				error:function(r,s,e) {
					alert("챗룸 에러!");	
				}
			}); 
			
		});
	
    //포스팅버튼 눌러 포스팅모달창 띄우기
    $("#modal-btn ").click(function() {
      $("#post-box").css('display','block'); 
      $("#background_btm").css('display','block'); 
    });

    //쪽지생성 버튼 눌러 쪽지 모달창 띄우기
    $(".button1").click(function() {
      $("#dm-modal").css('display','block'); 
      $("#background_btm").css('display','block'); 
    });

    $(".button2").click(function() {
      $("#dm-modal").css('display','block'); 
      $("#background_btm").css('display','block'); 
    });

    //x버튼 눌러 쪽지 모달창 닫기
    $("#x-button").click(function() {
      $("#dm-modal").css('display','none'); 
      $("#background_btm").css('display','none'); 
    });

    //확인 버튼을 눌러 쪽지 모달창 닫기
    $("#check-button").click(function() {
      $("#dm-modal").css('display','none'); 
      $("#background_btm").css('display','none'); 
    });

	$("#btn_send").click(function() {
		/* var my_id = $("#id_chat").val(); */
		var msg = $("#input_message").val();
		$(".chatBox").append("<div class='cBox'><div class='sendMsg'>" + msg + "</div></div>");
		webSocket.send(<%=loginID%> + "|" + msg);
	});

});



</script>


      
<body style="margin: 0 auto; background-color: #141414; color: #ffffff">
	<%@ include file="ModuleMenu.jspf" %>
	<main>

 
    <!-- dm modal -->
    <div id="dm-modal" style="display:none">
      <div class="dm-top-bar">
        <div id="x-button"><i class="fa-regular fa-x fa-lg" style="line-height: 53px; font-weight: 600;"></i></div>
        <div style="width:400px; height:53px; line-height:53px; float:left;" ><span style="font-weight:600; font-size:18px;">새 쪽지</span></div>
        <div id="check-button" >확인</div>
      </div>
      <div class="dm-search">
        <div id="search"><i class="fa-solid fa-magnifying-glass fa-lg" style="line-height: 53px; font-weight: 600; margin-left:16px;"></i></div>
        
          <input type="text" style="float:left;width:500px; height:51px; line-height:51px; border:none; color:white; outline: none; font-size:16px" placeholder="사용자검색">
       
      </div>
    </div>

   <div class="chat-listBox">
        <div class="DM-bar"><div class="DM-barBox"><span style="font-weight: 800;">쪽지</span></div></div>
         <div class="chatList">
	         <div class="box1" style="display:none">
	             <div class="message-box" !important style="font-size:27px; font-weight: 800;">받은 쪽지함에 오신것을 환영합니다!</div>
	             <div class="message-box"  !important style="font-size:15px; font-weight: 400; color:#BDBDBD">사용자들과 안부를 묻고 컨텐츠를 공유하고 더 많은 비공개 대화를 나누세요. </div>
	             <div class="message-box"><div class="button1 postButton">메세지 작성하기</div></div>
	         </div> 
         
         <% 
         	//채팅방 아이디 뽑기
         	MessageDAO mDao = new MessageDAO();
         	ArrayList<ChatListDTO> cList = mDao.chatList(loginID);
         	
         	
         
         	for(ChatListDTO chatRoom : cList){
         %>	
			<div class ="chList" chatRoomId="<%=chatRoom.getChatListID() %>">
			<% int chatRoomID = chatRoom.getChatListID();
				ArrayList<ProfileDTO> pList = mDao.toUser(chatRoomID);
					for(ProfileDTO profile : pList){
				 %>
	         	<div class="pImg"><img src="./images/<%=profile.getProfileImg()%>"></div>
	         	<div class ="pName"><%=profile.getNickname() %></div>
	         	<% 
					ArrayList<MessageDTO> mList = mDao.showLastMsg(chatRoomID);	         	
	         			for(MessageDTO msg : mList){ 
	         	%>
         		<div class="lastMsg"><%=msg.getContent()%></div>
			</div>
           <%
           				}	
					}
				}
			%> 	
		</div>
	</div>
	
	
     <div class="chat">
         <div class="chat-box" style="display:none;">
	          <div class="message-box" !important="" style="font-size:27px; font-weight: 800;">쪽지 선택하기</div>
	          <div class="message-box" !important="" style="font-size:15px; font-weight: 400; color:#BDBDBD">기존 대화에서 선택하거나 새로운 대화를 만들거나 계속 탐색합니다.</div>
	          <div class="message-box"><div class="button2 postButton">새쪽지</div></div>
         </div>
  
  
         <!-- 기존 채팅내용 -->	
        <div class="chatBox">	 
          	<%
          		int chatListID = 1;
         		ArrayList<MessageDTO> msgList = mDao.viewMsg(chatListID);
         			for(MessageDTO msg : msgList) {
         			
         	%> 
         
        	<%	if(msg.getFromUser() == loginID) { %>
		         	<div class="cBox">
		         		<div class="sendMsg"><%=msg.getContent()%></div>
		        	</div>
        	<% 
        		} else if(msg.getFromUser() == userID) {
			%>
		        	<div class="cBox">
	         			<div class ="recieveMsg"><%=msg.getContent()%></div>
	         		</div>
         	<%		
         		} 
         	}         	
         	%>
         	
        </div>
         <!-- 채팅 스타트 -->		
         <div class="doChat">
         	<div id="div_message" style="overflow:auto">
         		
         	<style>
         		input[type="text"] {
         			float: left;
				    width: 200px;
				    background-color: #282828;
				    width: 500px;
				    height: 40px;
				    margin-left: 10px;
				    border-radius: 30px;
				    margin-top: 10px;
				    color: white;
				    border:none;
				   input:focus {outline:none;}
				 } 
				 input:focus {
				 	outline:none;
				 }
				 input[type="button"]{
				    margin-top: 20px;
    				margin-left: 15px;
				 
				 }
         	</style>
        
				<input type="text" id="input_message">
				
				<input type="button" id="btn_send" value="전송"/>
			</div>
		</div>
	 

    </main>
</body>
</html>
