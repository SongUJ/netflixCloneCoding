<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="board.*" %>

<%
	request.setCharacterEncoding("utf-8");	// post방식으로 보낸 걸 받을 때, 이게 없으면 한글깨짐! (주의: request.getParameter()를 쓰기 전에 호출)
	String title = request.getParameter("title");		// (암기)
	String content = request.getParameter("content");	// (암기)
	String writer = request.getParameter("writer");		// (암기)

	BoardDao bDao = new BoardDao();
	bDao.insertBoard(title, content, writer);
%>
<script>
	alert("저장되었습니다.");
	location.href = "BoardList.jsp";
</script>
