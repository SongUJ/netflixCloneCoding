<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
	$(function (){
		$("#btn1").click(function() {
			$.ajax({
				type: 'post',
				url: 'LoginServlet',
				success: function(data) {
					alert(data.check);
				},
				error: function(r,s,e) {
					alert("에러");
				}
			});
		});
	});
</script>
</head>
<body>
	<button id="btn1">버튼1</button>
</body>
</html>