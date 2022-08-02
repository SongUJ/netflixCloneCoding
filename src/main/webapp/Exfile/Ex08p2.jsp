<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int a = Integer.parseInt(request.getParameter("a"));
int b = Integer.parseInt(request.getParameter("b"));
int sum = Integer.parseInt(request.getParameter("sum"));
int sum1 = a + b;
if(sum == sum1) {
	out.println("<script>alert('정답!')</script>");
}else {
	out.println("<script>alert('틀림! 다시하셈'); history.back();</script>");
}
%>
</body>
</html>