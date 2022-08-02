<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="../Controller1">
	num1 : <input type="text" name="num1">
	[+]
	num2 : <input type="text" name="num2">
	<input type="hidden" name="command" value="plus">
	<input type="submit" value="계산시작!"><br/>
</form>
<form action="../Controller1">
	num1 : <input type="text" name="num1">
	[-]
	num2 : <input type="text" name="num2">
	<input type="hidden" name="command" value="minus">
	<input type="submit" value="계산시작!"><br/>
</form>
<form action="../Controller1">
	num1 : <input type="text" name="num1">
	[*]
	num2 : <input type="text" name="num2">
	<input type="hidden" name="command" value="mul">
	<input type="submit" value="계산시작!"><br/>
<form action="../Controller1">
	num1 : <input type="text" name="num1">
	[/]
	num2 : <input type="text" name="num2">
	<input type="hidden" name="command" value="div">
	<input type="submit" value="계산시작!"><br/>
</form>
</body>
</html>