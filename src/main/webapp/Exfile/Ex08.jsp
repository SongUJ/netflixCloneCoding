<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Random" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Random rd = new Random();
int a = rd.nextInt(10)+1;
int b = rd.nextInt(10)+1;
%>
<form action="Ex08p2.jsp">
	숫자1 = <input type="text" name = "a" value= "<%=a%>"> <br/>
	숫자2 = <input type="text" name = "b" value= "<%=b%>"> <br/>
	답 = <input type="text" name = "sum"> <br/>
	<input type="submit" value="정답확인"/>
	<input type="hidden" name="h" value="something">
</form>
</body>
</html>