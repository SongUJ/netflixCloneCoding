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
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		if(id.equals("YG") && pw.equals("1234")) {
		session.setAttribute("login_id",id);
	%>
	<script>
		alert("로그인 되었습니다.");
		location.href="Ex203.jsp";
	</script>
	<%
		}else {
	%>
	<script>
		alert("잘못된 아이디 또는 패스워드 입니다.");
		history.back();	
	</script>
	<%
		}
	%>
</body>
</html>