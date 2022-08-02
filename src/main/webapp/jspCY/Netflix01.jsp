<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.cy.dao.*" %>
    <%@ page import="com.cy.dto.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="../js/jquery-3.6.0.min.js"></script>
	<script>
		$(function() {
			$(".n_button1").click(function() {
				var idx = $(this).index();   // index() : 자식의 인덱스번호를 리턴 / 만약 두 번째 .n_button1을 클릭했으면, 자식인덱스인  2.
				if($(".net-Qbox-question").children().eq(idx+1).css('display')=='block') {
					$(".net-Qbox-question").children().eq(idx+1).slideUp(200);
					return;
				}
				for(var i=1; i<=11; i+=2) {
					$(".net-Qbox-question").children().eq(i).slideUp(200);  //.css('display', 'none');
				}
				$(".net-Qbox-question").children().eq(idx+1).slideDown(200);  // .css('display', 'block');
			});
		});
	</script>
	<script src="https://kit.fontawesome.com/72fc69cb94.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="css/Netflix01.css"/>
</head>
<body>
	<!-- 메인 첫번째 칸 -->
	<div class="section" id="first-floor">	
		<!-- 넷플릭스 로고 -->
		<div class = "container">
			<svg viewBox="0 0 111 30" style="margin-top: 10px; margin-left: 12px;" class="netflixlogo" aria-hidden="true" focusable="false">
				<g id="netflix-logo">
					<path d="M105.06233,14.2806261 L110.999156,30 C109.249227,29.7497422 107.500234,29.4366857 105.718437,29.1554972 L102.374168,20.4686475 L98.9371075,28.4375293 C97.2499766,28.1563408 95.5928391,28.061674 93.9057081,27.8432843 L99.9372012,14.0931671 L94.4680851,-5.68434189e-14 L99.5313525,-5.68434189e-14 L102.593495,7.87421502 L105.874965,-5.68434189e-14 L110.999156,-5.68434189e-14 L105.06233,14.2806261 Z M90.4686475,-5.68434189e-14 L85.8749649,-5.68434189e-14 L85.8749649,27.2499766 C87.3746368,27.3437061 88.9371075,27.4055675 90.4686475,27.5930265 L90.4686475,-5.68434189e-14 Z M81.9055207,26.93692 C77.7186241,26.6557316 73.5307901,26.4064111 69.250164,26.3117443 L69.250164,-5.68434189e-14 L73.9366389,-5.68434189e-14 L73.9366389,21.8745899 C76.6248008,21.9373887 79.3120255,22.1557784 81.9055207,22.2804387 L81.9055207,26.93692 Z M64.2496954,10.6561065 L64.2496954,15.3435186 L57.8442216,15.3435186 L57.8442216,25.9996251 L53.2186709,25.9996251 L53.2186709,-5.68434189e-14 L66.3436123,-5.68434189e-14 L66.3436123,4.68741213 L57.8442216,4.68741213 L57.8442216,10.6561065 L64.2496954,10.6561065 Z M45.3435186,4.68741213 L45.3435186,26.2498828 C43.7810479,26.2498828 42.1876465,26.2498828 40.6561065,26.3117443 L40.6561065,4.68741213 L35.8121661,4.68741213 L35.8121661,-5.68434189e-14 L50.2183897,-5.68434189e-14 L50.2183897,4.68741213 L45.3435186,4.68741213 Z M30.749836,15.5928391 C28.687787,15.5928391 26.2498828,15.5928391 24.4999531,15.6875059 L24.4999531,22.6562939 C27.2499766,22.4678976 30,22.2495079 32.7809542,22.1557784 L32.7809542,26.6557316 L19.812541,27.6876933 L19.812541,-5.68434189e-14 L32.7809542,-5.68434189e-14 L32.7809542,4.68741213 L24.4999531,4.68741213 L24.4999531,10.9991564 C26.3126816,10.9991564 29.0936358,10.9054269 30.749836,10.9054269 L30.749836,15.5928391 Z M4.78114163,12.9684132 L4.78114163,29.3429562 C3.09401069,29.5313525 1.59340144,29.7497422 0,30 L0,-5.68434189e-14 L4.4690224,-5.68434189e-14 L10.562377,17.0315868 L10.562377,-5.68434189e-14 L15.2497891,-5.68434189e-14 L15.2497891,28.061674 C13.5935889,28.3437998 11.906458,28.4375293 10.1246602,28.6868498 L4.78114163,12.9684132 Z" id="Fill-14">
					</path>
				</g>
			</svg>
			<!-- 넷플릭스 상단 언어 & 로그인 버튼 -->
			<div class="fl_r" style="width: 260px; margin-top:8px;">
				<select id="oPtion">
					<option value="KR" style="background-image:url(img/icon1_lang.png);"><i class="fa-solid fa-globe">한국어</i></option>
					<option value="EN">English</option>	
				</select>
				<a href="Netflix02.jsp" class="authLinks redButton">로그인</a>
			</div>
		</div>
		<!-- 메인 배경이미지 & 그라데이션 -->
		<div id="background-pic">
			<img style="object-fit:cover; width:100%;" src="https://assets.nflxext.com/ffe/siteui/vlv3/970e664f-2df4-47ce-b4fa-446082f5abc1/c8338841-4eb6-4a33-b329-37eebbfaa002/KR-ko-20220523-popsignuptwoweeks-perspective_alpha_website_large.jpg"/>		
			<div class="img-gradient"></div>
		</div>
		<!-- 메인 텍스트 & 이메일 로그인 입력란 -->
		<div id="text-desc">
			<span id="title">영화와 시리즈를 <br/>무제한으로.</span><br/>
			<h1 class="honefont">다양한 디바이스에서 시청하세요. 언제든 해지하실 수 있습니다.</h1>
			<h2 class="htwofont">시청할 준비가 되셨나요? 멤버십을 등록하거나 재시작하려면 이메일 주소를 입력하세요.</h2>
			<!-- form태그 -->
			<form action="Netflix03.jsp" method="post">
				<div class="emailform">
					<input type="text" name="email" class="emailField fl_l"/>
					<button class="redbutton redbuttonfont fl_l">
						<span>시작하기</span> 
						<span><svg viewBox="0 0 6 12" xmlns="http://www.w3.org/2000/svg">
							<desc>chevron</desc>
								<path d="M.61 1.312l.78-.624L5.64 6l-4.25 5.312-.78-.624L4.36 6z" fill="none" fill-rule="evenodd"></path>
							</svg>
						</span>
					</button>
				</div>
			</form>
		</div>
	</div>
	<!-- 메인 두번째 칸 -->
	<div class="section" id ="second-floor">
		<div>
			<div class="fl_l">
				<h1 class="h_onefont fl_l">TV로 즐기세요.</h1><br/>
				<h2 class="h_twofont fl_l">스마트 TV, PlayStation, Xbox, Chromecast,<br/>Apple TV, 블루레이 플레이어 등 다양한<br/> 디바이스에서 시청하세요.</h2>
			</div>		
			<div class="fl_l">
				<img src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/tv.png"/>
				<video class="our-story-card-video	" autoplay="" playsinline="" muted="" loop="">
					<source src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/video-tv-0819.m4v" type="video/mp4">
				</video>
			</div>
		</div>
	</div>
	<!-- 메인 세번째 칸 -->
	<div class="section" id ="third-floor">
		<div>
			<div class="fl_r">
				<h1 class="third_h_onefont fl_r">즐겨 보는 콘텐츠를 저장해 오프라인으로 시청하세요.</h1><br/>
				<h2 class="third_h_twofont fl_r">간편하게 저장하고 빈틈없이 즐겨보세요.</h2>
			</div>		
			<div class="fl_l">
				<img src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/mobile-0819.jpg"/>
				<div class="card-animation">
					<img class="fl_l" src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/boxshot.png"/>
					<div class="text-0 fl_l">저장 중...</div>
					<!-- <img class="fl_l" src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/download-icon.gif"/> -->
				</div>
				<!--::after-->
			</div>
		</div>
	</div>
	<!-- 메인 네번째 칸 -->
	<div class="section" id="fourth-floor">
		<div>
			<div class="fl_l">
				<h1>다양한 디바이스에서 시청하세요.</h1>
				<h2>각종 영화와 시리즈를 스마트폰, 태블릿, 노트북, TV에서 무제한으로 스트리밍하세요. 추가 요금이 전혀 없습니다.</h2>
			</div>
			<div class="fl_l">
				<img src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/device-pile.png"/>
				<video class="our-story-card-video" autoplay="" playsinline="" muted="" loop=""><source src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/video-devices.m4v" type="video/mp4"></video>
			</div>
		</div>
	</div>
	<!-- 메인 다섯번째 칸 -->
	<div class="section" id="fifth-floor">
		<div>
		<div class="fl_r">
			<h1 class="fifth_honefont fl_r">어린이 전용 프로필을 만들어 보세요.</h1>
			<h2 class="fifth_htwofont fl_r">자기만의 공간에서 좋아하는 캐릭터와 즐기는 신나는 모험. 자녀에게 이 특별한 경험을 선물하세요. 넷플릭스 회원이라면 무료입니다.</h2>
		</div>
		<div class="fl_l">
			<img src="https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/cards/kidsValueProp.png"/>
		</div>
		</div>
	</div>
	<!-- 메인 여섯번째 칸 -->
	<div class="section" id="sixth-floor">
		<div>
			<div class="net-Qbox">
				<h1 class="sixth_honefont">자주 묻는 질문</h1>
			<div class="net-Qbox-question">
				<button class="n_button1 w_n">넷플릭스란 무엇인가요?
					<svg id="plus-icon" viewbox="0 0 26 26" focusable="true">
						<path d="M10.5 9.3L1.8 0.5 0.5 1.8 9.3 10.5 0.5 19.3 1.8 20.5 10.5 11.8 19.3 20.5 20.5 19.3 11.8 10.5 20.5 1.8 19.3 0.5 10.5 9.3Z"></path>
					</svg>
				</button>
				<div class="answer-open">
					<span id="summary">
					넷플릭스는 각종 수상 경력에 빛나는 시리즈, 영화, 애니메이션, 다큐멘터리 등 다양한 콘텐츠를 인터넷 연결이 가능한 수천 종의 디바이스에서 시청할 수 있는 스트리밍 서비스입니다. 
					<br>
					<br>
					저렴한 월 요금으로 일체의 광고 없이 원하는 시간에 원하는 만큼 즐길 수 있습니다. 무궁무진한 콘텐츠가 준비되어 있으며 매주 새로운 시리즈와 영화가 제공됩니다.
					</span>
				</div>
				<button class="n_button1 w_n">넷플릭스 요금은 얼마인가요?
					<svg id="plus-icon" viewbox="0 0 26 26" focusable="true">
						<path d="M10.5 9.3L1.8 0.5 0.5 1.8 9.3 10.5 0.5 19.3 1.8 20.5 10.5 11.8 19.3 20.5 20.5 19.3 11.8 10.5 20.5 1.8 19.3 0.5 10.5 9.3Z"></path>
					</svg>
				</button>
				<div class="answer-open">
					<span id="summary">
					스마트폰, 태블릿, 스마트 TV, 노트북, 스트리밍 디바이스 등 다양한 디바이스에서 월정액 요금 하나로 넷플릭스를 시청하세요. 멤버십 요금은 월 9,500원부터 17,000원까지 다양합니다. 추가 비용이나 약정이 없습니다.
					</span>
				</div>
				<button class="n_button1 w_n">어디에서 시청할 수 있나요?
					<svg id="plus-icon" viewbox="0 0 26 26" focusable="true">
						<path d="M10.5 9.3L1.8 0.5 0.5 1.8 9.3 10.5 0.5 19.3 1.8 20.5 10.5 11.8 19.3 20.5 20.5 19.3 11.8 10.5 20.5 1.8 19.3 0.5 10.5 9.3Z"></path>
					</svg>
				</button>
				<div class="answer-open">
					<span id="summary">
					언제 어디서나 시청할 수 있습니다. 넷플릭스 계정으로 로그인하면 PC에서 netflix.com을 통해 바로 시청할 수 있으며, 인터넷이 연결되어 있고 넷플릭스 앱을 지원하는 디바이스(스마트 TV, 스마트폰, 태블릿, 스트리밍 미디어 플레이어, 게임 콘솔 등)에서도 언제든지 시청할 수 있습니다.  
					<br>
					<br>
					iOS, Android, Windows 10용 앱에서는 좋아하는 시리즈를 저장할 수도 있습니다. 저장 기능을 이용해 이동 중이나 인터넷에 연결할 수 없는 곳에서도 시청하세요. 넷플릭스는 어디서든 함께니까요.
					</span>
				</div>
									
				<button class="n_button1 w_n">멤버십을 해지하려면 어떻게 하나요?
					<svg id="plus-icon" viewbox="0 0 26 26" focusable="true">
						<path d="M10.5 9.3L1.8 0.5 0.5 1.8 9.3 10.5 0.5 19.3 1.8 20.5 10.5 11.8 19.3 20.5 20.5 19.3 11.8 10.5 20.5 1.8 19.3 0.5 10.5 9.3Z"></path>
					</svg>
				</button>
				<div class="answer-open">
					<span id="summary">
					넷플릭스는 부담 없이 간편합니다. 성가신 계약도, 약정도 없으니까요. 멤버십 해지도 온라인에서 클릭 두 번이면 완료할 수 있습니다. 해지 수수료도 없으니 원할 때 언제든 계정을 시작하거나 종료하세요.
					</span>
				</div>
									
				<button class="n_button1 w_n">넷플릭스에서 어떤 콘텐츠를 시청할 수 있나요?
					<svg id="plus-icon" viewbox="0 0 26 26" focusable="true">
						<path d="M10.5 9.3L1.8 0.5 0.5 1.8 9.3 10.5 0.5 19.3 1.8 20.5 10.5 11.8 19.3 20.5 20.5 19.3 11.8 10.5 20.5 1.8 19.3 0.5 10.5 9.3Z"></path>
					</svg>
				</button>
				<div class="answer-open">
					<span id="summary">
					넷플릭스는 장편 영화, 다큐멘터리, 시리즈, 애니메이션, 각종 상을 수상한 넷플릭스 오리지널 등 수많은 콘텐츠를 확보하고 있습니다. 마음에 드는 콘텐츠를 원하는 시간에 원하는 만큼 시청하세요.
					</span>
				</div>
									
				<button class="n_button1 w_n">아이들이 넷플릭스를 봐도 좋을까요?
					<svg id="plus-icon" viewbox="0 0 26 26" focusable="true">
						<path d="M10.5 9.3L1.8 0.5 0.5 1.8 9.3 10.5 0.5 19.3 1.8 20.5 10.5 11.8 19.3 20.5 20.5 19.3 11.8 10.5 20.5 1.8 19.3 0.5 10.5 9.3Z"></path>
					</svg>
				</button>
				<div class="answer-open">
					<span id="summary">
					멤버십에 넷플릭스 키즈 환경이 포함되어 있어 자녀가 자기만의 공간에서 가족용 시리즈와 영화를 즐기는 동안 부모가 이를 관리할 수 있습니다. 
					<br>
					<br>
					키즈 프로필과 더불어 PIN 번호를 이용한 자녀 보호 기능도 있어, 자녀가 시청할 수 있는 콘텐츠의 관람등급을 제한하고 자녀의 시청을 원치 않는 특정 작품을 차단할 수도 있습니다.
					</span>
				</div>
			</div>
			<h2 class="htwofont" style="margin-top: 78px;">시청할 준비가 되셨나요? 멤버십을 등록하거나 재시작하려면 이메일 주소를 입력하세요.</h2>
			<form action="Netflix03.jsp" method="post">
				<div class="emailform">
					<input type="text" name=email class="emailField fl_l"/>
					<span class="redbutton redbuttonfont fl_l"> <span>시작하기</span> 
						<span>
							<svg viewBox="0 0 6 12" xmlns="http://www.w3.org/2000/svg">
							<desc>chevron</desc>
								<path d="M.61 1.312l.78-.624L5.64 6l-4.25 5.312-.78-.624L4.36 6z" fill="none" fill-rule="evenodd">
							</path>
							</svg>
						</span> 
					</span>
				</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 메인 일곱번째 칸 -->
	<div class="section" id="seventh-floor">
		<div>
			<div class="customer-center-box">
				<a class="customer-center-box-top">질문이 있으신가요? 문의 전화: &nbsp;</a>
				<a class="customer-center-telephone" href="tel:080-001-9587">080-001-9587</a>
			<ul class="customer_center_array">
				<li class="footer-link-item">
					<a class="footer-link">
						<span id="" >자주 묻는 질문</span>
					</a>
				</li>
			<li class="footer-link-item">
				<a class="footer-link">
					<span id="">고객 센터</span>
				</a>
			</li>
			<li class="footer-link-item">
				<a class="footer-link">
					<span id="">계정</span>
				</a>
			</li>
			<li class="footer-link-item">
				<a class="footer-link">
					<span id="">미디어 센터</span>
				</a>
			</li>
			<li class="footer-link-item">
				<a class="footer-link">
					<span id="">투자 정보(IR)</span>
				</a>
			</li>
			<li class="footer-link-item">
				<a class="footer-link">
					<span id="">입사 정보</span>
				</a>
			</li>
			<li class="footer-link-item">
				<a class="footer-link">
					<span id="">넷플릭스 지원 디바이스</span>
				</a>
			</li>
			<li class="footer-link-item">
				<a class="footer-link">
					<span id="">이용 약관</span>
				</a>
			</li>
			<li class="footer-link-item">
				<a class="footer-link">
					<span id="">개인정보</span>
				</a>
			</li>
			<li class="footer-link-item">
				<a class="footer-link">
					<span id="">쿠키 설정</span>
				</a>
			</li>
			<li class="footer-link-item">
				<a class="footer-link">
					<span id="">회사 정보</span>
				</a>
			</li>
			<li class="footer-link-item">
				<a class="footer-link">
					<span id="">문의하기</span>
				</a>
			</li>
			<li class="footer-link-item">
				<a class="footer-link">
					<span id="">속도 테스트</span>
				</a>
			</li>
			<li class="footer-link-item">
				<a class="footer-link">
					<span id="">법적 고지</span>
				</a>
			</li>
			<li class="footer-link-item originals-link">
				<a class="footer-link">
					<span id="">오직 넷플릭스에서</span>
				</a>
			</li>
			</ul>
			</div>
		</div>
	</div>
</body>
</html>