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
				<h1 class="sticky-top bg-white p-3">지점 추가</h1><br>
				
				<div class="container p-3 bg-light rounded">
					<div class="container">
						<h5>지점 주소 선택</h5>
						<form id = "formAddress" action="${pageContext.request.contextPath }/on/addStore" method="get">
							<div class="input-group mb-3">
								<input type="text" class="form-control" name="searchAddress" id="searchAddress">
								<button type="button" class="btn btn-primary" id = "btnAddress">주소검색</button>
							</div>
						</form>
					</div>
					<div class="container mt-2">
					    <select id="resultAddress" class="form-select" size="6">
					        <c:forEach var="a" items="${addressList}">
					            <option value="${a.addressId}" <c:if test="${param.selectedAddressId == a.addressId}">selected</c:if>>
					                [ADDRESS ID : ${a.addressId}] ${a.address}
					            </option>
					        </c:forEach>
					    </select>
					</div>
				</div><br>
				<form id="storeForm" method="post" action="${pageContext.request.contextPath }/on/addStore">
					<table class="table table-borderless">
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
									<span class="input-group-text">스태프ID</span>
									<select class="form-control" name="managerStaffId" id="managerStaffId">
										<option value="">:::선택:::</option>
										<c:forEach var="s" items="${staffList}">
											<option value="${s.staffId}">${s.staffId}</option>
										</c:forEach>
									</select>
								</div>
							</td>
						</tr>
					</table>
				<div class="d-grid">
			    	<button type="button" id="btnAddSel" class="btn btn-secondary mt-2 btn-block">지점 추가</button>
			    </div>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
	$('#resultAddress').change(function() {
	    $('#addressId').val($(this).val());
	});
	
	$('#btnAddSel').click(function(){
		if ($('#addressId').val() == '' || $('#addressId').val() == null) {
			alert('주소를 선택해주세요');
		} else if ($('#managerStaffId').val() == '' || $('#managerStaffId').val() == null) {
			alert('스태프를 선택해주세요');
		} else {
			$('#storeForm').submit();
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