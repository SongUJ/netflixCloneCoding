<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="test.*" %>
<%@ page import="com.yg.dao.*" %>
<%@ page import="com.yg.dto.*" %>
<% 
	String id = request.getParameter("id");
	int pw = Integer.parseInt(request.getParameter("pw"));
	//String name = null;
	
	MemberDao mDoa = new MemberDao();
	if(mDoa.loginCheck(new MemberDto(id,pw,null))) {
		session.setAttribute("login_id", id);
%>
<script>
	alert("로그인 성공");
	location.href="Ex401_board_list.jsp";
</script>			
<%
	}else {
%>
<script>
	alert("로그인 실패");
	location.href="Ex401_login.jsp";
</script>		
<%
	}
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script src="./js/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/55f501ae31.js"crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js" integrity="sha256-eTyxS0rkjpLEo16uXTS0uVCS4815lc40K2iVpWDvdSY=" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<script>
		alert('<%=request.getParameter("id")%>'님 안녕하세요 로그인 되었습니다.);
	</script>
</body>
</html>