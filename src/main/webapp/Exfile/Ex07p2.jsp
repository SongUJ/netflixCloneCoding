<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두번째 페이지</title>
</head>
<body>
합 : <%
	int sum = 0;
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	for(int i=num1; i<=num2; i++) {
		sum += i;
		
	}
	out.println(sum);
%>
</body>
</html>