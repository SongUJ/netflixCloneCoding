<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.sns.dao.*"%>
<%@ page import="com.sns.dto.*"%>
<%@ page import="java.util.*"%>
<%
	int loginID = (Integer)(session.getAttribute("profileId"));
	System.out.println("TrendKeyWord.jsp : " + loginID); 
	int userID =1;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/6ebfb758c0.js" crossorigin="anonymous"></script>
    <script>
    	var loginID = '<%=(Integer)(session.getAttribute("profileId"))%>'; /* 전역변수로 만들어서 js.에서 변수 사용  */
	</script>
    <script src="../js/jquery-3.6.0.min.js"></script>
	<script src="../js/common-sy.js"></script>
    <title>TrendSearch</title>
    <link rel="stylesheet" href="main.css" />
	<link rel="stylesheet" href="modal.css" />

    <script>
	$(function() {
		$(".trend-box").click(function() {
		var str = $(this).find(".trendspan").text();   
		$(".search-bar > div > input[type='text']").val(str);
		});
	});
    </script>
</head>

	<body style="margin: 0 auto; background-color:#141414; color:#ffffff ">
		<%@ include file="ModuleMenu.jspf" %>
    <main style="float:left">
  
      <div class="main-box">
		<div id="home-box6">
			<div class="home-bar" style="position: relative; margin-top:6px;">
				<div class="search-bar "style="margin-top:4px; height:18px;" >
					<div><i class="fa-solid fa-magnifying-glass" style="float:left; line-height:18px"></i>
					<form action="TrendKeyword.jsp">
						<input type="text" name="keyword"
							style="float:left; width:400px; background-color: #282828; border:none; color:white; margin-left:12px;    margin-top: -4px; outline: none; font-size:20px;float:left;"	>
					</form>
					</div>
				</div>
			</div>
              
		<div style="width:660px; height:auto;">              

		<%
			String keyword = request.getParameter("keyword");
			PostViewDAO searchPost = new PostViewDAO();
			ArrayList<HashtagPostDTO> pList =  searchPost.searchPost(keyword);
				for(HashtagPostDTO post : pList){
	
		%>
		
            <div class="article-box" style="overflow:hidden; height:auto;" bno=<%=post.getPostID()%>>
        
        <input type="hidden" name="post_id">
          <div class="profile-imgbox" ><div class="box" style="background: #141414;">
            <img class="profile" src="./images/<%=post.getProfileImg()%>"></div></div>

          <div class="namebar"><span class="spannickname"><%=post.getNickname()%> &nbsp;</span> <span class="spanid" > <%=post.getWriteDate()%></span></div>
            <div class="content-container" ><div class="postingbox" onclick="location.href ='Posting.jsp?post_id=<%=post.getPostID()%>'"><%=post.getContent()%></div>
   
   		 	<% 
           		if(post.getImgFile()!=null) {
            %>
            
           	<div class="img-post">
				<img src="./images/<%=post.getImgFile()%>">
			</div> 
				<%
					}
				%> 
				
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
            
            <%
                
		}
            %>
	</div>
	<!--  우측바 -->
  <%@ include file="TrendRankModule.jspf" %>
          
        

          
    </main>
  </body>
</html>
<!--트렌드 바-->
<!-- <div class="search-bar" style="float: right">
           

            
          </div> -->
