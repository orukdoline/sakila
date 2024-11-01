<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body class="container-fluid p-3">
	<div class="row">
		<div class="col-sm-2">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/Inc/leftMenu.jsp"></c:import>
		</div>
		<div class="col-sm-10">
			<!-- main content -->
			<h1>회원정보</h1><br>
			<table class="table table-bordered ">
				<tr>
					<td class="col-sm-1">이름</td>
					<td>${staff.firstName}</td>
				</tr>
				<tr>
					<td>성</td>
					<td>${staff.lastName}</td>
				</tr>
				<tr>
					<td>주소ID</td>
					<td>${staff.addressId}</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${staff.email}</td>
				</tr>
				<tr>
					<td>스토어ID</td>
					<td>${staff.storeId}</td>
				</tr>
				<tr>
					<td>계정ID</td>
					<td>${staff.username}</td>
				</tr>
				<tr>
					<td>수정날짜</td>
					<td>${staff.lastUpdate}</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>