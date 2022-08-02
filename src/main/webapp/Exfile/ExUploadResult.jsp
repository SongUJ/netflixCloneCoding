<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<img src="upload/<%=request.getAttribute("imgSrc") %>"/>
	<img src="upload/${imgSrc}"/> <!-- EL(Expression Language) -->
</body>
</html>


