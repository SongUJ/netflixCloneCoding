<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>    
<%@ page import = "java.util.*" %>
<%@ page import = "com.yg.dto.*" %>
    
<%
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>게시글 목록</title>
	<script src="js/jquery-3.6.0.min.js"></script>
	<script>
		var pageNum = 1;
		var g_d;
		function request_one_page() {
//			alert(pageNum + "페이지를 요청함.");
			
			$.ajax({
				type: 'get',
				url: 'BoardServlet2',
				data: { "page":pageNum },
				datatype: "json",
				success: function(d) {
					g_d = d;
					//alert("서버로부터 받음");	
					for(var i=0; i<=19; i++) {
						console.log(i);
						var bno = d[i].bno;
						var title = d[i].title;
						var writer = d[i].writer;
						var writedate = d[i].writedate;
						var str = "<tr>"
								+ "<td>"+ bno +"</td>"
								+ "<td>"+ title +"</td>"
								+ "<td>"+ writer +"</td>"
								+ "<td>"+ writedate +"</td>"
								+"</tr>";
						$("#table1").append(str);
					}
					pageNum += 1;
				},
				error: function(r,s,e) {
					alert("에러!");
				}
			});
		}

		$(function() {
			$(window).scroll(function() {
				if($(window).scrollTop() == $(document).height() - $(window).height()) {
					//alert("바닥 침");
					request_one_page();
				}
			})
		});
		request_one_page();
	</script>
	<style>
		table {
			border-collapse: collapse;
		}
		th, td {
			padding: 12px 8px;
			border: 1px solid grey;
		}
		td {
			cursor: pointer;
		}
	</style>
</head>
<body>
	<table id="table1">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일시</th>
		</tr>

	</table>
</body>
</html>










