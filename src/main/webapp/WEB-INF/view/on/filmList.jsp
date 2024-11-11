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
				<h1 class="sticky-top bg-white p-3">영화 목록</h1><br>
				
				<!-- 카테고리 선택 -->
				<form id="categoryForm" action="${pageContext.request.contextPath }/on/filmList" action="get">
					<select name="categoryId" id="categoryId">
						<option value="0">전체</option>
						<c:forEach var="c" items="${categoryList }">
							<c:if test="${c.categoryId == currentCategoryId }">
								<option selected value="${c.categoryId }">${c.name }</option>
							</c:if>
							<c:if test="${c.categoryId != currentCategoryId }">
								<option value="${c.categoryId }">${c.name }</option>
							</c:if>
						</c:forEach>
					</select>
				</form>
				<br>
				<table class="table">
					<tr>
						<td>filmId</td>
						<td>title</td>
						<td>releaseYear</td>
						<td>rentalDuration</td>
						<td>rentalRate</td>
						<td>length</td>
						<td>replacementCost</td>
						<td>ration</td>
					</tr>
					<c:forEach var="f" items="${filmList}"> <!-- filmList -->
							<tr>
								<td>${f.filmId }</td>
								<td>
									<a href="${pageContext.request.contextPath}/on/filmOne?filmId=${f.filmId}">
										${f.title}
									</a>
								</td>
								<td>${f.releaseYear }</td>
								<td>${f.rentalDuration }</td>
								<td>${f.rentalRate }</td>
								<td>${f.length }</td>
								<td>${f.replacementCost }</td>
								<td>${f.rating }</td>
							</tr>
					</c:forEach>
				</table>
				
				<!-- 페이징 관련 -->
				<div class="d-flex justify-content-between">
					<div>
						<c:if test="${currentPage > 1}">
							<a href="${pageContext.request.contextPath}/on/filmList?currentPage=1&categoryId=${currentCategoryId}">
								<button type="button" class="btn btn-outline-secondary btn-sm">처음페이지</button>
							</a>
							<a href="${pageContext.request.contextPath}/on/filmList?currentPage=${currentPage - 1}&categoryId=${currentCategoryId}">
								<button type="button" class="btn btn-outline-secondary btn-sm">이전페이지</button>
							</a>
						</c:if>
					</div>
					<div>
						<c:if test="${currentPage < lastPage}">
							<a href="${pageContext.request.contextPath}/on/filmList?currentPage=${currentPage + 1}&categoryId=${currentCategoryId}">
								<button type="button" class="btn btn-outline-secondary btn-sm">다음페이지</button>
							</a>
							<a href="${pageContext.request.contextPath}/on/filmList?currentPage=${lastPage}&categoryId=${currentCategoryId}">
								<button type="button" class="btn btn-outline-secondary btn-sm">마지막페이지</button>
							</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$('#categoryId').change(function() {
		$('#categoryForm').submit();
	});
</script>
</html>