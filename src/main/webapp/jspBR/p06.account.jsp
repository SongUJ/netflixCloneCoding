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
<link rel="stylesheet" href="css/p06.account.css">
<meta charset="UTF-8">
<title>이메일 변경</title>
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

	
%>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/common_headerBR.js"></script>
</head>

<body>
	<%@ include file = "headerBR.jspf" %><!-- 해더 html -->

	<div class="center">
		<!---->
		<svg viewBox="0 0 64 76" class="icon-shield">
                <g fill="none" fill-rule="nonzero">
                    <path fill="#B3B3B3"
				d="M63.807 19.543c-.077-2.016-.077-3.955-.077-5.816a2.612 2.612 0 00-2.631-2.637C49.722 11.012 41.055 7.755 33.857.776c-1.006-1.009-2.708-1.009-3.714 0-7.198 6.98-15.865 10.236-27.164 10.236A2.612 2.612 0 00.347 13.65c0 1.861 0 3.8-.077 5.894-.387 19.155-.929 45.29 30.879 56.302.31.077.541.155.851.155.31 0 .62-.078.851-.155C64.66 64.833 64.117 38.698 63.807 19.543zM32 70.493C4.759 60.568 5.146 38.854 5.533 19.699c0-1.163.077-2.249.077-3.335C16.212 15.82 24.725 12.641 32 6.282c7.275 6.359 15.788 9.616 26.39 10.004 0 1.085 0 2.171.077 3.334.387 19.233.774 40.947-26.467 50.874z">
                    </path>
                    <path fill="#E50914"
				d="M41.132 28.771l-12.77 12.796-5.494-5.506c-1.006-1.008-2.709-1.008-3.792 0-1.006 1.008-1.006 2.715 0 3.8l7.352 7.368c.542.542 1.16.775 1.857.775.697 0 1.393-.233 1.858-.775l14.704-14.735c1.006-1.008 1.006-2.714 0-3.8a2.59 2.59 0 00-3.715.077z">
                    </path>
                </g>
            </svg>
		<h1 class="action-headline" data-uia="action-headline">
			<span id="" data-uia="">먼저 본인 확인을 해볼까요?</span>
		</h1>
		<p class="explanation-text" data-uia="explanation-text">
			<span id="" data-uia="">정보를 변경하기 전에 본인 확인 절차가 필요합니다.</span>
		</p>


		<form class="select-factor-form"
			data-uia="mfa-challenge-select-factor" method="POST">
			<button type="button" class="select-factor-button"
				data-uia="factor-button-createSmsOtpChallengeAction">
				<div class="button-icon-wrapper">
					<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
						xmlns="http://www.w3.org/2000/svg" class="button-icon icon-chat">
                    <path fill-rule="evenodd" clip-rule="evenodd"
							d="M18 3C21.3137 3 24 5.68629 24 9V11C24 14.3137 21.3137 17 18 17V20C18 20.3688 17.797 20.7077 17.4719 20.8817C17.1467 21.0557 16.7522 21.0366 16.4453 20.8321L11.7049 17.6718C11.0479 17.2338 10.2758 17 9.48612 17H6C2.68629 17 0 14.3137 0 11V9C0 5.68629 2.68629 3 6 3H18ZM22 9C22 6.79086 20.2091 5 18 5H6C3.79086 5 2 6.79086 2 9V11C2 13.2091 3.79086 15 6 15H9.48612C10.6707 15 11.8287 15.3506 12.8143 16.0077L16 18.1315V16V15H17H18C20.2091 15 22 13.2091 22 11V9ZM6 12C7.10457 12 8 11.1046 8 10C8 8.89543 7.10457 8 6 8C4.89543 8 4 8.89543 4 10C4 11.1046 4.89543 12 6 12ZM12 12C13.1046 12 14 11.1046 14 10C14 8.89543 13.1046 8 12 8C10.8954 8 10 8.89543 10 10C10 11.1046 10.8954 12 12 12ZM20 10C20 11.1046 19.1046 12 18 12C16.8954 12 16 11.1046 16 10C16 8.89543 16.8954 8 18 8C19.1046 8 20 8.89543 20 10Z"
							fill="currentColor">
                    </path>
                  </svg>
				</div>
				<div class="factor-button-text-wrapper">
					<span class="factor-button-primary-text"> <span id=""
						data-uia="">문자로 코드 받기</span></span> <span
						class="factor-button-secondary-text">010-1234-5678</span>
				</div>
				<div class="button-icon-wrapper">
					<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
						xmlns="http://www.w3.org/2000/svg"
						class="button-icon icon-chevron-next">
                    <path fill-rule="evenodd" clip-rule="evenodd"
							d="M7.29297 19.2928L14.5859 12L7.29297 4.70706L8.70718 3.29285L16.7072 11.2928C16.8947 11.4804 17.0001 11.7347 17.0001 12C17.0001 12.2652 16.8947 12.5195 16.7072 12.7071L8.70718 20.7071L7.29297 19.2928Z"
							fill="currentColor"></path>
                  </svg>
				</div>
			</button>
			<button type="button" class="select-factor-button"
				data-uia="factor-button-createEmailOtpChallengeAction">
				<div class="button-icon-wrapper">
					<svg width="54px" height="36px" viewBox="0 0 54 36"
						class="button-icon icon-email">
                    <g id="Round-4---WEB" stroke="none" stroke-width="1"
							fill="none" fill-rule="evenodd">
                      <g id="EDR-page-nopreviousrequests-Copy-3"
							transform="translate(-485.000000, -161.000000)" stroke="#E50914"
							stroke-width="3">
                        <g id="email"
							transform="translate(487.000000, 163.000000)">
                          <rect x="0.416666667" y="0.416666667"
							width="50.0555556" height="31.1666667" rx="3"></rect>
                          <g transform="translate(1.000000, 0.000000)"
							stroke-linejoin="round">
                            <polyline
							points="49.2318811 0.416666667 24.4444444 20.7777754 0.657007774 0.416666667"></polyline>
                          </g>
                        </g>
                      </g>
                    </g>
                  </svg>
				</div>
				<div class="factor-button-text-wrapper">
					<span class="factor-button-primary-text">
					<a	href="p07.account.jsp?profile_id=<%=Integer.parseInt(request.getParameter("profile_id")) %>">이메일로	코드 받기</span> 
					<span class="factor-button-secondary-text"><%=emailAddress %></span>
				</div>
				<div class="button-icon-wrapper">
					<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
						xmlns="http://www.w3.org/2000/svg"
						class="button-icon icon-chevron-next">
                    <path fill-rule="evenodd" clip-rule="evenodd"
							d="M7.29297 19.2928L14.5859 12L7.29297 4.70706L8.70718 3.29285L16.7072 11.2928C16.8947 11.4804 17.0001 11.7347 17.0001 12C17.0001 12.2652 16.8947 12.5195 16.7072 12.7071L8.70718 20.7071L7.29297 19.2928Z"
							fill="currentColor"></path>
                  </svg>
					</a>
				</div>
			</button>
			<button type="button" class="select-factor-button"
				data-uia="factor-button-createInlineMopChallengeAction">
				<div class="button-icon-wrapper">
					<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
						xmlns="http://www.w3.org/2000/svg"
						class="button-icon icon-credit-card">
                    <path fill-rule="evenodd" clip-rule="evenodd"
							d="M0 6C0 4.34315 1.34315 3 3 3H21C22.6569 3 24 4.34315 24 6V18C24 19.6569 22.6569 21 21 21H3C1.34314 21 0 19.6569 0 18V6ZM3 5C2.44772 5 2 5.44772 2 6V8H22V6C22 5.44771 21.5523 5 21 5H3ZM2 18V10H22V18C22 18.5523 21.5523 19 21 19H3C2.44772 19 2 18.5523 2 18ZM16 16H20V14H16V16Z"
							fill="currentColor"></path>
                  </svg>
				</div>
				<div class="factor-button-text-wrapper">
					<span class="factor-button-primary-text"><span id=""
						data-uia="">결제 정보 확인</span></span><span
						class="factor-button-secondary-text"><span id=""
						data-uia="">LOCAL(마지막 네 자리: 6803)</span></span>
				</div>
				<div class="button-icon-wrapper">
					<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
						xmlns="http://www.w3.org/2000/svg"
						class="button-icon icon-chevron-next">
                    <path fill-rule="evenodd" clip-rule="evenodd"
							d="M7.29297 19.2928L14.5859 12L7.29297 4.70706L8.70718 3.29285L16.7072 11.2928C16.8947 11.4804 17.0001 11.7347 17.0001 12C17.0001 12.2652 16.8947 12.5195 16.7072 12.7071L8.70718 20.7071L7.29297 19.2928Z"
							fill="currentColor"></path>
                  </svg>
				</div>
			</button>
		</form>

		<div class="service-text">
			<span id="" data-uia="">도움이 필요하신가요? <a href="#"
				target="_blank">고객 센터로 문의하세요. </a>
			</span>
		</div>
	</div>
	<!---->

<%@ include file = "bottom-service-centerBR.jspf" %>


</body>

</html>