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
	
	PostingDAO pDao = new PostingDAO();
	int success = pDao.delPost(postID);
	success=1;	//delete 성공
	
	
  %>
  <script>
  alert("삭제완료");
  location.href='Main.jsp'
  </script>
</body>
</html>