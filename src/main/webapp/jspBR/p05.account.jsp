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
<meta charset="UTF-8">
<link rel="stylesheet" href="css/p05.account.css">
<title>넷플릭스 계정 메인</title>
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

<script>
		$(function(){
			$(".copy-text-block").click(function(){
				alert("준비중입니다");
			});
		});
		
		/* $(function(){
			$("#netflix-logo").click(function (){
				location.href="index.jsp";
			});
		});  */
		
		
		$(function(){
			$(".profile-links").click(function(){
				alert("준비중입니다");
			});
		});
		
		$(function(){});
		
	</script>

</head>


<body>
	<%@ include file = "headerBR.jspf" %>
	
<div class="bd">
	<div class="responsive-account-container">
		<div>
			<h1 class="account-header account-header-inline">계정</h1>
			<div class="account-section-membersince" data-uia="member-since">
				<div class="account-section-membersince--svg"></div>
				멤버십 시작: 8월 2021
			</div>
			<div class="account-pre-messages-container"
				data-uia="account-pre-messages-container"></div>
			<div class="account-messages-container"></div>
			<div class="responsive-account-content" data-uia="account-content">
				<div
					class="account-section collapsable-panel clearfix membership-section-wrapper membership-section-with-button"
					data-uia="membership-section">
					<header class="account-section-header collapsable-section-toggle">
						<h2 class="account-section-heading">
							멤버십 &amp; 결제 정보
							<button class="btn account-cancel-button btn-plain btn-small"
								type="button" autocomplete="off" tabindex="0"
								data-uia="action-cancel-plan">
								<span>멤버십 해지</span>
							</button>
						</h2>
					</header>
					<section
						class="collapsable-section-content account-section-content">
						<div class="account-subsection clearfix">
							<div class="clearfix">
								<div class="account-section-group">
									<div data-uia="account-email"
										class="account-section-item account-section-email">
										<%=emailAddress %>
									</div>
									<div data-uia="account-password"
										class="account-section-item account-section-item-disabled">
										비밀번호:********</div>
									<div data-uia="account-phone"
										class="account-section-item account-section-item-disabled">
										전화번호:010-1234-5678</div>
								</div>
								<div class="account-section-group">
									<div class="account-section-item">
										<a data-uia="account-email-link" class="account-section-link"
											href="p06.account.jsp?profile_id=<%=Integer.parseInt(request.getParameter("profile_id")) %>">
											이메일 주소  변경</a>
									</div>
									<div class="account-section-item">
										<a data-uia="account-password-link"
											class="account-section-link"
											href="p09.account.jsp">
											비밀번호 변경</a>
									</div>
									<div class="account-section-item">
										<a data-uia="account-phone-link" class="account-section-link"
											href="p10.account.jsp">
											휴대폰번호 변경</a>
									</div>
								</div>
							</div>
						</div>
						<div class="account-subsection clearfix light-divider">
							<div data-uia="wallet-subsection">
								<div class="account-subsection-borderless clearfix"
									data-uia="account-subsection-standard">
									<div class="account-section-group payment-details -wide">
										<div class="account-section-item">
											<div class="wallet--mop" data-uia="wallet-mop">
												<span class="" data-uia="payment-icon"><span
													class="text-payment" data-uia="payment-text">신용카드</span> </span><span
													id="" class="mopType" data-uia="mopType">•••• ••••
													•••• 6803</span>
											</div>
										</div>
										<div id="" class="account-section-item"
											data-uia="nextBillingDate-item">다음 결제일은 2022년 7월
											29일입니다.</div>
									</div>
									<div class="account-section-group -thin">
										<div class="account-section-item">
											<a class="account-section-link"
												data-uia="action-update-payment"
												href="/simplemember/managepaymentinfo">결제 정보 관리</a>
										</div>
										<div class="account-section-item">
											<a class="account-section-link"
												data-uia="wallet-subsection-add-backup-mop-link"
												href="/simplemember/paymentpicker">예비 결제 수단 등록</a>
										</div>
										<div class="account-section-item">
											<a class="account-section-link"
												data-uia="account-view-billing" href="/BillingActivity">결제
												상세 정보</a>
										</div>
										<div class="account-section-item">
											<a class="account-section-link"
												data-uia="action-update-billing-date"
												href="/simplemember/billingdateedit">결제일 변경</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div
							class="account-subsection clearfix is-external-gift-redemption light-divider">
							<div class="clearfix">
								<div class="u-ta-right-desktop gifts-link-group">
									<div class="account-section-item account-section-item">
										<a class="account-section-link" data-uia="action-redeem-link"
											href="/redeem">기프트카드 또는 할인 코드 입력</a>
									</div>
									<div class="account-section-item account-section-item">
										<a class="account-section-link"
											data-uia="action-gift-cards-link" href="/gift-cards"
											target="_blank" rel="noopener noreferrer">기프트카드 판매처</a>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
				<div class="account-section collapsable-panel clearfix"
					data-uia="plan-section">
					<header class="account-section-header collapsable-section-toggle">
						<h2 class="account-section-heading">멤버십 상세 정보</h2>
					</header>
					<section
						class="collapsable-section-content account-section-content">
						<div class="account-subsection clearfix">
							<div class="clearfix">
								<div class="account-section-group">
									<div class="account-section-item" data-uia="plan-label">
										<b>스탠다드</b>
										<svg viewBox="0 0 1740 960" class="quality-icon">
                                       <g stroke="none"
												stroke-width="1" fill="none" fill-rule="evenodd">
                                           <path
												d="M700,549 L398,549 L398,746 L300,746 L300,247 L398,247 L398,443 L700,443 L700,247 L799,247 L799,746 L700,746 L700,549 Z M1196,247 C1271,247 1326,260 1359,286 C1387,306 1408,335 1424,372 C1440,408 1448,449 1448,493 C1448,591 1419,661 1359,706 C1326,732 1271,746 1196,746 L950,746 L950,247 L1196,247 Z M1186,639 C1316,639 1343,562 1343,493 C1343,427 1329,351 1186,351 L1048,351 L1048,639 L1186,639 Z"
												fill="currentColor"></path>
                                           <path
												d="M1608.00019,0 C1681.00009,0 1740,59 1740,132 L1740,827 C1740,868.423884 1721.51202,905.147426 1692.42954,929.452533 C1669.55882,948.56629 1640.13605,960 1608.00019,960 L133.999803,960 C58.9999134,960 0,901 0,827 L0,132 C0,59 58.9999134,0 133.999803,0 L1608.00019,0 Z M133.999803,80 C103.999847,80 79.9998826,103 79.9998826,132 L79.9998826,827 C79.9998826,857 103.999847,880 133.999803,880 L1608.00019,880 C1637.00015,880 1660.00012,856 1660.00012,827 L1660.00012,132 C1660.00012,103 1637.00015,80 1608.00019,80 L133.999803,80 Z"
												fill="currentColor"></path>
                                       </g>
                                   </svg>
									</div>
								</div>
								<div class="account-section-group">
									<div class="account-section-item">
										<a data-uia="action-change-plan" class="account-section-link"
											href="/ChangePlan">멤버십 변경</a>
									</div>
								</div>
							</div>
							<div class="account-subsection clearfix">
								<div class="account-section-group -full">
									<p class="account-addendum"></p>
									<p class="account-addendum"></p>
								</div>
							</div>
						</div>
					</section>
				</div>
				<!-- <div class="account-section collapsable-panel clearfix"
					data-uia="profile-section">
					<header class="account-section-header collapsable-section-toggle">
						<h2 class="account-section-heading">프로필 &amp; 자녀 보호 설정</h2>
					</header>
					<section
						class="collapsable-section-content account-section-content">
						<div class="account-subsection clearfix">
							<div class="profile-hub">
								<ul>
									<li class="single-profile" data-uia="single-profile-0" id="profile_0">
										<div aria-expanded="false" class="profile-header">
											<img class="activeProfile"
												src="https://occ-0-3076-993.1.nflxso.net/dnm/api/v6/K6hjPJd6cR6FpVELC5Pd6ovHRSk/AAAABYIjCX1PBV_-B6KFbyhlYhx0sAH67wzO645FWG75LyJIhL8b8dtEoqoA9it8uwA-4mDX1E9Kr7iLrcKnAeJVJyzUd3-uNa1MVA.png?r=869"
												alt="">
											<div class="profile-summary">
												<h3>뽀로로</h3>
												<div>모든 관람등급</div>
											</div>
											<button class="profile-action-icons" aria-label=""
												style="border: none;" aria-controls="profile_0">
												<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
													xmlns="http://www.w3.org/2000/svg"
													class="svg-icon svg-icon-chevron-down">
	                                              <path
														fill-rule="evenodd" clip-rule="evenodd"
														d="M19.293 7.29297L12.0001 14.5859L4.70718 7.29297L3.29297 8.70718L11.293 16.7072C11.4805 16.8947 11.7349 17.0001 12.0001 17.0001C12.2653 17.0001 12.5196 16.8947 12.7072 16.7072L20.7072 8.70718L19.293 7.29297Z"
														fill="currentColor"></path>
	                                          </svg>
											</button>
										</div>
										<ul class="profile-links" style="display:none;">
											<li class="account-section-item">
											<a	class="profile-link"data-uia="action-language-preferences">
												<div class="profile-main">
													<h4>언어</h4>
														한국어
												</div>
											</a> 
											</li>
											<li class="account-section-item"><a
												class="profile-link"
												href="/settings/restrictions/LWO42JP6PFCNNFICWA6HOVA6F4"
												data-uia="action-content-restrictions">
													<div class="profile-main">
														<h4>시청 제한</h4>
														<div>제한 없음.</div>
													</div>
													<div class="profile-change">변경</div>
											</a></li>
											<li class="account-section-item"><a
												class="profile-link"
												href="/settings/lock/LWO42JP6PFCNNFICWA6HOVA6F4"
												data-uia="action-profile-lock">
													<div class="profile-main">
														<h4>프로필 잠금</h4>
														꺼짐
													</div>
													<div class="profile-change">변경</div>
											</a></li>
											<li class="account-section-item"><a
												class="profile-link"
												href="/settings/viewed/LWO42JP6PFCNNFICWA6HOVA6F4"
												data-uia="action-viewing-activity">
													<div class="profile-main">
														<h4>시청 기록</h4>
													</div>
													<div class="profile-change">보기</div>
											</a></li>
											<li class="account-section-item"><a
												class="profile-link"
												href="/settings/rated/LWO42JP6PFCNNFICWA6HOVA6F4"
												data-uia="action-rating-activity">
													<div class="profile-main">
														<h4>평가한 콘텐츠</h4>
													</div>
													<div class="profile-change">보기</div>
											</a></li>
											<li class="account-section-item"><a
												class="profile-link"
												href="/settings/playback/LWO42JP6PFCNNFICWA6HOVA6F4"
												data-uia="action-video-quality">
													<div class="profile-main">
														<h4>재생 설정</h4>
														다음 화 자동 재생. 미리보기 자동 재생. 자동 설정된 화질 및 음질.
													</div>
													<div class="profile-change">변경</div>
											</a></li>
											<li class="account-section-item"><a
												class="profile-link"
												href="/EmailPreferences/LWO42JP6PFCNNFICWA6HOVA6F4"
												data-uia="action-communication-preferences">
													<div class="profile-main">
														<h4>커뮤니케이션 설정</h4>
													</div>
													<div class="profile-change">변경</div>
											</a></li>
											<li class="account-section-item"><a
												class="profile-link"
												href="/marketingcommunications/LWO42JP6PFCNNFICWA6HOVA6F4"
												data-uia="action-marketing-preferences">
													<div class="profile-main">
														<h4>마케팅 커뮤니케이션</h4>
													</div>
													<div class="profile-change">변경</div>
											</a></li>
										</ul>
									</li>
									<li class="single-profile" data-uia="single-profile-1" id="profile_1">
										<div aria-expanded="false" class="profile-header">
											<img class="activeProfile"
												src="https://occ-0-3076-993.1.nflxso.net/dnm/api/v6/K6hjPJd6cR6FpVELC5Pd6ovHRSk/AAAABTOIZ3WKqNcwPn3Q9mhMYiey8jy1rToyGXA3rnsvMq5pWhIVwNtfE3RSmCVGwj5i07T1id83mLvznlXcdZw8-HOrwihdjt3mIw.png?r=fcd"
												alt="">
											<div class="profile-summary">
												<h3>크롱</h3>
												<div>모든 관람등급</div>
											</div>
											<button class="profile-action-icons" aria-label=""
												style="border: none;" aria-controls="profile_1">
												<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
													xmlns="http://www.w3.org/2000/svg"
													class="svg-icon svg-icon-chevron-down">
	                                              <path
														fill-rule="evenodd" clip-rule="evenodd"
														d="M19.293 7.29297L12.0001 14.5859L4.70718 7.29297L3.29297 8.70718L11.293 16.7072C11.4805 16.8947 11.7349 17.0001 12.0001 17.0001C12.2653 17.0001 12.5196 16.8947 12.7072 16.7072L20.7072 8.70718L19.293 7.29297Z"
														fill="currentColor"></path>
	                                          </svg>
											</button>
										</div>
										<ul class="profile-links" style="display:none;">
												<li class="account-section-item"><a
													class="profile-link"
													href="/settings/language/6IMTSN53VFHMDG5RDSAMROD76Y"
													data-uia="action-language-preferences">
														<div class="profile-main">
															<h4>언어</h4>
															한국어
														</div>
														<div class="profile-change">변경</div>
												</a></li>
												<li class="account-section-item"><a
													class="profile-link"
													href="/settings/restrictions/6IMTSN53VFHMDG5RDSAMROD76Y"
													data-uia="action-content-restrictions">
														<div class="profile-main">
															<h4>시청 제한</h4>
															<div>제한 없음.</div>
														</div>
														<div class="profile-change">변경</div>
												</a></li>
												<li class="account-section-item"><a
													class="profile-link"
													href="/settings/lock/6IMTSN53VFHMDG5RDSAMROD76Y"
													data-uia="action-profile-lock">
														<div class="profile-main">
															<h4>프로필 잠금</h4>
															꺼짐
														</div>
														<div class="profile-change">변경</div>
												</a></li>
												<li class="account-section-item"><a
													class="profile-link"
													href="/settings/viewed/6IMTSN53VFHMDG5RDSAMROD76Y"
													data-uia="action-viewing-activity">
														<div class="profile-main">
															<h4>시청 기록</h4>
														</div>
														<div class="profile-change">보기</div>
												</a></li>
												<li class="account-section-item"><a
													class="profile-link"
													href="/settings/rated/6IMTSN53VFHMDG5RDSAMROD76Y"
													data-uia="action-rating-activity">
														<div class="profile-main">
															<h4>평가한 콘텐츠</h4>
														</div>
														<div class="profile-change">보기</div>
												</a></li>
												<li class="account-section-item"><a
													class="profile-link"
													href="/settings/playback/6IMTSN53VFHMDG5RDSAMROD76Y"
													data-uia="action-video-quality">
														<div class="profile-main">
															<h4>재생 설정</h4>
															다음 화 자동 재생. 미리보기 자동 재생. 자동 설정된 화질 및 음질.
														</div>
														<div class="profile-change">변경</div>
												</a></li>
											</ul>
										</li>
									</ul>
								</div>
							</div>
						</section>
					</div> -->
			<div class="account-section collapsable-panel clearfix"
				data-uia="settings-section">
				<header class="account-section-header collapsable-section-toggle">
					<h2 class="account-section-heading">설정</h2>
				</header>
				<section
					class="collapsable-section-content account-section-content">
					<div class="account-subsection clearfix">
						<div class="clearfix">
							<div class="account-section-group">
								<div>
									<div class="account-section-item account-section-item">
										<a class="account-section-link" href=""
											data-uia="action-test-participation">넷플릭스 테스터로 참여</a>
									</div>
									<div class="account-section-item account-section-item">
										<a class="account-section-link" href=""
											data-uia="action-device-management">영상 저장 디바이스 관리</a>
									</div>
									<div class="account-section-item">
										<a class="account-section-link"
											data-uia="action-account-access" href="">디바이스 최근 시청 기록</a>
									</div>
									<div class="account-section-item">
										<a class="account-section-link" href="/ManageDevices"
											data-uia="action-sign-out-all-devices">모든 디바이스에서 로그아웃</a>
									</div>
									<div class="account-section-item">
										<a data-uia="external-data-request-link"
											class="account-section-link" href="">개인 정보 다운로드</a>
									</div>
								</div>
							</div>
							<div class="account-section-group left-align"></div>
						</div>

				
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</div>


<%@ include file = "bottom-service-centerBR.jspf" %>


		

</body>

</html>
