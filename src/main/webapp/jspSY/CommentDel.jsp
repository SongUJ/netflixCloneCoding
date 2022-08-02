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
<%	
	int postID = Integer.parseInt(request.getParameter("post_id"));
	int commentID = Integer.parseInt(request.getParameter("comment_id"));
%>
</head>
<body>
<%

	CommentDAO cDao = new CommentDAO();
	int success = cDao.delComment(commentID);	//delete 성공
	success=1;

%>
<script>
	alert("삭제완료");
	location.href='Posting.jsp?post_id=<%=postID %>'
</script>
</body>
</html>