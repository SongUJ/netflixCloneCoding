<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성하기</title>
</head>
<body>
	<form action="BoardWriteAction.jsp" method="post">
		제목 : <input type="text" name="title"/> <br/>
		내용 : <input type="text" name="content"/> <br/>
		작성자아이디 : <input type="text" name="writer"/> <br/>
		<input type="submit" value="작성완료"/>
	</form>
</body>
</html>