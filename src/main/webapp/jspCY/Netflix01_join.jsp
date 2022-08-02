<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.cy.dao.*" %>
    <%@ page import="com.cy.dto.*" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@192.168.1.12:1521:xe";
	String dbId = "oraclePort";
	String dbPw = "1234";
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,dbId,dbPw);
	
	String email = request.getParameter("email");

	String sql = "select email_address from member";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	
	String emailAddress = null;
	while(rs.next()) {
		emailAddress = rs.getString("email_address");
		
	}
	if(email.equals(emailAddress)) {
		 %>
		<script>
			location.href = "Netflix02.jsp";
		</script> 
	<% }else {
		%>
		<script>
			location.href = "Netflix03.jsp";
		</script>
		<%
	}
	
	
%>
</head>
<body>

</body>
</html>