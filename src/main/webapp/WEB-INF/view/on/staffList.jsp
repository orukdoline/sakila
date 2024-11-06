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
				<h1 class="sticky-top bg-white p-3">스태프 리스트</h1><br>
				
				<table class="table">
					<tr>
						<td>staffId</td>
						<td>firstName</td>
						<td>lastName</td>
						<td>addressId</td>
						<td>email</td>
						<td>storeId</td>
						<td>username</td>
						<td>lastUpdate</td>
						<td>active</td>
						<td>계정상태</td>
					</tr>
					<c:forEach var = "s" items = "${staffList}">
						<tr>
							<td>${s.staffId}</td>
							<td>${s.firstName}</td>
							<td>${s.lastName}</td>
							<td>${s.addressId}</td>
							<td>${s.email}</td>
							<td>${s.storeId}</td>
							<td>${s.username}</td>
							<td>${s.lastUpdate}</td>
							<td>${s.active}</td>
							<td>
								<a href="${pageContext.request.contextPath }/on/modifyStaffActive?staffId=${s.staffId}&active=${s.active}" class="btn btn-primary btn-sm">
									<c:if test="${s.active == 1}">휴먼계정 전환</c:if> <!-- 2로 변경 -->
									<c:if test="${s.active == 2}">일반계정 전환</c:if> <!-- 1로 변경 -->
								</a>
							</td>
						</tr>
					</c:forEach>
				</table>
				
				<!-- 페이징 관련 -->
				<div class="d-flex justify-content-between">
					<div>
						<c:if test="${currentPage > 1}">
							<a href="${pageContext.request.contextPath}/on/staffList?currentPage=1">
								<button type="button" class="btn btn-outline-secondary btn-sm">처음페이지</button>
							</a>
							<a href="${pageContext.request.contextPath}/on/staffList?currentPage=${currentPage - 1}">
								<button type="button" class="btn btn-outline-secondary btn-sm">이전페이지</button>
							</a>
						</c:if>
					</div>
					<div>
						<c:if test="${currentPage < lastPage}">
							<a href="${pageContext.request.contextPath}/on/staffList?currentPage=${currentPage + 1}">
								<button type="button" class="btn btn-outline-secondary btn-sm">다음페이지</button>
							</a>
							<a href="${pageContext.request.contextPath}/on/staffList?currentPage=${lastPage}">
								<button type="button" class="btn btn-outline-secondary btn-sm">마지막페이지</button>
							</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>