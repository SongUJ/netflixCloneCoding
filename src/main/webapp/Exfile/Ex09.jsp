<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String driver = "oracle.jdbc.driver.OracleDriver";
//String url = "jdbc:oracle:thin:@192.168.1.12:1521:xe";
//String dbID = "oraclePort";
//String dbPW = "1234";
String url = "jdbc:oracle:thin:@192.168.19.133:1521:xe";
String dbID = "hr";
String dbPW = "hr";
Connection conn = null;
Class.forName(driver);

try {
	 Class.forName(driver);
	 out.println("<h1>JDBC 드라이버 로딩 성공</h1>");
	 conn = DriverManager.getConnection(url, dbID, dbPW);
	 out.println("<h1>Oracle 접속 성공</h1>");
}catch(Exception e) {
	e.printStackTrace();
	out.println("오라클 접속 실패");
}
%>
</body>
</html>