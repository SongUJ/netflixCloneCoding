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
 	int loginID = Integer.parseInt(request.getParameter("loginID"));
 	String comments = request.getParameter("comments");
	int postID = Integer.parseInt(request.getParameter("post_id"));

	CommentDAO commentDao = new CommentDAO();
	int success = commentDao.addComment(loginID,postID,comments); 
	success =1; 	// 1:성공, 0:실패

  %>
  <script>
  alert("작성완료");
  location.href='Posting.jsp?post_id=<%=postID %>'
  </script>


</body>
</html>