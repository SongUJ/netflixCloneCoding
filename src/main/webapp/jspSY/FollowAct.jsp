<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import ="com.sns.dto.*" %>
<%@ page import ="com.sns.dao.*" %>
<%@ page import ="java.util.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int loginID = (Integer)(session.getAttribute("profileId"));
		int userID =Integer.parseInt(request.getParameter("profile_id"));

		
		//int otherUser = Integer.parseInt(request.getInt(("otherUser"));
		FollowDAO followDao = new FollowDAO();
		int success = followDao.follow(loginID,userID);
		success =1;
	%>
	
<script>
	alert("성공!");
	history.back();
</script>
</body>
</html>