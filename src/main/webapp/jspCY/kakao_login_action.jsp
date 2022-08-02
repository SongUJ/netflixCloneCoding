<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.cy.dao.*" %>

<!DOCTYPE html>
<html>
<head>
<%
	String email = request.getParameter("email");
	
	LoginDAO ldao = new LoginDAO();
	ArrayList<String> emailList = ldao.getemailList();
	int emailcheck = 0;
	for(int i = 0; i< emailList.size(); i++){
		if(email.equals(emailList.get(i))==true){
			emailcheck=1;
		}
	}
	System.out.println(emailcheck);
	if(emailcheck==1){
		session.setAttribute("email",email);
	}else{
		ldao.registkakao(email);//이메일을 파라미터로 받아서 회원가입 처리를 해줌.
		session.setAttribute("email",email);
	}
%>
<script>
	alert("로그인 성공");
	//location.href="메인페이지";
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>