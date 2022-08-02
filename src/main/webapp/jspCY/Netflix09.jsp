<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.cy.dao.*" %>
    <%@ page import="com.cy.dto.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="../js/jquery-3.6.0.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	window.onload = function(){
	    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	                document.getElementById("address_kakao").value = data.address; // 주소 넣기
	                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
	            }
	        }).open();
	    });
	}
	</script>
	<script>
		function submit_check(){
			if($(".nfTextField-hasText").val().length==0){
				alert("이름을 입력하세요.");
				return false;				
			}
			if($(".nfTextField-9").val().length==0){
				alert("닉네임을 입력하세요.");
				return false;
			}
			//alert("이름을 입력하셨습니다.");
			return true;
		}
	</script>
	<link rel="stylesheet" href="css/Netflix09.css"/>
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
				<a href="/ask" class="signupBasic-onboarding-header" data-uia="header-login-link">문의하기</a>
			</div>

			<div class="procedure-simpleContainer">
				<div class="procedure-congratContainer">
					<h1 class="orderFinalTitle">넷플릭스를 시청할 프로필을 등록하세요.</h1>
					<div class="section">
						<p>한집에 사는 사람들이 취향과 언어 설정에 맞는 콘텐츠를 추천받을 수 있습니다. 특히 어린이에 맞춰 설정된 키즈 세상도 준비되어 있습니다.</p>
					</div>
				</div>
				<div class="procedure-congratContainer2">
				<form method="post" name="" class="addprofile-form" action="Netflix10.jsp">
					<h2 class="Myprofile-header">사용자 이름</h2>
					<ul class="simpleform-Structual-form">
						<li class="netflix-spaceForm">
						<div class="ownName-container">
							<div class="inputPlacement">
							<div class="inputPlacement:before">
							<label class="input_id" placeholder="ownerName">
								<input type="text" name="name" class="nfTextField-hasText" value="" required/>
								<label for="id_ownerName" class="placeLabel-Name">이름</label>
							</label>
							</div>	
							</div>
						</div>
						</li>
					</ul>
					<tr>
			            <th>주소</th>
			            <td><input style="margin-top:10px;width: 493px;height: 50px;" type="text" id="address_kakao" name="address" readonly /></td></br>
			        </tr>
			        <tr>
			            <th>상세 주소</th>
			            <td><input type="text" name="address_detail" style="margin-top:10px;margin-top: 10px;width: 493px;"/></td>
			        </tr>
					<h2 class="profile-header-add">프로필을 추가하시겠어요?</h2>
					<ul class="simpleform-Add-profile">
					
						<li class="nformSpace-Inputname">
							<div class="nfinputResponsive">
								<div class="addInputPlacement-9">
									<div class="addInputPlacement-9:before">
									<lable>
									<input type="text" name="nickname1" class="nfTextField-9" value="" required>
									<label for="id_profile1Name" class="placeLabel-Name">닉네임</label>
									</lable>
									</div>
								</div>
							</div>
						</li>
						
						<li class="nformSpace-Inputname">
							<div class="nfinputResponsive">
								<div class="addInputPlacement-9">
									<div class="addInputPlacement-9:before">
									<lable>
									<input type="text" name="nickname2" class="nfTextField-9" value="">
									<label for="id_profile1Name" class="placeLabel-Name">닉네임</label>
									</lable>
									</div>
								</div>
							</div>
						</li>
						
						<li class="nformSpace-Inputname">
							<div class="nfinputResponsive">
								<div class="addInputPlacement-9">
									<div class="addInputPlacement-9:before">
									<lable>
									<input type="text" name="nickname3" class="nfTextField-9" value="">
									<label for="id_profile1Name" class="placeLabel-Name">닉네임</label>
									</lable>
									</div>
								</div>
							</div>
						</li>
						
						<li class="nformSpace-Inputname">
							<div class="nfinputResponsive">
								<div class="addInputPlacement-9">
									<div class="addInputPlacement-9:before">
									<lable>
									<input type="text" name="nickname4" class="nfTextField-9" value="">
									<label for="id_profile1Name" class="placeLabel-Name">닉네임</label>
									</lable>
									</div>
								</div>
							</div>
						</li>
						
						
					</ul>
					
					<button type="button" class="sharingRulesbtn">
						한집에 사는 사람들만 계정을 함께 이용할 수 있습니다.
						<span style="color: #232323; font-weight: 700; text-decoration: underline;">더 알아보기</span>
					</button>
	
					<button class="primary-nf-btn-solid" onclick="submit_check();">다음</button>
				</form>
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