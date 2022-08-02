<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Scanner" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	Scanner sc = new Scanner(System.in);
	System.out.print("이름을 입력하세요 : ");
	String name = sc.nextLine();
%>
</head>
<body>
	<%
		out.println(name + "님, 안녕하세요");
	%>
</body>
</html>