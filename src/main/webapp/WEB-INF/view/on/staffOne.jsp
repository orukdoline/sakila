<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>스태프 정보</title>
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
				<h1 class="sticky-top bg-white p-3">스태프 정보</h1><br>
					<h5>스태프 기본정보</h5>
					<table class="table table-bordered ">
						<tr>
							<td class="col-sm-1 fw-bold">아이디</td>
							<td>${staff.staffId}</td>
						</tr>
						<tr>
							<td class="fw-bold">이름</td>
							<td>${staff.firstName}</td>
						</tr>
						<tr>
							<td class="fw-bold">성</td>
							<td>${staff.lastName}</td>
						</tr>
						<tr>
							<td class="fw-bold">전화번호</td>
							<td>${staff.staffPhone}</td>
						</tr>
					</table>
							
					<h5>스태프 주소정보</h5>
					<table class="table table-bordered ">
						<tr>
							<td class="col-sm-1 fw-bold">상세주소1</td>
							<td>${staff.staffAddress}</td>
						</tr>
						<tr>
							<td class="fw-bold">상세주소2</td>
							<td>${staff.staffAddress2}</td>
						</tr>
						<tr>
							<td class="fw-bold">구</td>
							<td>${staff.staffDistrict}</td>
						</tr>
						<tr>
							<td class="fw-bold">시</td>
							<td>${staff.staffCity}</td>
						</tr>
						<tr>
							<td class="fw-bold">국가</td>
							<td>${staff.staffCountry}</td>
						</tr>
						<tr>
							<td class="fw-bold">우편번호</td>
							<td>${staff.staffPostCode}</td>
						</tr>
					</table>
					
					<h5>스토어 정보</h5>
					<table class="table table-bordered ">
						<tr>
							<td class="col-sm-1 fw-bold">아이디</td>
							<td>${staff.storeId}</td>
						</tr>
						<tr>
							<td class="fw-bold">전화번호</td>
							<td>${staff.storePhone}</td>
						</tr>
					</table>
					
					<h5>스토어 주소정보</h5>
					<table class="table table-bordered ">
						<tr>
							<td class="col-sm-1 fw-bold">상세주소1</td>
							<td>${staff.storeAddress}</td>
						</tr>
						<tr>
							<td class="fw-bold">상세주소2</td>
							<td>${staff.storeAddress2}</td>
						</tr>
						<tr>
							<td class="fw-bold">구</td>
							<td>${staff.storeDistrict}</td>
						</tr>
						<tr>
							<td class="fw-bold">시</td>
							<td>${staff.storeCity}</td>
						</tr>
						<tr>
							<td class="fw-bold">국가</td>
							<td>${staff.storeCountry}</td>
						</tr>
						<tr>
							<td class="fw-bold">우편번호</td>
							<td>${staff.storePostCode}</td>
						</tr>
					</table>
					
					<h5>매니저 정보</h5>
					<table class="table table-bordered ">
						<tr>
							<td class="col-sm-1 fw-bold">아이디</td>
							<td>${staff.managerStaffId}</td>
						</tr>
						<tr>
							<td class="fw-bold">이름</td>
							<td>${staff.managerName}</td>
						</tr>
					</table>
					
					<!-- 비밀번호 수정, 이메일 수정, 주소 수정, store 수정 -->
			</div>
		</div>
	</div>
</body>
</html>