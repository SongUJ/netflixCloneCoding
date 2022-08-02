<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.cy.dao.*" %>
    <%@ page import="com.cy.dto.*" %>
<% 
	//session.setAttribute("email",request.getParameter("email"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery-3.6.0.min.js"></script>
<script>
	function go_post(url, password, agree1, agree2) {
		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "post"); // Get 또는 Post 입력
		form.setAttribute("action", url);

		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "password");
		hiddenField.setAttribute("value", password);
		form.appendChild(hiddenField);

		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "agree1");
		hiddenField.setAttribute("value", agree1);
		form.appendChild(hiddenField);
		 
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "agree2");
		hiddenField.setAttribute("value", agree2);
		form.appendChild(hiddenField);
		 
		document.body.appendChild(form);
		form.submit();
	}

	$(function() {
		$(".simpleForm-structural input[type=password]").focus(function() {
			$(this).parent().find("label").addClass("small");

		}).blur(function() {		
			var typed = $(this).val();
			
			if(typed.length == 0) {
				$(this).addClass('error');
				$(this).removeClass('okay');
				$(this).parent().find("label").removeClass("small");
				$(this).parent().find("div").css('display','block');
			} else {
				$(this).removeClass('error');
				$(this).addClass('okay');
				$(this).parent().find("div").css('display','none');
			}
		});
		
		$(".simpleForm-structural label").click(function() {
			
			if($(this).attr("class")=="checked") {
				$(this).attr("class","");
			} else {
				$(this).attr("class","checked");
			}
		});
		
		$(".submit-button1").click(function() {
			
			if($("#input_password").val().length==0) {
				alert("비밀번호를 입력해주세요.");
				return;
			}
			if($("#input_checkbox1").parent().find("label").attr("class")!="checked") {
				alert("체크박스에 체크해주세요.");
				return;
			}
			
			// 다음페이지로 전달해야 하는 파라미터 : 이메일,비밀번호,동의여부1,동의여부2
			//alert("쌤한테 다음 페이지로 이동을 post방식으로 하는 법 질문하기");
			var agree1 = $("#input_checkbox1").parent().find('label').attr('class')=='checked' ? 'Y' : 'N';
			var agree2 = $("#input_checkbox2").parent().find('label').attr('class')=='checked' ? 'Y' : 'N';
			//var url = "Netflix05.jsp"
			//			+ "?password=" + $("#input_password").val()
			//			+ "&agree1=" + agree1
			//			+ "&agree2=" + agree2
			//alert("url : " + url);
			//location.href = url;
			var password = $("#input_password").val();
			var url = "Netflix05.jsp";
			go_post(url, password, agree1, agree2);
		});
	});
</script>
<style>
input:focus::-webkit-input-placeholder,
textarea:focus::-webkit-input-placeholder { /* WebKit browsers */
  color:transparent;
}
</style>
<link rel="stylesheet" href="css/Netflix04.css"/>
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
			<a href="/login" class="signupBasic-onboarding-header" data-uia="header-login-link">로그인</a>
		</div>
		<div class="procedure-simpleContainer">
			<div class="procedure-centerContainer">
				<div class="procedure-regContainer">
					<div class="stepHeader-container">
						<span class="stepIndicator">
							<b>1</b>/<b>3단계</b>
						</span>
						<h1 class="stepTitle">비밀번호를 설정해 멤버십을 시작하세요.</h1>
					</div>
					<div class="contextRow">몇 단계만 더 거치면 넷플릭스 가입 완료!</div>
					<div class="contextRow" style="margin-top:10px;">복잡한 단계는 모두 없앴습니다.</div>
					<form action = "Netflix05.jsp" method="post">
					<div class="simpleForm-structural">
						<div>
							<input type="email" id="input_email" value='<%=session.getAttribute("email")%>' readonly />		
							<label for="input_email">이메일 주소</label>
						</div>
						<div>
							<input type="password" name ="password" id="input_password"/>
							<label for="input_password">비밀번호를 추가하세요</label>
							<div class="error" style="display:none;">비밀번호를 입력해 주세요.</div>
						</div>
						<div>
							<input type="checkbox" name="agree1" id="input_checkbox1"/>
							<label for="input_checkbox1">
								<span>예, 저는 <a href="https://help.netflix.com/legal/privacy" target="_blank">개인정보 처리방침</a>에 따른 개인정보 수집 및 활용에 동의합니다.</span>
							</label>	
						</div>
						<div>
							<input type="checkbox" name="agree2" id="input_checkbox2"/>
							<label for="input_checkbox2">
								<span>예, 넷플릭스 특별 할인 알림 이메일을 보내주세요. (선택 사항)</span>
							</label>	
						</div>
					</div>
					</form>
					<!-- <ul class="simpleForm-structural">
						<li class="nfFormSpace">
							<div class="nfInput-validated">
								
							</div>
						</li>
					</ul> -->
					<div class="submitBtnContainer">
						<button class="submit-button1">동의하고 계속</button>
					</div>					
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
			</div>
		</div>
	</div>
</body>
</html>