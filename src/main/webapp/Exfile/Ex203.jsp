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
	<%
	%>
	회원 아이디 : <%=id %>
	메뉴선택) 
		<span>
			<button onclick="location.href='Ex203_register.jsp'" type="text">회원가입</button>
		</span>
		<%
			if(session.getAttribute("login_id")==null) {
		%>
		<button onclick="location.href='Ex203_login.jsp'">로그인</button>
		<%
			}else {
		%>
		<button onclick="location.href='Ex203_logout.jsp'">로그아웃</button>
		<%
			}
		%>
</body>
</html>