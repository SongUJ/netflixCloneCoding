<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
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
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		int pw = Integer.parseInt(request.getParameter("pw"));
		
		String sql = "SELECT count(*) FROM simple_member WHERE id=? AND pw=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setInt(2, pw);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			int n = rs.getInt(1);
			if(n==1) {  // 로그인 성공
	%>
				<script>
					alert('로그인 성공!');
					location.href="Ex12List.jsp?login_id=<%=id%>";
				</script>
	<%				
			} else {
	%>
				<script>
					alert('로그인 실패!');
					history.back();
				</script>
	<%		
			}
		}
	%>
</body>
</html>





