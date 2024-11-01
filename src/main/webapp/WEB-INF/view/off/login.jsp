<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="container">
	<h1>staff login<span>${msg}</span></h1>
	
	<form id="form" action="${pageContext.request.contextPath}/off/login" method="post">
		<div class="mb-3 mt-3">
			<label for="staffId" class="form-label">staffId : </label>
			<input type="text" class="form-control" id="staffId" name="staffId">
		</div>
		<div class="mb-3">
			<label for="password" class="form-label">password : </label>
			<input type="password" class="form-control" id="password" name="password">
		</div>
		<button id="btn" type="button" class="btn btn-primary">로그인</button>
	</form>
</body>
<script>
	// btn버튼 클릭 시 폼값 유효성 검사
	$('#btn').click(function(){
		console.log('click');
		// 숫자가 아니면
		if ($.isNumeric($('#staffId').val()) == false) {
			alert('staffId는 숫자만 입력 가능');
		} else if ($('#password').val().length < 4) {
			alert('password는 4자이상 가능');
		} else {
			$('#form').submit();
		}
	});
</script>
</html>