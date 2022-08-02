<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="board.*" %>
    
<%
	BoardDao bDao = new BoardDao();
%>

<%
	int pageNum = 1;
	try {
		pageNum = Integer.parseInt(request.getParameter("page"));
	} catch(NumberFormatException e) { }
	int endBno = 15 * pageNum;			
	int startBno = 15 * pageNum - 14;	
	
%>

<%
	ArrayList<BoardDto> listBoard = bDao.getBoardListStartEnd(startBno, endBno);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 전체보기</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>
		var pageNum = <%=pageNum%>;	  // 이해.
		$(function() {
			$("#btn_write").click(function() {
				location.href = "BoardWrite.jsp";	
			});
			$("#btn_prevpage").click(function() {
				if(pageNum > 1)
					location.href = "BoardList.jsp?page=" + (pageNum-1);
				else
					alert("첫 페이지입니다");
			});
			$("#btn_nextpage").click(function() {
				location.href = "BoardList.jsp?page=" + (pageNum+1);
				// TODO : 마지막 페이지 여부의 판단은 다음에.
			});
		});
	</script>
	<style>		
		table {
			border-collapse: collapse;
		}
		th, td {
			padding:5px;
			border: 1px solid grey;
		}
		fl { float:left; }
		fr { float:right; }
	</style>
</head>
<body>
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자아이디</th>
			<th>작성일시</th>
		</tr>
		<%
			for(BoardDto dto : listBoard) {
		%>		
				<tr>
					<td><%=dto.getBno() %></td>
					<td><%=dto.getTitle() %></td>
					<td><%=dto.getWriter() %></td>
					<td><%=dto.getWritedate() %></td>
				</tr>
		<%
			}
		%>		
	</table>
	<div>
		<button id="btn_prevpage">이전 페이지</button>
		<button id="btn_nextpage">다음 페이지</button>
	</div>	
	<div>
		<button id="btn_write" class="fr">글쓰기</button>
	</div>
</body>
</html>