<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.cy.dao.*" %>
    <%@ page import="com.cy.dto.*" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@192.168.1.12:1521:xe";
	String dbId = "oraclePort";
	String dbPw = "1234";
	
	String email = (String)session.getAttribute("email");
	String membership = request.getParameter("membership");
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,dbId,dbPw);
	
	String sql = "update member set membership = ? where email_address=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,membership);
	pstmt.setString(2,email);
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$(".btnGrey:not(:last-child)").click(function() {
			alert("준비중입니다.");
			location.href="Netflix08.jsp";
		})
		$(".btnGrey:last-child").click(function() {
			alert("준비중입니다.");
		})
	});
</script>
<link rel="stylesheet" href="css/Netflix07.css"/>
</head>
<body>
	<div class="basicLayout">
		<div class="basicHeader">
		<!-- 넷플릭스 로고 -->
			<a href="/" class="svg-nfLogo-signupBasicHeader" data-uia="">
				<svg viewBox="0 0 111 30" class="svg-icon-netflix-logo" aria-hidden="true" focusable="false">
					<g id="procedure-netflix-logo">
						<path d="M105.06233,14.2806261 L110.999156,30 C109.249227,29.7497422 107.500234,29.4366857 105.718437,29.1554972 L102.374168,20.4686475 L98.9371075,28.4375293 C97.2499766,28.1563408 95.5928391,28.061674 93.9057081,27.8432843 L99.9372012,14.0931671 L94.4680851,-5.68434189e-14 L99.5313525,-5.68434189e-14 L102.593495,7.87421502 L105.874965,-5.68434189e-14 L110.999156,-5.68434189e-14 L105.06233,14.2806261 Z M90.4686475,-5.68434189e-14 L85.8749649,-5.68434189e-14 L85.8749649,27.2499766 C87.3746368,27.3437061 88.9371075,27.4055675 90.4686475,27.5930265 L90.4686475,-5.68434189e-14 Z M81.9055207,26.93692 C77.7186241,26.6557316 73.5307901,26.4064111 69.250164,26.3117443 L69.250164,-5.68434189e-14 L73.9366389,-5.68434189e-14 L73.9366389,21.8745899 C76.6248008,21.9373887 79.3120255,22.1557784 81.9055207,22.2804387 L81.9055207,26.93692 Z M64.2496954,10.6561065 L64.2496954,15.3435186 L57.8442216,15.3435186 L57.8442216,25.9996251 L53.2186709,25.9996251 L53.2186709,-5.68434189e-14 L66.3436123,-5.68434189e-14 L66.3436123,4.68741213 L57.8442216,4.68741213 L57.8442216,10.6561065 L64.2496954,10.6561065 Z M45.3435186,4.68741213 L45.3435186,26.2498828 C43.7810479,26.2498828 42.1876465,26.2498828 40.6561065,26.3117443 L40.6561065,4.68741213 L35.8121661,4.68741213 L35.8121661,-5.68434189e-14 L50.2183897,-5.68434189e-14 L50.2183897,4.68741213 L45.3435186,4.68741213 Z M30.749836,15.5928391 C28.687787,15.5928391 26.2498828,15.5928391 24.4999531,15.6875059 L24.4999531,22.6562939 C27.2499766,22.4678976 30,22.2495079 32.7809542,22.1557784 L32.7809542,26.6557316 L19.812541,27.6876933 L19.812541,-5.68434189e-14 L32.7809542,-5.68434189e-14 L32.7809542,4.68741213 L24.4999531,4.68741213 L24.4999531,10.9991564 C26.3126816,10.9991564 29.0936358,10.9054269 30.749836,10.9054269 L30.749836,15.5928391 Z M4.78114163,12.9684132 L4.78114163,29.3429562 C3.09401069,29.5313525 1.59340144,29.7497422 0,30 L0,-5.68434189e-14 L4.4690224,-5.68434189e-14 L10.562377,17.0315868 L10.562377,-5.68434189e-14 L15.2497891,-5.68434189e-14 L15.2497891,28.061674 C13.5935889,28.3437998 11.906458,28.4375293 10.1246602,28.6868498 L4.78114163,12.9684132 Z" id="Fill-14">
						</path>
					</g>
				</svg>
			</a>
			<!-- 로그인 버튼 -->
			<a href="/login" class="signupBasic-onboarding-header" data-uia="header-login-link">로그아웃</a>
		</div>

		<div class="procedure-simpleContainer">
			<div class="procedure-paymentContainer">
				<div><span class="stepLogo"></span></div>
				<div>
					<span class="stepIndicator"><b>3</b>/<b>3단계</b></span>
					<h1 class="stepTitle">결제 정보 등록</h1>
				</div>
				<div class="contextRowFirst">
					결제가 완료되면 바로 멤버십이 시작됩니다.
				</div>
				<div class="contextRowSecond">
					약정도 없고, 광고도 없다! 클릭 한번으로 끝.
				</div>
				<div class="divSecurity">
					<span>보안 서버</span><svg id="secure-server-icon" viewBox="0 0 12 16" class="secure-server-badge--icon"><g fill="none"><g fill="#FFB53F"><path d="M8.4 5L8.4 6.3 10 6.3 10 5C10 2.8 8.2 1 6 1 3.8 1 2 2.8 2 5L2 6.3 3.6 6.3 3.6 5C3.6 3.7 4.7 2.6 6 2.6 7.3 2.6 8.4 3.7 8.4 5ZM11 7L11 15 1 15 1 7 11 7ZM6.5 11.3C7 11.1 7.3 10.6 7.3 10.1 7.3 9.3 6.7 8.7 6 8.7 5.3 8.7 4.7 9.3 4.7 10.1 4.7 10.6 5 11.1 5.5 11.3L5.2 13.4 6.9 13.4 6.5 11.3Z"></path></g></g></svg>
				</div>
				<div style="clear:both; height:0"></div>
				<div class="btnGrey">
					<span class="fl">신용카드 또는 체크카드</span>
					<div class="fl">
						<img alt="" class="logoIcon BC" data-uia="logoIcon-BC" src="https://assets.nflxext.com/ffe/siteui/acquisition/payment/svg/bc.svg"/>
						<img alt="" class="logoIcon Hana" data-uia="logoIcon-Hana" src="https://assets.nflxext.com/ffe/siteui/acquisition/payment/svg/hana.svg"/>
						<img alt="" class="logoIcon Hyundai" data-uia="logoIcon-Hyundai" src="https://assets.nflxext.com/ffe/siteui/acquisition/payment/svg/hyundai.svg"/>
						<img alt="" class="logoIcon KB" data-uia="logoIcon-KB" src="https://assets.nflxext.com/ffe/siteui/acquisition/payment/svg/kb.svg"/>
						<img alt="" class="logoIcon Lotte" data-uia="logoIcon-Lotte" src="https://assets.nflxext.com/ffe/siteui/acquisition/payment/svg/lotte.svg"/>
					</div>
					<div class="fl"></div>
					<div style="clear:both; height:0;"></div>
				</div>
				<div class="btnGrey">
					<span class="fl">간편 결제</span>
					<div class="fl">
						<img alt="" class="logoIcon KAKAOPAY" data-uia="logoIcon-KAKAOPAY" src="https://assets.nflxext.com/ffe/siteui/acquisition/payment/icon_kakaopay.png" srcset="https://assets.nflxext.com/ffe/siteui/acquisition/payment/icon_kakaopay_2x.png 2x"/>
					</div>
					<div class="fl"></div>
					<div style="clear:both; height:0;"></div>
				</div>
			</div>
		</div>
		<div class="site1-footer-center">
			<div class="footer-divider-greyline"></div>
			<div class="footer-site-center-section">
				<p class="footer-top-1"> 
					질문이 있으신가요? 문의 전화: &nbsp;
					<a class="footer-top-1-a" href="tel:080-001-9587">080-001-9587</a>
				</p>
				<ul class="footer-link-top-2">
					<li class="footer-link-top-2-item" placeholder="">
					<a class="footer-link-top-2-font" href="" placeholder="">
					<span>자주 묻는 질문</span>
					</a>
					</li>
					<li class="footer-link-top-2-item" placeholder="">
					<a class="footer-link-top-2-font" href="" placeholder="">
					<span>고객 센터</span>
					</a>
					</li>
					<li class="footer-link-top-2-item" placeholder="">
					<a class="footer-link-top-2-font" href="" placeholder="">
					<span>이용 약관</span>
					</a>
					</li>
					<li class="footer-link-top-2-item" placeholder="">
					<a class="footer-link-top-2-font" href="" placeholder="">
					<span>개인 정보</span>
					</a>
					</li>
					<li class="footer-link-top-2-item" placeholder="">
					<a class="footer-link-top-2-font" href="" placeholder="">
					<span>쿠키 설정</span>
					</a>
					</li>
					<li class="footer-link-top-2-item" placeholder="">
					<a class="footer-link-top-2-font" href="" placeholder="">
					<span>회사 정보</span>
					</a>
					</li>
				</ul>
				<div class="lang-selection-container5">
					<div class="infooter-selectarrow">
						<label class="neflixLabel-5" ></label>
						<div class="nfSelectPlacement">
						<select class="nflang-select">
							
							<option selected="" label="한국어" lang="ko" value="/signup?locale=ko-KR">http://localhost:9090/WebProject1/Netflix7.html한국어</option>
							<option label="English" lang="en" value="/signup?locale=en-KR">English</option>
						</select>
						</div>
					</div>
				</div>
				<div class="copy-text-5">
					<div class="copy-text-block-5">넷플릭스서비시스코리아 유한회사 통신판매업신고번호: 제2018-서울종로-0426호 전화번호: 080-001-9587</div>
					<div class="copy-text-block-5">대표: 레지널드 숀 톰프슨</div>
					<div class="copy-text-block-5">이메일 주소: korea@netflix.com</div>
					<div class="copy-text-block-5">주소: 대한민국 서울특별시 종로구 우정국로 26, 센트로폴리스 A동 20층 우편번호 03161</div>
					<div class="copy-text-block-5">사업자등록번호: 165-87-00119</div>
					<div class="copy-text-block-5">클라우드 호스팅: Amazon Web Services Inc.</div>
					<div id="" class="copy-text-block" data-uia="">
						<a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1658700119" style="text-decoration:none; color: #757575;
						">공정거래위원회 웹사이트</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>