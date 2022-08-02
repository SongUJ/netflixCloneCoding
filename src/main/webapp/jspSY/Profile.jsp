<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import ="com.sns.dto.*" %>
<%@ page import = "com.sns.dao.*" %>
<%@ page import ="java.util.*" %>
<%

 int loginID = (Integer)(session.getAttribute("profileId")); 
 System.out.print("loginID : " + loginID);
 int userID = Integer.parseInt(request.getParameter("profile_id"));  
 System.out.print("userID : " + userID);

%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/6ebfb758c0.js" crossorigin="anonymous"></script>
    <script src="../js/jquery-3.6.0.min.js"></script>
    <script>
    	var loginID = '<%=(Integer)(session.getAttribute("profileId"))%>'; /* 전역변수로 만들어서 js.에서 변수 사용  */
    </script>
	<script src="../js/common-sy.js"></script>
    <title>Profile</title>
    <link rel="stylesheet" href="main.css" />
    <link rel="stylesheet" href="modal.css" />

    <script>
		function modalClose(){
			$("#p-box1").css('display','none')
			$("#background_btm").css('display','none');
			$("#post-box.modal-stl ").fadeOut();
		}
      
		$(function(){
    	  
		//넘어가기 누르면 이전화면 none다음화면 block
/* 		$("#pb-button1").click(function() {
			$("#p-box1").css('display','none');
            $("#p-box2").css('display','block');
            $("#background_btm").css('display','block');
		});
		
		$("#pb-button2").click(function() {
			$("#p-box2").css('display','none');
            $("#p-box3").css('display','block');
            $("#background_btm").css('display','block');
		});
		
		$("#pb-button3").click(function() {
            $("#p-box3").css('display','none');
            $("#p-box4").css('display','block');
            $("#background_btm").css('display','block');
		});
		 */
		 
		//프로필 설정 모달창 띄우기
		$(".profile-settingButton").click(function() {
			$("#p-box1").css('display','block');
            $("#background_btm").css('display','block');
		});

/* 		$("#update-btn").click(function(){
			alert("프로필 설정 완료!")
            modalClose();
		});
 */
		//내 포스트/ 좋아요 목록
		$(".movieRank ").click(function() {
			alert("!!");
			$("#myarticle").css('display','block');
			$("#likearticle").css('display','none');
		});
         
		$(".seriesRank ").click(function() {
			alert("!!");
			$("#likearticle").css('display','block');
			$("#myarticle").css('display','none');
		});
	});  
		
