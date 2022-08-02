<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.this_input_title {
 margin-left : 15px;
 
}
.this_input_write {
 width: 700px;
 height: 35px;
 margin-left: 15px;
 font-size: 17px;
 outline: none;
}
</style>
</head>
<body>
<form action="Ex11WriteAction.jsp">
	<input type="text" class="this_input_title" name="title" placeholder="제목 입력">
	<input type="text" class="this_input_write" name="content" placeholder="감상평을 등록해주세요.">
	<input type="submit" value="등록">
</form>
</body>
</html>