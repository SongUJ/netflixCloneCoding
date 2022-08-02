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

String sql="insert into simple_member values(?,?,?)";
PreparedStatement pstmt = conn.prepareStatement(sql);

String id = request.getParameter("ID");
String password = request.getParameter("PASSWORD");
String name = request.getParameter("NAME");

pstmt.setString(1, id);
pstmt.setString(2, password);
pstmt.setString(3, name);
pstmt.executeUpdate();

pstmt.close();
conn.close();
%>
<h1>가입되었습니다.</h1>
</body>
</html>