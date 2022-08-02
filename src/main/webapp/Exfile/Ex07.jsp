<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첫번째 페이지</title>
<%

%>
</head>
<body>
<form action="Ex07p2.jsp">
	시작 : <input type="text" name = "num1"/> <br/>
	끝 : <input type="text" name = "num2"/> <br/>
	<input type="submit" value="계산시작"/>
	<input type="reset" value="다시 입력"/>
<!-- form 태그의 사용 이해 : 
	다음 페이지 지정은 action태그에 
	name은 파라미터의 이름
	submit은 모든걸 묶어서 다음페이지로 넘어간
	type reset은 모든내용을 삭제 -->
</form>
</body>
</html>
