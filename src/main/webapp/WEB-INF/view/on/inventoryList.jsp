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
				<h1 class="sticky-top bg-white p-3">인벤토리 리스트</h1><br>
				
				<table class="table">
					<tr>
						<td>inventoryId</td>
						<td>(filmId)title</td>
						<td>lastUpdate</td>
						<td></td>
					</tr>
					<c:forEach var="iv" items="${inventoryList }">
						<tr>
							<td>${iv.inventoryId }</td>
							<td>
								<a href="${pageContext.request.contextPath}/on/filmOne?filmId=${iv.filmId}">
									(${iv.filmId}) ${iv.title}
								</a>
							</td>
							<td>${iv.lastUpdate }</td>
							<td>
								<a href="${pageContext.request.contextPath}/on/removeInventoryByKey?inventoryId=${iv.inventoryId}&storeId=${storeId}" class="btn btn-primary btn-sm">
									삭제
								</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>