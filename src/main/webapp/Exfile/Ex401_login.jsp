<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="test.*" %>
<%
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@192.168.19.142:1521:xe";
String dbId = "test0616";
String dbPw = "1234";

Connection conn = null;
try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url,dbId,dbPw);
}catch(Exception e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script src="./js/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/55f501ae31.js"crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js" integrity="sha256-eTyxS0rkjpLEo16uXTS0uVCS4815lc40K2iVpWDvdSY=" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
<form action="Ex401_login_action.jsp" method="post">
	ID : <input type="text" name="id"> <br/>
	PW : <input type="text" name="pw"> <br/>
	<input type="submit" value="로그인"/>
</form>
</body>
</html>