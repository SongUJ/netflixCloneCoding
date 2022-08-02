<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import ="com.sns.dto.*" %>
<%@ page import = "com.sns.dao.*" %>
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
		System.out.println("ProfileUpdateAct.jsp : " + loginID);
		String backImg = (String)request.getAttribute("filename1"); 
		String profileImg = (String)request.getAttribute("filename2"); 
		String nickname = (String)request.getAttribute("nickname");  
		String statement =(String)request.getAttribute("statement"); 
		
		Connection conn =  DBConnection.getConnection();
		
		String sql = "update profile set nickname= ?, profile_img = ?, back_img = ? ,statemsg =? where profile_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, nickname);
		pstmt.setString(2, profileImg);
		pstmt.setString(3, backImg);
		pstmt.setString(4, statement);
		pstmt.setInt(5, loginID);
		pstmt.executeUpdate();		
		
	%>
</body>
<script>
	location.href ='jspSY/Profile.jsp?profile_id=<%=loginID%>';
</script>

</html>