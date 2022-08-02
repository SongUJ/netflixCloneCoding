<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*" %>
<%@ page import="com.sns.dao.*"%>
<%@ page import="com.sns.dto.*"%>
<%@ page import="java.util.*"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%

	int postID = Integer.parseInt(request.getParameter("post_id"));
	PostLikeDAO like = new PostLikeDAO();
	int success = like.likeAct(postID);
			
	success =1;
%>
	

</body>

</html>