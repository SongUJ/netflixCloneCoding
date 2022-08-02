<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.sns.dao.*"%>
<%@ page import="com.sns.dto.*"%>
<%@ page import="java.util.*"%>
<%	

	int loginID = (Integer)(session.getAttribute("profileId")); 
	/* int userID =1;//세션아이디와 같음 */
	
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home</title>
    <link rel="stylesheet" href="main.css" />
    <link rel="stylesheet" href="modal.css" />
    <script src="https://kit.fontawesome.com/6ebfb758c0.js" crossorigin="anonymous"></script>
    <script>
    	var loginID = '<%=(Integer)(session.getAttribute("profileId"))%>'; /* 전역변수로 만들어서 js.에서 변수 사용  */
    </script>
    <script src="../js/jquery-3.6.0.min.js"></script>
	<script src="../js/common-sy.js"></script>
</head>
    
   

<body style="margin: 0 auto; background-color: #141414; color: #ffffff">
	<%@ include file="ModuleMenu.jspf" %>
    <main style="float:left">
		<div class="main-box">
		
			<div id="home-box1" style="display:block">
				<div class="home-bar"> <span style="font-weight: 800;">홈</span></div>

					<!-- 포스팅하기 -->
				<div id="post-box-main" style="overflow: hidden; height: auto;">
					<div class="profile-imgbox">
						<div class="box" style="background: #141414;">
							<%
								for(ProfileDTO profile : profileList) {
							%>
	  							
							<img class="profile" src="../images/<%=profile.getProfileImg() %>">
						</div>
					</div>
							<% } %>
				<div class="post-container">
					<div class="post-container2 ">
						<div class="postingbox">
							<form action="../FileUploadServlet" method="post" enctype="multipart/form-data">
								<textarea class="autosize" onkeydown="resize(this)"
									onkeyup="resize(this)" name="content"
									placeholder="무슨 일이 일어나고 있나요?">
								</textarea>
								<script>
									function resize(obj) {
										obj.style.height = "1px";
										obj.style.height = (30+obj.scrollHeight)+"px";
									}
								</script>
								
								<!--  파일 업로드 -->
								<input type="file" name="file"/>
									<div class="posting-bottom ">
										<div class="ps-button postButton">
											<input type="submit" value="posting"
													style="background-color: transparent; color: white; border: none; font-size: 20px; line-height: 19px;">
										</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

				<!--타임라인의 포스팅들 -->
			<%
				ArrayList<PostViewDTO> postList = postViewDao.timeLine(loginID);
					for(PostViewDTO post : postList) {
			%>
	
			<div class="article-box" style="overflow: hidden; height: auto;" bno=<%=post.getPostID()%>>
				<input type="hidden" name="post_id">
					<div class="profile-imgbox" onclick="location.href ='Profile.jsp?profile_id=<%=post.getProfileID()%>'">
						<div class="box" style="background: #141414;">
							<img class="profile" src="../images/<%=post.getProfileImg()%>">
						</div>
					</div>

					<div class="namebar">
						<span class="spannickname"><%=post.getNickname() %> &nbsp;</span>
						<span class="spanid"> <%=post.getWriteDate() %></span>
					</div>
					<div class="content-container">
						<div class="postingbox"
							onclick="location.href ='Posting.jsp?post_id=<%=post.getPostID()%>'"><%=post.getContent() %></div>
							
				<!-- 파일 업로드 내용이 있으면/없으면 -->
				<% 
               		if(post.getImgFile() !=null) {
                %>

						<div class="img-post">
							<img src="../images/<%=post.getImgFile()%>">
						</div>
						<% } %>

						<div class="bottom-bar">
							<div>
								<div class="div_bottombar">
									<i class="fa-solid fa-message"></i><span class="tab"></span>
				 	<% 
					 	if(postViewDao.likeIt(post.getPostID(),loginID )) {		
					 		
                    %>
                   		<i class="fa-solid fa-heart"></i>
                    <% 	} else { %>
                    
        		            	<i class="fa-regular fa-heart"></i>
                    <% } %> 
									<span class="heart_count" style="font-size:13px"><%=post.getLikeCnt()%></span>
									<span class="tab"></span> 
									<i class="fa-solid fa-arrow-up-from-bracket"></i>
								</div>
							</div>
						</div>

					</div>
				</div>
				<% } %>
			</div>
		</div>  
		
         <!-- -----------------우측 트렌드 랭킹 바---------------------------- -->
		<%@ include file="TrendRankModule.jspf" %>

    </main>
  </body>
</html>

