<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body >
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-sm-2">
				<!-- leftMenu.jsp include -->
				<c:import url="/WEB-INF/view/on/Inc/leftMenu.jsp" ></c:import>
			</div>
			<div class="col-sm-10">
				<!-- main content -->
				<h1 class="sticky-top bg-white p-3">지점 상세정보</h1><br>
				
				<h5>담당 매니저 정보</h5>
				<table class="table">
					<tr>
						<td>FirstName</td>
						<td>${storeOne.firstName }</td>
					</tr>
					<tr>
						<td>LastName</td>
						<td>${storeOne.lastName }</td>
					</tr>
					<tr>
						<td>Email</td>
						<td>${storeOne.email }</td>
					</tr>
					<tr>
						<td>Active</td>
						<td>${storeOne.active }</td>
					</tr>
					<tr>
						<td>Username</td>
						<td>${storeOne.username }</td>
					</tr>
				</table>
				
				<h5>주소 정보</h5>
				<table class="table">
					<tr>
						<td>Address</td>
						<td>${storeOne.address }</td>
					</tr>
					<tr>
						<td>Address2</td>
						<td>${storeOne.address2 }</td>
					</tr>
					<tr>
						<td>District</td>
						<td>${storeOne.district }</td>
					</tr>
					<tr>
						<td>CityId</td>
						<td>${storeOne.cityId }</td>
					</tr>
					<tr>
						<td>PostalCode</td>
						<td>${storeOne.postalCode }</td>
					</tr>
					<tr>
						<td>Phone</td>
						<td>${storeOne.phone }</td>
					</tr>
				</table>
				
				<h5>기타</h5>
				<table class="table">
					<tr>
						<td>lastUpdate</td>
						<td>${storeOne.lastUpdate }</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>