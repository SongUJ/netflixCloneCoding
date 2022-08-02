<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="mvc.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="../Controller">
		num1 :  <input type="text" name="num1"> <br/>
		[+] <br/>
		num2 :  <input type="text" name="num2"> <br/>
		<input type="hidden" name="command" value="calculate">
		<input type="submit" value="계산시작!">
	</form>
</body>
</html>