</script> 
</header>

	<body style="margin: 0 auto; background-color:#141414; color:#ffffff ">
	<%@ include file="ModuleMenu.jspf" %>
    
    <main style="float:left">
    
	<%
		PostViewDAO dao = new PostViewDAO();
		FollowDAO fDao = new FollowDAO();
		ArrayList<ProfileDTO> dtoList = dao.viewProfile(userID);
 		for(ProfileDTO profile : dtoList) {
	%>
	
		<div class="main-box">
			<div id="home-box4">
				<div class="home-bar"><span style="font-weight: 800;"><%=profile.getNickname()%></span></div>
            <div class="proflie-box" style="height:410px;">
				<div class="profile-img"><img id="profile-img" src="../images/<%=profile.getProfileImg() %>"></div>
                <div class="background-img"><img id="background-img" src="../images/<%=profile.getBackImg()%>"></div>
                <div class="profile-content">
                
            	<!--세션아이디와 userID가 같다면 -->	
                <% if(loginID == userID) { %>	
                  <div class="profile-setting "><div class="profile-settingButton bottomButton"><div style="margin-top:-8px">프로필설정</div></div></div> 

				<% }else{ %>   
                    <div class="follow bottomButton"><div style="margin-top:-3px" onClick="location.href='FollowAct.jsp?profile_id=<%=userID%>'">FOLLOW</div></div>
				<% } %>
                    <div class="contentbox1" style="margin-top:15px;" ><%=profile.getNickname()%></div>
           			<div style="height:auto; font-color:#afafaf; font-size:15px; font-weight:600; margin-bottom:4px;"><%=profile.getStateMsg() %></div>
    	
        	 <!-- 팔로워수  -->
			   <div class="contentbox2"><span style="font-weight: 600;"><%=fDao.getFollowerCnt(loginID) %></span>&nbsp;follower &nbsp;&nbsp;
                        
              <!-- 팔로잉 수 -->
                    <span style="font-weight: 600;"><%=fDao.getFollowingCnt(loginID) %></span>&nbsp;following</div>  
                </div>
            </div>
			
		
			<!-- 내포스팅/ 좋아요 한 글 -->
            <div class="pm-box">
				<div class="movieRank  pm-button">내 포스팅</div>
				<div class="seriesRank   pm-button">마음에 들어요</div>
            </div>


        <!-- 내 포스팅 -->   
        <div style="display:block"; id="myarticle"> 
		<%
			ArrayList<PostViewDTO> myPostList = postViewDao.myPost(userID);
				for(PostViewDTO myPost : myPostList){
		%>
		
		<div class="article-box" id="my_posting" style="overflow:hidden; height:auto;" bno=<%=myPost.getPostID()%>>
  			<input type="hidden" name="post_id">
				<div class="profile-imgbox"><div class="box" style="background: #141414;">
                <img class="profile" src="../images/<%=myPost.getProfileImg()%>"></div></div>
				<div class="namebar"><span class="spannickname"><%=myPost.getNickname()%> &nbsp;</span> <span class="spanid" > <%=myPost.getWriteDate()%></span></div>
                <div class="content-container" ><div class="postingbox" onclick="location.href ='Posting.jsp?post_id=<%=myPost.getPostID()%>'"><%=myPost.getContent() %></div>
       		 	<% 
               		if(myPost.getImgFile() !=null) {
                %>
                
               	<div class="img-post">
					<img src="../images/<%=myPost.getImgFile()%>">
				</div> 
				<% } %> 
				
				<div class="bottom-bar">
					<div>
						<div class="div_bottombar">
							<i class="fa-solid fa-message"></i><span class="tab"></span>
				<% 
			 	if(postViewDao.likeIt(myPost.getPostID(),userID )) {		
			 		
				%>
                 		<i class="fa-solid fa-heart"></i>
				<% 	} else { %>
                  
      		            	<i class="fa-regular fa-heart"></i>
				<% } %> 
							<span class="heart_count" style="font-size:13px"><%=myPost.getLikeCnt()%></span>
							<span class="tab"></span> 
							<i class="fa-solid fa-arrow-up-from-bracket"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
		
           <% } %>
      </div>      
            
            
	
		<!--좋아요 누른 게시물  -->
		
		<div style="display:none"; id="likearticle"> 
		<%
			ArrayList<PostViewDTO> likePostList = postViewDao.likePost(userID);
				for(PostViewDTO likePost : likePostList){
		%>
		
		<div class="article-box" id="like" style="overflow:hidden; height:auto;  " bno=<%=likePost.getPostID()%> >
 			<input type="hidden" name="post_id">
 				<div class="profile-imgbox"><div class="box" style="background: #141414;">
                <img class="profile" src="../images/<%=likePost.getProfileImg()%>"></div></div>

				<div class="namebar"><span class="spannickname"><%=likePost.getNickname() %> &nbsp;</span> <span class="spanid" > <%=likePost.getWriteDate() %></span></div>
                <div class="content-container" ><div class="postingbox" onclick="location.href ='Posting.jsp?post_id=<%=likePost.getPostID() %>'"><%=likePost.getContent()%></div>
       
       		 	<% 
               		if(likePost.getImgFile()!=null) {
                %>
                
               	<div class="img-post">
					<img src="../images/<%=likePost.getImgFile()%>">
				</div> 
				<% } %> 
				
   						<div class="bottom-bar">
							<div>
								<div class="div_bottombar">
									<i class="fa-solid fa-message"></i><span class="tab"></span>
				 	<% 
					 	if(postViewDao.likeIt(likePost.getPostID(),userID )) {		
					 		
                    %>
                   		<i class="fa-solid fa-heart"></i>
                    <% 	} else { %>
                    
        		            	<i class="fa-regular fa-heart"></i>
                    <% } %> 
									<span class="heart_count" style="font-size:13px"><%=likePost.getLikeCnt()%></span>
									<span class="tab"></span> 
									<i class="fa-solid fa-arrow-up-from-bracket"></i>
								</div>
							</div>
						</div>
			</div>
		</div>
				<% } %> 
      </div>    


      <!-- 프로필 설정 모달창-->
      <!--프로필 설정 jsp만들기, 파일 업로드 서불릿으로 보내기 -->
      
    	<%
 			for(ProfileDTO profile1 : profileList) {
		%>
		<div id="p-box1" style="display:none">
        	<form action="../ProfileUploadServlet" method="post" enctype="multipart/form-data">
				<p class="p">프로필 설정</p><input type ="submit" class="profile-set" value="저장">
				<div class="profile-img1"><img id="profile-img" src="../images/<%=profile.getProfileImg() %>">
					<div style="z-index: 99; width: 42px; height: 42px;position: absolute;color: black;font-size: 30px; top: 40px; left:45px">
                		<input type="file" name="file_profile"  class="fa-solid fa-camera">
                	</div>
				</div>	
                <div class="background-img1"><img id="background-img" src="../images/<%=profile.getBackImg()%>">
                	<div style="z-index: 99;  width: 42px;height: 42px;position: absolute;right: 275px; color: black;font-size: 30px; top: 80px;">
                		<input type="file" name="file_bg"  class="fa-solid fa-camera">
                	</div>
                </div>
                <% } %>
                <p style="margin-top:270px; margin-bottom:20px;padding:10px 40px 0 40px;font-weight:600">이름</p>
				<div style="width:520px; height:60px; margin:10px 40px 10px 40px;  border:1px solid #afafaf;">
					<input type="text" name="nickname" value="<%=profile.getNickname() %>" style="height:40px; width:500px; color:white; padding:10px">	
				</div>
				<p style="padding:10px 40px 0 40px; font-weight:600">상태메세지</p>
				<div style="width:520px; height:60px;margin:10px 40px 10px 40px;  border:1px solid #afafaf;">
					<textarea class="autosize" onkeydown="resize(this)"
										placeholder="<%=profile.getStateMsg() %>"	onkeyup="resize(this)" name="statement"
											 style="background-color:#282828"></textarea>
					
				</div>
			</form>       
		</div>       
      
      
 		<% } %>
           
<!-- -----------------우측 트렌드 랭킹 바---------------------------- -->
<%@ include file="TrendRankModule.jspf" %>

    </main>
  </body>
</html>

