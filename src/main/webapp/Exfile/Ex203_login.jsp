<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("email");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
회원 아이디 : <%=id %>
	<form action="Ex203_login_action.jsp">
		로그인 폼)
		<input type="text" name="id" placeholder="아이디">
		<input type="text" name="pw" placeholder="패스워드">
		<button type="submit">로그인</button>
	</form>
</body>
</html>