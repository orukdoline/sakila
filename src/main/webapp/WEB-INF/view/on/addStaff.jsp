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
				<h1 class="sticky-top bg-white p-3">스태프 추가</h1><br>
				
				<h2>주소 검색</h2>
				<form id = "formAddress" action="${pageContext.request.contextPath }/on/addStaff" method="get">
					<input type="text" name="searchAddress" id="searchAddress">
					<button type="button" id = "btnAddress">주소검색</button>
				</form>
				
				<div>
					<h2>주소를 선택하세요</h2>
					<select id = "resultAddress" size = "10">
						<c:forEach var = "a" items="${addressList }">
							<option value="${a.addressId}">
								(ADDRESS ID : ${a.addressId }) ${a.address}
							</option>
						</c:forEach>
					</select>
					<br>
					<button type="button" id = "btnAddSel">주소선택</button>
				</div>
				
				<!-- 스프링이 자동으로 인스턴스를 만들어주기 때문에 Staff 객체의 필드와 이름을 같게 해줘야함 -->
				<form id = "addForm" action="${pageContext.request.contextPath }/on/addStaff" method="post">
					<table class="table">
						<tr>
							<td>storeId</td>
							<td>
								<select name="storeId" id="storeId">
									<option value="">:::선택:::</option>
									<c:forEach var="s" items="${storeList}">
										<option value="${s.storeId}">${s.storeId}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						
						<tr>
							<td>addressId</td>
							<td>
								<input type="text" name="addressId" id="addressId" readonly>
							</td>
						</tr>
						
						<tr>
							<td>firstName</td>
							<td>
								<input type="text" name="firstName" id="firstName">
							</td>
						</tr>
						
						<tr>
							<td>lastName</td>
							<td>
								<input type="text" name="lastName" id="lastName">
							</td>
						</tr>
						
						<tr>
							<td>email</td>
							<td>
								<input type="text" name="email" id="email">
							</td>
						</tr>
						
						<tr>
							<td>userName</td>
							<td>
								<input type="text" name="username" id="username">
							</td>
						</tr>
					</table>
					<button id="btnAddStaff" type="button">스태프 추가</button>
				</form>
			</div>
		</div>
	</div>
</body>

<script>
	$('#btnAddStaff').click(function(){
		// 입력폼 유효성 검사.
		if ($('#storeId').val() == null || $('#storeId').val() == '') {
			alert('storeId를 입력하세요');
		} else if ($('#addressId').val() == null || $('#addressId').val() == '') {
			alert('addressId를 입력하세요');
		} else if ($('#firstName').val() == null || $('#firstName').val() == '') {
			alert('firstName을 입력하세요');
		} else if ($('#lastName').val() == null || $('#lastName').val() == '') {
			alert('lastName을 입력하세요');
		} else if ($('#email').val() == null || $('#email').val() == '') {
			alert('email을 입력하세요');
		} else if ($('#username').val() == null || $('#username').val() == '') {
			alert('userName을 입력하세요');
		} else { 
			$('#addForm').submit();
		}
	});
	

	$('#btnAddSel').click(function(){
		if ($('#resultAddress').val() == '' || $('#resultAddress').val() == null) {
			alert('주소 선택을 먼저 하세요');
		} else {
			$('#addressId').val($('#resultAddress').val());
		}
	});
	
	$('#btnAddress').click(function(){
		if($('#searchAddress').val() == "") {
			alert('주소 검색어를 입력하세요');
		} else {
			$('#formAddress').submit();
		}
	});
</script>
</html>