<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.cy.dao.*" %>
    <%@ page import="com.cy.dto.*" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/p08.account.css">
<meta charset="UTF-8">
<title>새 이메일</title>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@192.168.1.12:1521:xe";
	String dbId = "oraclePort";
	String dbPw = "1234";
	int memberId = (int)(session.getAttribute("member_id"));
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,dbId,dbPw);
	
	String sql = "select email_address from member where member_id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1,memberId);
	ResultSet rs = pstmt.executeQuery();
	
	String emailAddress = null;
	if(rs.next()) {
		emailAddress = rs.getString("email_address");
	}
	pstmt.close();
	rs.close();
	
	/* String sql1 = "update 테이블명 set 바꿀컬럼명 = 어떻게바꿀지 where 테이블명 "; */
%>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/common_headerBR.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js" integrity="sha256-eTyxS0rkjpLEo16uXTS0uVCS4815lc40K2iVpWDvdSY=" crossorigin="anonymous"></script>
<script>
$(function (){
	$("#btn-save").click(function (){ 
		/* int email = session.setAttribute("member_id"); */
		alert("준비중입니다.");
	}); 
	/* $(document).on("click","#btn-save",function(){
		alert("저장되었습니다.");
	}); */
});
</script>
</head>


<body>
	<%@ include file = "headerBR.jspf" %>



	<div class="bd">
		<div class="responsive-account-container">
			<form action="" class="change-email-form" data-uia="change-email-form"
				method="post" novalidate="">
				<h1>이메일 변경</h1>
				<div></div>
				<ul class="simpleForm structural ui-grid">
					<li data-uia="field-currentEmail+wrapper" class="nfFormSpace">
						<div data-uia="field-currentEmail+container" class="nfInput">
							<div class="nfInputPlacement">
								<label class="input_id" placeholder="currentEmail"><input
									type="text" data-uia="field-currentEmail" name="currentEmail"
									class="nfTextField hasText" id="id_currentEmail"
									value="<%=emailAddress %>" tabindex="0" autocomplete="off"
									disabled="" dir="ltr">
									<label for="id_currentEmail" class="placeLabel">현재 이메일</label></label>
							</div>
						</div>
					</li>
					<li data-uia="field-newEmail+wrapper" class="nfFormSpace">
						<div data-uia="field-newEmail+container" class="nfInput">
							<div class="nfInputPlacement">
								<label class="input_id" placeholder="newEmail"> <input
									type="text" data-uia="field-newEmail" name="newEmail"
									class="nfTextField" id="id_newEmail" value="" tabindex="0"
									autocomplete="off" maxlength="50" minlength="5" dir="">
									<label for="id_newEmail" class="placeLabel">새 이메일</label>
								</label>
							</div>
						</div>
					</li>
				</ul>
				<div class="nf-btn-bar change-email-buttons">
					<button id="btn-save" type="submit" autocomplete="off" tabindex="0"
						disabled=""
						class="nf-btn nf-btn-primary nf-btn-retro nf-btn-small"
						data-uia="" placeholder="">
							저장
					</button>
					<button id="btn-cancel" type="button" autocomplete="off"
						tabindex="0"
						class="nf-btn nf-btn-secondary nf-btn-solid nf-btn-small"
						data-uia="action_cancel-change-email" placeholder="">
						<a style="color: #000" 	href="p05.account.jsp?profile_id=<%=Integer.parseInt(request.getParameter("profile_id")) %>">취소</a>
					</button>
				</div>
			</form>
		</div>
	</div>






<%@ include file = "bottom-service-centerBR.jspf" %>

</body>

</html>