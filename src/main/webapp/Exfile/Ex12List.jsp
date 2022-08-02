<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	// 로그인 여부 체크
	if(request.getParameter("login_id")==null) {
%>
		<script>
			alert('로그인부터 하세요');
			location.href = "Ex12.jsp";
		</script>
<%
	}

	int pageNum = 0;
	if(request.getParameter("page")==null) {
		pageNum = 1;
	} else {
		pageNum = Integer.parseInt(request.getParameter("page"));
	}
	int start = pageNum*10 - 9;		// 페이지당 10개의 글씩 출력 (가정).
	int end = pageNum*10;
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbId = "user0616";
	String dbPw = "pass1234";
	
	Connection conn = null;
	try {
		Class.forName(driver);	
		conn = DriverManager.getConnection(url, dbId, dbPw);
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 전체보기</title>
	<script src="js/jquery-3.6.0.min.js"></script>
	<script>
		$(function() {
			$("tr").click(function() {
				var bno = $(this).find('.bno').text();
				//alert('내가 클릭한 bno : ' + bno);
				location.href = "Ex12Detail.jsp?login_id=<%=request.getParameter("login_id")%>&bno="+bno;
			});
		});
	</script>
	<style>
		table {
			border-collapse: collapse;
		}
		td {
			border: 1px solid grey;
			padding: 20px 30px;		
		}
	</style>
</head>
<body>
	<h1><%=pageNum %>페이지</h1>
	<table>
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일시</td>
		</tr>
		<%
			String sql = "select s2.rnum, s2.*"
					+ " from (select rownum rnum, s.* from simple_board s ORDER BY bno DESC) s2"
					+ " where s2.rnum>=? and s2.rnum<=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String writeDate = rs.getString("writedate");
		%>
				<tr>
					<td class="bno"><%=bno%></td>
					<td><%=title%></td>
					<td><%=writer%></td>
					<td><%=writeDate%></td>
				</tr>
		<%
			}
		%>
	</table>
</body>
</html>




