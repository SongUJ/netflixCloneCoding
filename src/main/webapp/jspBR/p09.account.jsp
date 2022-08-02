<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="css/p09.account.css">
	<meta charset="UTF-8">
	<title>비밀번호 변경</title>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/common_headerBR.js"></script>
</head>


<body>
	<%@ include file = "headerBR.jspf" %>



	<div class="bd">
		<div class="responsive-account-container">
			<form class="change-password-form" data-uia="change-password-form"
				method="post" novalidate="">
				<h1>비밀번호 변경</h1>
				<ul class="simpleForm structural ui-grid">
					<li data-uia="field-currentPassword+wrapper" class="nfFormSpace">
						<div data-uia="field-currentPassword+container" class="nfInput">
							<div class="nfInputPlacement">
								<label class="input_id" placeholder="currentPassword">
								<input type="password" data-uia="field-currentPassword"
									name="currentPassword" class="nfTextField"
									id="id_currentPassword" value="" tabindex="0"
									autocomplete="off" maxlength="60" minlength="4" dir="">
									<label	for="id_currentPassword" class="placeLabel">기존 비밀번호</label></label>
							</div>
							<div id="" class="inputCaption" data-uia="">
								<a style="color: #0f84fa" href="">비밀번호를 잊으셨나요? </a>
							</div>
						</div>
					</li>
					<li data-uia="field-newPassword+wrapper" class="nfFormSpace">
						<div data-uia="field-newPassword+container" class="nfInput">
							<div class="nfInputPlacement">
								<label class="input_id" placeholder="newPassword"><input
									type="password" data-uia="field-newPassword" name="newPassword"
									class="nfTextField" id="id_newPassword" value="" tabindex="0"
									autocomplete="off" maxlength="60" minlength="6" dir=""><label
									for="id_newPassword" class="placeLabel">새 비밀번호(6~60자)</label></label>
							</div>
						</div>
					</li>
					<li data-uia="field-confirmNewPassword+wrapper" class="nfFormSpace">
						<div data-uia="field-confirmNewPassword+container" class="nfInput">
							<div class="nfInputPlacement">
								<label class="input_id" placeholder="confirmNewPassword"><input
									type="password" data-uia="field-confirmNewPassword"
									name="confirmNewPassword" class="nfTextField"
									id="id_confirmNewPassword" value="" tabindex="0"
									autocomplete="off" maxlength="60" minlength="6" dir="">
									<label for="id_confirmNewPassword" class="placeLabel">새
										비밀번호 재입력</label></label>
							</div>
						</div>
					</li>
					<li data-uia="field-requireAllDevicesSignIn+wrapper"
						class="nfFormSpace">
						<div class="ui-binary-input">
							<input type="checkbox" class="" name="AllDevicesSignIn" id="cb"
								value="true" tabindex="0" checked="" data-uia=""> <label
								for="cb" class="checklabel"> 모든 디바이스에서 새로운 비밀번호로 다시
								로그인하셔야 합니다.</label>
							<div class="helper"></div>
						</div>
					</li>
				</ul>
				<div class="nf-btn-bar change-password-buttons">
					<button id="btn-save" type="submit" autocomplete="off" tabindex="0"
						class="nf-btn nf-btn-primary nf-btn-retro nf-btn-small"
						data-uia="action_save-password" placeholder="">
						<a style="color: #fff"
							href="p05.account.jsp">
							저장</a>
					</button>
					<button id="btn-cancel" type="button" autocomplete="off"
						tabindex="0"
						class="nf-btn nf-btn-secondary nf-btn-retro nf-btn-small"
						data-uia="action_cancel-change-password" placeholder="">
						<a style="color: #000"
							href="p05.account.jsp">
							취소</a>
					</button>
				</div>
			</form>
		</div>
	</div>





	<%@ include file = "bottom-service-centerBR.jspf" %>


</body>

</html>