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
				<h1 class="sticky-top bg-white p-3">지점 리스트</h1><br>
				
				<table class="table">
					<tr>
						<td>StoreId</td>
						<td>ManagerStaff</td>
						<td>Address</td>
						<td>LastUpdate</td>
						<td></td>
					</tr>
					<c:forEach var="s" items="${storeListByMenu}">
						<tr>
							<td>${s.storeId }</td>
							<td>${s.firstName} ${s.lastName}</td>
							<td>${s.address}</td>
							<td>${s.lastUpdate}</td>
							<td><a href="${pageContext.request.contextPath }/on/storeOne?storeId=${s.storeId}" class="btn btn-primary btn-sm">상세보기</a>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>