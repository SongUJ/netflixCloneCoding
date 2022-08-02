<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.cy.dao.*" %>
    <%@ page import="com.cy.dto.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script
	  src="https://code.jquery.com/jquery-3.6.0.min.js"
	  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	  crossorigin="anonymous">
	</script>
	<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<link rel="stylesheet" href="./css/Netflix02.css"/>
	<script>
		<%session.invalidate(); %>
	</script>
	<style>
		li {
			 list-style:none;
		}
		ul {
			padding:0;
		}
		a {
			text-decoration: none;
			color:#757575;
		}
		input {
			color: white;
		}
	</style>
</head>
<body>
	<!-- 화면 배경 -->
	<div class="page2-login-background">
		<div class="page2-login-wrapper">
			<div class="page2-login-image-box">
				<img class="img-creative" src="https://assets.nflxext.com/ffe/siteui/vlv3/25badb14-858b-4b1c-8b7d-2244098454d9/5c529c55-27bb-4e63-86eb-28734c60d7a6/KR-ko-20220606-popsignuptwoweeks-perspective_alpha_website_small.jpg"/>
			</div>
	</div>
	<!-- 배경그라데이션 + 화면 상단 넷플릭스 로고  -->
	<div class="page2-login-header">
		<a href="Netflix01.jsp" class="svg-nfLogo signupBasicHeader">
			<svg viewBox="0 0 111 30" class="svg-icon svg-icon-netflix-logo" aria-hidden="true" focusable="false">
				<g>
					<path d="M105.06233,14.2806261 L110.999156,30 C109.249227,29.7497422 107.500234,29.4366857 105.718437,29.1554972 L102.374168,20.4686475 L98.9371075,28.4375293 C97.2499766,28.1563408 95.5928391,28.061674 93.9057081,27.8432843 L99.9372012,14.0931671 L94.4680851,-5.68434189e-14 L99.5313525,-5.68434189e-14 L102.593495,7.87421502 L105.874965,-5.68434189e-14 L110.999156,-5.68434189e-14 L105.06233,14.2806261 Z M90.4686475,-5.68434189e-14 L85.8749649,-5.68434189e-14 L85.8749649,27.2499766 C87.3746368,27.3437061 88.9371075,27.4055675 90.4686475,27.5930265 L90.4686475,-5.68434189e-14 Z M81.9055207,26.93692 C77.7186241,26.6557316 73.5307901,26.4064111 69.250164,26.3117443 L69.250164,-5.68434189e-14 L73.9366389,-5.68434189e-14 L73.9366389,21.8745899 C76.6248008,21.9373887 79.3120255,22.1557784 81.9055207,22.2804387 L81.9055207,26.93692 Z M64.2496954,10.6561065 L64.2496954,15.3435186 L57.8442216,15.3435186 L57.8442216,25.9996251 L53.2186709,25.9996251 L53.2186709,-5.68434189e-14 L66.3436123,-5.68434189e-14 L66.3436123,4.68741213 L57.8442216,4.68741213 L57.8442216,10.6561065 L64.2496954,10.6561065 Z M45.3435186,4.68741213 L45.3435186,26.2498828 C43.7810479,26.2498828 42.1876465,26.2498828 40.6561065,26.3117443 L40.6561065,4.68741213 L35.8121661,4.68741213 L35.8121661,-5.68434189e-14 L50.2183897,-5.68434189e-14 L50.2183897,4.68741213 L45.3435186,4.68741213 Z M30.749836,15.5928391 C28.687787,15.5928391 26.2498828,15.5928391 24.4999531,15.6875059 L24.4999531,22.6562939 C27.2499766,22.4678976 30,22.2495079 32.7809542,22.1557784 L32.7809542,26.6557316 L19.812541,27.6876933 L19.812541,-5.68434189e-14 L32.7809542,-5.68434189e-14 L32.7809542,4.68741213 L24.4999531,4.68741213 L24.4999531,10.9991564 C26.3126816,10.9991564 29.0936358,10.9054269 30.749836,10.9054269 L30.749836,15.5928391 Z M4.78114163,12.9684132 L4.78114163,29.3429562 C3.09401069,29.5313525 1.59340144,29.7497422 0,30 L0,-5.68434189e-14 L4.4690224,-5.68434189e-14 L10.562377,17.0315868 L10.562377,-5.68434189e-14 L15.2497891,-5.68434189e-14 L15.2497891,28.061674 C13.5935889,28.3437998 11.906458,28.4375293 10.1246602,28.6868498 L4.78114163,12.9684132 Z" id="Fill-14">
					</path>
				</g>
			</svg>
		<!--<span class="hide-netflix-word">Netflix</span>  -->
		</a>
	</div>
	<!-- 로그인 아이디 + 비밀번호 박스  -->
	<div id="page2-login-blackbox">
		<div class="login-blackbox-container">
			<div class="login-blackbox-signup">
				<div class=login-form-main-textbox">
					<h1 data-uia="login-page-title">로그인</h1>
					<form class="login-page-input-allbox" action ="Netflix02_login_action.jsp" method="post">
					<!-- 이메일박스 -->
						<div class="login-send-email-container">
							<label class="input-id" placeholder="">
								<input type="text" class="nfTextfield-error" name="email" placeholder="이메일 주소 또는 전화번호">
							</label>
						</div>
					<!-- 비밀번호박스 -->			
						<div class="login-send-pw-container">
							<label class="input-pw" placeholder="">
								<input type="password" class="nfTextfield-error" name="pw" placeholder="비밀번호">
							</label>
						</div>
						<!-- 로그인버튼 -->
						<button class="login-nfbtn">로그인</button>
						<a href="#" id="kakao-login-btn"><img src="./img/kakao_login_medium_wide.png" style="width:162px;height:40px; display:inline-block;"/></a>
						<script>
							Kakao.init('d7d9e8097f1533227afa37965a4f880b');
							$("#kakao-login-btn").on("click", function(){
								Kakao.Auth.login({
									success: function(authObj) {
										Kakao.API.request({
											url: '/v2/user/me',
							            	success: function(response) {
							            		var account = response.kakao_account;
							            		var email = account.email;
							              		location.href="kakao_login_action.jsp?email=" + email; 
							        		}
							         	})
										console.log(authObj);
							          	var token = authObj.access_token;
							        },
							        fail: function(err) {
							        	alert(JSON.stringify(err));
							        }
								});      
							})
						</script>
						<div id="naver_id_login" style="display:inline-block;"></div>
						<script>
							var naver_id_login = new naver_id_login("qb4MOy_QZ25jKIGEN0J0", "http://localhost:9090/Web1/callback.jsp"); //프로젝트 폴더 바뀌면 폴더명 바꿔주기!!
						  	var state = naver_id_login.getUniqState();
						  	naver_id_login.setButton("green", 3, 40);
						  	naver_id_login.setState(state);
						  	naver_id_login.init_naver_id_login();
						</script>
						
					</form>
					<!-- 체크박스&도움말 -->
					<div style="display: flex;">
						<div class="login-remember-me">
							<input type="checkbox" class="remember-me-information fl_l" name="rememberMe" value="true" checked="">
							<lable for="rememberMe_true">
								<div class="rememberMe_true:before">
									<span class="fl_l">로그인 정보 저장</span>
								</div>
							</lable>
							<a class="link login-help-link fl_r" target="_self" data-uia="login-help-link">도움이 필요하신가요?</a>
						</div>
					</div>
					<!-- 넷플릭스 회원 여부 도움말 -->
					<div class="login-signup-now">Netflix 회원이 아닌가요? 
						<a class=" " href=" ">지금 가입하세요</a>.
					</div>
					<!-- 보안 도움말 -->
					<div class="recaptcha-terms-use">
						<p>
							<span>이 페이지는 Google reCAPTCHA의 보호를 받아 사용자가 로봇이 아님을 확인합니다.</span>&nbsp;
							<button class="recaptcha-link-button">자세히 알아보기</button>
						</p>
						<div class="recaptcha-terms-use-disclosure">
							<span id="">Google reCAPTCHA가 수집하는 정보에는 Google 
								<a href="" id="recaptcha-privacy-link" target="_blank">개인정보처리방침</a>과
								<a href="" id="recaptcha-tos-link" target="_blank">서비스 약관</a>
								이 적용되며, 해당 정보는 reCAPTCHA 서비스 제공, 관리 및 개선과 일반적인 보안 유지에 사용됩니다(Google의 개인 맞춤 광고에 사용 안 함).
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
	<!-- 밑에 하단 고객센터 -->
		<div class="site-footer-centered" style="margin-top: 600px; text-align: center;">
			<div class="site-footer-centered-content" style="position: static;">
				<p class="footer-top-question">질문이 있으신가요? 문의 전화: &nbsp;
					<a class="footer-top-telephone" href="tel:080-001-9587">080-001-9587</a>
				</p>
				<ul class="footer-links-askquestion">
					<li class="footer-link-askquestion-item" placeholder="footer_responsive_link_faq_item">
						<a class="footer-link" href="" placeholder="footer_responsive_link_faq">
							<span id="" >자주 묻는 질문</span>
						</a>
					</li>
					<li class="footer-link-customer-center" placeholder="footer_responsive_link_help_item">
						<a class="footer-link-customercenter-item" href="" placeholder="footer_responsive_link_help">
							<span id="" data-uia="data-uia-footer-label">고객 센터</span>
						</a>
					</li>
					<li class="footer-link-use-terms" placeholder="footer_responsive_link_terms_item">
						<a class="footer-link-useterms-item" href="https://help.netflix.com/legal/termsofuse" placeholder="footer_responsive_link_terms">
							<span id="" data-uia="data-uia-footer-label">이용 약관</span>
						</a>
					</li>
					<li class="footer-link-personal-information" placeholder="footer_responsive_link_privacy_separate_link_item">
						<a class="footer-link-pInformation-item" href="https://help.netflix.com/legal/privacy" placeholder="footer_responsive_link_privacy_separate_link">
							<span id="" data-uia="data-uia-footer-label">개인정보</span>
						</a>
					</li>
					<li class="footer-link-cookie-setting" placeholder="footer_responsive_link_cookies_separate_link_item">
						<a class="footer-link-cSetting-item" href="#" placeholder="footer_responsive_link_cookies_separate_link">
							<span id="" data-uia="data-uia-footer-label">쿠키 설정</span>
						</a>
					</li>
					<li class="footer-link-company-information" placeholder="footer_responsive_link_corporate_information_item">
						<a class="footer-link-cInformation-item" href="https://help.netflix.com/legal/corpinfo" placeholder="footer_responsive_link_corporate_information">
							<span id="" data-uia="data-uia-footer-label">회사 정보</span>
						</a>
					</li>
				</ul>
				<div class="lang-selection-container" id="lang-switcher">
					<div data-uia="language-picker+container" class="ui-select-wrapper">
						<label for="lang-switcher-select" class="ui-label">
							<span class="ui-label-text">언어 선택</span>
						</label>
						<div class="select-arrow medium prefix globe">
							<select data-uia="language-picker" class="ui-select medium" id="lang-switcher-select" tabindex="0" placeholder="lang-switcher">
								<option selected="" lang="ko" value="/?locale=ko-KR" data-language="ko" data-country="KR">한국어</option>
								<option lang="en" value="/?locale=en-KR" data-language="en" data-country="KR">English</option>
							</select>
						</div>
					</div>
				</div>
				<div class="copy-text">
					<div class="copy-text-block">넷플릭스서비시스코리아 유한회사 통신판매업신고번호: 제2018-서울종로-0426호 전화번호: 080-001-9587</div>
					<div class="copy-text-block">대표: 레지널드 숀 톰프슨</div>
					<div class="copy-text-block">이메일 주소: korea@netflix.com</div>
					<div class="copy-text-block">주소: 대한민국 서울특별시 종로구 우정국로 26, 센트로폴리스 A동 20층 우편번호 03161</div>
					<div class="copy-text-block">사업자등록번호: 165-87-00119</div>
					<div class="copy-text-block">클라우드 호스팅: Amazon Web Services Inc.</div>
					<div id="" class="copy-text-block">
						<a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1658700119">공정거래위원회 웹사이트</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>