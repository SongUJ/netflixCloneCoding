<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.cy.dao.*" %>
<%@ page import="com.cy.dto.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.yg.dao.*" %>
<%
	String email = request.getParameter("email");
	String pw = request.getParameter("pw");
	LoginDAO LDAO = new LoginDAO();
	int var = LDAO.Login(email, pw); 
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@192.168.1.12:1521:xe";
	String dbId = "oraclePort";
	String dbPw = "1234";

	Connection conn = null;
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url,dbId,dbPw);
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	String sql = "select member_id from member where email_address = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,email);
	ResultSet rs = pstmt.executeQuery();
	if(rs.next() && var ==1) {
		int member_id = rs.getInt("member_id");
		session.setAttribute("member_id",member_id); 
%> 
	<script>
		alert("로그인 성공");
		location.href="../jspBR/p01.account.jsp<%-- ?memberId=<%=member_id %> --%>";
	</script>
<% 
	}else {
%>
	<script>
		alert("로그인 실패");
		history.back();
	</script>
<% 
	}	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>