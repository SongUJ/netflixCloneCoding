<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="com.cy.dao.*" %>
<%@ page import="com.cy.dto.*" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.AddressException"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%
	/* System.setProperty("https.protocols","TLSv1.2");	 */
	String host = "smtp.naver.com";
	final String username = "uejuong@naver.com";
	final String password = "!1qweasdzxc";
	int port = 465;
	
	String recipient = "uejuong@naver.com";
	String subject = "netflix 이메일 인증";
	String body = "인증코드 : 111111";
	
	Properties props = System.getProperties();
	
	props.put("mail.smtp.host", host);
	props.put("mail.smtp.port", port);
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.ssl.enable", "true");
	props.put("mail.smtp.ssa.trust", host);
	props.put("mail.smtp.ssl.protocols", "TLSv1.2");
	
	
	
	Session sessionMail = Session.getInstance(props, new javax.mail.Authenticator() {
		String un=username;
		String pw=password;
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(un, pw);
		}
	});
	sessionMail.setDebug(true);
	
	Message mimeMessage = new MimeMessage(sessionMail);
	mimeMessage.setFrom(new InternetAddress("uejuong@naver.com"));
	mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
	mimeMessage.setSubject(subject);
	mimeMessage.setText(body);
	Transport.send(mimeMessage);

%>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@192.168.1.12:1521:xe";
	String dbId = "oraclePort";
	String dbPw = "1234";
	int memberId = (int)(session.getAttribute("member_id"));
	System.out.println("memberID : " + memberId);
	
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
%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="css/p07.account.css">
	<meta charset="UTF-8">
	<title>이메일 코드확인</title>
	<script src="../js/jquery-3.6.0.min.js"></script>
	<script src="../js/common_headerBR.js"></script>
	<script>
		$(function() {
			$(".pin-input-container > input").keyup(function() {
				var pin_number = Number($(this).attr('id').charAt(3));   // pin1 -> 1
				//alert($(this).val().length);
				//alert(pin_number);
				if($(this).val().length==1) {
					if(pin_number<=5) {
						$("#pin"+(pin_number+1)).focus();
					} 
				} else {
					if(pin_number>=2) {
						$("#pin"+(pin_number-1)).focus();
					}
				}
				
				var b = true;    // 전체가 채워졌는지를 체크할 변수.
				for(var i=1; i<=6; i++) {
					if($("#pin"+i).val().length<1) {
						b = false;
					}
				}
				
				// b가 만약에 false가 되어 있다면? ---> 저 if문의 조건을 한번이라도 만족했다는 것!! (=빈 게 하나라도 있다는 것)
				if(b) {
					$("#btn-continue").removeAttr("disabled");
				}
			})
		})
	</script>
	
</head>
							


<body>
	<%@ include file = "headerBR.jspf" %>

	<div class="responsive-account-container">
		<!--사이드 마진-->
		<div class="challenge-container" data-uia="">
			<!--테두리 마진-->
			<h5 class="security-check-header">
				<span id="" data-uia="">보안 확인</span>
			</h5>
			<h1 class="action-headline" data-uia="action-headline">
				<span id="" data-uia="">이메일에서 코드를 확인해 주세요</span>
			</h1>
			<p class="explanation-text" data-uia="explanation-text">
				<span id="" data-uia="">계정 보호를 위해 <span
					class="explanation-bold"><%=emailAddress %></span> 주소로 보내드린 코드를 입력해
					주세요.
				</span>
			</p>
			<form class="mfa-challenge-otp-form" data-uia="mfa-chalenge-otp-form"
				method="POST">
				<div class="pin-input-container">
					<input type="tel" id="pin1" maxlength="1" class="pin-number-input" value="">
					<input type="tel" id="pin2" maxlength="1" class="pin-number-input" value="">
					<input type="tel" id="pin3" maxlength="1" class="pin-number-input" value="">
					<input type="tel" id="pin4" maxlength="1" class="pin-number-input" value="">
					<input type="tel" id="pin5" maxlength="1" class="pin-number-input" value="">
					<input type="tel" id="pin6" maxlength="1" class="pin-number-input" value="">
				</div>
				<button id="btn-continue" type="button" autocomplete="off"
					tabindex="0" disabled=""
					class="nf-btn nf-btn-secondary nf-btn-solid nf-btn-oversize"
					data-uia="" placeholder="">
					<a style="color: #fff;" href="p08.account.jsp?profile_id=<%=Integer.parseInt(request.getParameter("profile_id")) %>">
						코드를 입력해 계속 진행
					</a>
				</button>
			</form>
			<div class="button-container" data-uia="">
				<button data-uia="return-code" >
					<a style="color: #0080ff" href="p07.account.jsp?profile_id=<%=Integer.parseInt(request.getParameter("profile_id")) %>">코드 다시 받기</a>
				</button>
				<button data-uia="tryAnotherWay">
					<a style="color: #0080ff" href="p06.account.jsp?profile_id=<%=Integer.parseInt(request.getParameter("profile_id")) %>">다른 방법 시도</a>
				</button>
			</div>
			<div class="customer-service-text-container" data-uia="">
				<span id="" data-uia="">도움이 필요하신가요? 
				<a style="color=gray;">고객 센터로 문의하세요.</a>
				</span>
			</div>
			<span data-uia="mfa-challenge-resend-successes+0"
				style="display: none"></span>
		</div>
		<!--테두리 마진-->
	</div>
	<!--사이드 마진-->




<%@ include file = "bottom-service-centerBR.jspf" %>


</body>

</html>