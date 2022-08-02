<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import ="com.sns.dao.*" %>
<%@ page import ="com.sns.dto.*" %>
<%@ page import ="java.util.*"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		int loginID = (Integer)(session.getAttribute("profileId"));
		System.out.println("PostModifyAct.jsp : " + loginID);
 		int postID = Integer.parseInt(request.getParameter("post_id")); 
		String content = (String)request.getAttribute("content");
		String fileImg = (String)request.getAttribute("filename"); 
	
		PostingDAO postingDao = new PostingDAO();
		int success =postingDao.postModify(content,fileImg,postID);
		success =1;
	%>	
</body>

  <script>
  alert("수정완료");
  location.href='Posting.jsp?post_id=<%=postID%>'
  </script>
</html>