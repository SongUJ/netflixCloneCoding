<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forward방식으로 이동</title>
<script>
	function move() {
		location.href = "../AAServlet";
	}
	function move2() {
		location.href = "../BBServlet";
	}
</script>
</head>
<body>
	<button onclick="move()">AAServlet으로 이동!</button>
	<button onclick="move2()">BBServlet으로 이동!</button>
</body>
</html>