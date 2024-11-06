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
				<h1 class="sticky-top bg-white p-3">배우 리스트</h1><br>
				
				<div class="container">
					<form id="formSearch" action="${pageContext.request.contextPath }/on/actorList" method="get">
					<input type="text" name="searchWord" id="searchWord">
					<button id="btnSearch">이름검색</button>
				</form>
				</div>
				
				<div class="container">
					<table class="table">
						<tr>
							<td>actorId</td>
							<td>name</td>
						</tr>
						<c:forEach var="a" items="${actorList}">
							<tr>
								<td>${a.actorId}</td>
								<td>
									<a href="${pageContext.request.contextPath }/on/actorOne?actorId=${a.actorId}">
										${a.firstName } ${a.lastName }
									</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				
				<!-- 페이징 관련 -->
				<div class="d-flex justify-content-between">
					<div>
						<c:if test="${currentPage > 1}">
							<a href="${pageContext.request.contextPath}/on/actorList?currentPage=1&searchWord=${searchWord}">
								<button type="button" class="btn btn-outline-secondary btn-sm">처음페이지</button>
							</a>
							<a href="${pageContext.request.contextPath}/on/actorList?currentPage=${currentPage - 1}&searchWord=${searchWord}">
								<button type="button" class="btn btn-outline-secondary btn-sm">이전페이지</button>
							</a>
						</c:if>
					</div>
					<div>
						<c:if test="${currentPage < lastPage}">
							<a href="${pageContext.request.contextPath}/on/actorList?currentPage=${currentPage + 1}&searchWord=${searchWord}">
								<button type="button" class="btn btn-outline-secondary btn-sm">다음페이지</button>
							</a>
							<a href="${pageContext.request.contextPath}/on/actorList?currentPage=${lastPage}&searchWord=${searchWord}">
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
	$('#btnSearch').click(function() {
		if ($('#searchWord').val() == '') {
			alert('검색어를 입력하세요.');
			return;
		} else {
			$('#formSearch').submit();
		}
	});
</script>
</html>