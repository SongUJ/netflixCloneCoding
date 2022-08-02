<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.yg.dto.*" %>
<%@ page import="com.yg.dao.*" %>
<%

	//login여부 check
	if(session.getAttribute("login_id")==null) {
%>
<script>
		alert("로그인부터 하세요.");
		location.href = "Ex401_login.jsp";
</script>
<%
	}
	BoardDao bDao = new BoardDao();
	ArrayList<BoardDto> listBoard = bDao.getAllBoardList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
		border-collapse:collapse;
	}
	th, td {
		border: 1px solid gray;
		padding: 8px;
	}
</style>
</head>
<body>
	<h2>게시판</h2>
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자ID</th>
			<th>작성일시</th>
		</tr>
		<%
			for(BoardDto board : listBoard) {
		%>
		<tr>
			<td><%=board.getBno() %></td>
			<td><%=board.getTitle() %></td>
			<td><%=board.getWriter() %></td>
			<td><%=board.getWritedate() %></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>