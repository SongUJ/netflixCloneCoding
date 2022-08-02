<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@192.168.19.133:1521:xe";
String dbID = "test0616";
String dbPW = "1234";
 
Class.forName(driver);
Connection conn = DriverManager.getConnection(url, dbID, dbPW);

String sql = "insert into simple_board(bno_up.nextval,YG,?,?,sysdate)";
PreparedStatement pstmt = conn.prepareStatement(sql);

String title = request.getParameter("title");
String content = request.getParameter("content");

pstmt.setString(1, title);
pstmt.setString(2, content);
pstmt.executeUpdate();
%>
<script>
alert("댓글 작성 완료");
location.href = "Ex11Write.jsp?";
</script>
</body>
</html>