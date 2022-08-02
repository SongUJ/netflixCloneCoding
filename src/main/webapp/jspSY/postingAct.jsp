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
<title>Insert title here</title>
</head>
<body>

 <%
 
 	int loginID = (Integer)(session.getAttribute("profileId"));
	String content = (String)request.getAttribute("content");
	String fileImg = (String)request.getAttribute("filename"); 

	
	PostingDAO postingDao = new PostingDAO();
	int success = postingDao.doPosting(loginID,content,fileImg);
	success =1;
	

	
  %>
  <script>
  alert("작성완료");
  location.href='jspSY/Main.jsp'
  </script>
</body>
</html>