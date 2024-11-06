<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
    /* 각 옵션에 가로선을 추가하는 CSS */
    #resultAddress option {
        padding: 10px; /* 옵션의 패딩을 조정 */
    }

    /* 옵션 사이에 구분선을 추가 */
    #resultAddress option:not(:last-child) {
        border-bottom: 1px solid #ccc; /* 구분선 색상 */
    }
</style>
    
<meta charset="UTF-8">
<title>스태프 추가</title>
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
				
				<div class="container p-3 bg-light rounded">
					<div class="container">
						<h5>주소 선택</h5>
						<form id = "formAddress" action="${pageContext.request.contextPath }/on/addStaff" method="get">
							<div class="input-group mb-3">
								<input type="text" class="form-control" name="searchAddress" id="searchAddress">
								<button type="button" class="btn btn-primary" id = "btnAddress">주소검색</button>
							</div>
						</form>
					</div>
					<div class="container mt-2">
					    <select id="resultAddress" class="form-select" size="6">
					        <c:forEach var="a" items="${addressList}">
					            <option value="${a.addressId}">
					                [ADDRESS ID : ${a.addressId}] ${a.address}
					            </option>
					        </c:forEach>
					    </select>
					    <div class="d-grid">
					    	<button type="button" id="btnAddSel" class="btn btn-primary mt-2 btn-block">주소선택</button>
					    </div>
					</div>
				</div><br>
				
				<!-- 스프링이 자동으로 인스턴스를 만들어주기 때문에 Staff 객체의 필드와 이름을 같게 해줘야함 -->
				<form id = "addForm" action="${pageContext.request.contextPath }/on/addStaff" method="post">
					<table class="table table-borderless">
						<tr>
							<td>
								<div class="input-group">
									<span class="input-group-text">스토어ID</span>
									<select class="form-control" name="storeId" id="storeId">
										<option value="">:::선택:::</option>
										<c:forEach var="s" items="${storeList}">
											<option value="${s.storeId}">${s.storeId}</option>
										</c:forEach>
									</select>
								</div>
							</td>
						</tr>
						
						
						<tr>
							<td>
								<div class="input-group">
									<span class="input-group-text">주소ID</span>
									<input type="text" class="form-control" name="addressId" id="addressId" placeholder="주소를 선택해주세요." readonly>
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<div class="input-group">
								  <span class="input-group-text">이름</span>
								  <input type="text" class="form-control" id="firstName" placeholder="이름">
								  <input type="text" class="form-control" id="lastName" placeholder="성">
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<div class="input-group">
									<span class="input-group-text">이메일</span>
									<input type="text" class="form-control" name="email" id="email">
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<div class="input-group">
									<span class="input-group-text w-40">아이디</span>
									<input type="text" class="form-control" name="username" id="username">
								</div>
							</td>
						</tr>
					</table>
					<div class="d-grid">
				    	<button type="button" id="btnAddStaff" class="btn btn-secondary mt-2 btn-block">스태프 추가</button>
				    </div>
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