<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="test.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="com.yg.dto.*" %>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@192.168.19.142:1521:xe";
	String dbId = "test0616";
	String dbPw = "1234";
	
	Connection conn = null;
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url,dbId,dbPw);
	}catch(Exception e) {
		e.printStackTrace();
	}

	ArrayList<SimpleBoardDto> listBoard = new ArrayList<SimpleBoardDto>();
	String sql = "select * from simple_board order by bno desc";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()) {
		int bno = rs.getInt("bno");
		String writer = rs.getString("writer");
		String title = rs.getString("title");
		String content = rs.getString("content");
		String writedate = rs.getString("writedate");
		
		listBoard.add(new SimpleBoardDto(bno,writer,title,content,writedate));
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<script src="./js/jquery-3.6.0.min.js"></script>
<script>
	$(function (){
		$("tr").click(function (){
			var bno = $(this).find(".bno").text();
						
			$.ajax({
				type: 'get',
				url: 'BoardServlet',
				data: { "board_num":bno, /* 이름2:값2, 이름3:값3 이렇게 여러개의 값을 보낼 수 있음*/ },
				datatype: "json",
				success: function(data){
					alert("서버로부터 받음! data.result=" + data.result);
					$(".bno").each(function(index, item) { //제이쿼리 for-each문
						//console.log($(item).text());
						if($(item).text() == bno) {
							var title = $(item).parent().find(".title").text();
							$(item).parent().find(".title").text(title + "!");
						}
					});
				},
				error: function(r,s,e){
					alert("에러!");
				}
			});
		});
	});
</script>
<style>
	table {
		border-collapse: collapse;
	}
	th, td {
		padding: 8px;
		border : 1px solid gray;
	}
	td {
		cursor : pointer;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일시</th>
		</tr>
		<%
			for(SimpleBoardDto dto : listBoard) {
		%>
		<tr>
			<td class='bno'><%=dto.getBno() %></td>
			<td class="title"><%=dto.getTitle() %></td>
			<td><%=dto.getWriter() %></td>
			<td><%=dto.getWritedate() %></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>