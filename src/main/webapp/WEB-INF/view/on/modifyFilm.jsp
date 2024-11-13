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
				<h1 class="sticky-top bg-white p-3">영화 수정</h1><br>
				
				<form id="formAddFilm" method="post" action="${pageContext.request.contextPath }/on/modifyFilm">
					<table class="table" style="width:80%">
						<tr>
							<td colspan="2">필수 항목</td>
						</tr>
						<tr>
							<td>title</td>
							<td>
								<input type="text" id="title" name="title" value="${filmOne.title }">
							</td>
						</tr>
						<tr>
							<td>languageId</td>
							<td>
								<select id="languageId" name="languageId">
									<option value="">언어선택</option>
									<c:forEach var="la" items="${languageList}">
										<option value="${la.languageId}" <c:if test="${la.languageId == filmOne.languageId}">selected</c:if>>${la.name }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>rentalDuration</td>
							<td>
								<!-- DB기본값 : 3 -->
								<input type="number" id="rentalDuration" name="rentalDuration" value="${filmOne.rentalDuration }">
							</td>
						</tr>
						<tr>
							<td>rentalRate</td>
							<td>
								<!-- DB기본값 : 4.99 -->
								<input type="number" id="rentalRate" name="rentalRate" value="${filmOne.rentalRate }">
							</td>
						</tr>
						<tr>
							<td>replacementCost</td>
							<td>
								<!-- DB기본값 : 19.99 -->
								<input type="number" id="replacementCost" name="replacementCost" value="${filmOne.replacementCost }">
							</td>
						</tr>
						<tr>
							<td>rating</td>
							<!--  value="${filmOne.rating }" -->
							<td>
								<!-- DB기본값 : G, enum(G, PG, PG-13, R, NC-17) -->
								<input type="radio" name="rating" class="rating" value="G" <c:if test="${filmOne.rating == 'G'}">checked</c:if>>G<br>
								<input type="radio" name="rating" class="rating" value="PG" <c:if test="${filmOne.rating == 'PG'}">checked</c:if>>PG<br>
								<input type="radio" name="rating" class="rating" value="PG-13" <c:if test="${filmOne.rating == 'PG-13'}">checked</c:if>>PG-13<br>
								<input type="radio" name="rating" class="rating" value="R" <c:if test="${filmOne.rating == 'R'}">checked</c:if>>R<br>
								<input type="radio" name="rating" class="rating" value="NC-17" <c:if test="${filmOne.rating == 'NC-17'}">checked</c:if>>NC-17<br>
							</td>
						</tr>
					</table><br>
					
					<!-- 선택적 항목 -->
					<table class="table" style="width:80%">
						<!--  value="${filmOne.description}" -->
						<tr>
							<td colspan="2">선택적 항목</td>
						</tr>
						<tr>
							<td>description</td>
							<td>
								<textarea rows="3" cols="50" id="description" name="description">${filmOne.description }</textarea>
							</td>
						</tr>
						<tr>
							<td>releaseYear</td>
							<td>
								<input type="number" id="releaseYear" name="releaseYear" value="${filmOne.releaseYear.getYear() + 1900}">
								
							</td>
						</tr>
						<tr>
							<td>originalLanguageId</td>
							<td>
								<select id="originalLanguageId" name="originalLanguageId">
									<option value="">오리지널 언어선택</option>
									<c:forEach var="la" items="${languageList}">
										<option value="${la.languageId}" <c:if test="${la.languageId == filmOne.originalLanguageId }">selected</c:if>>${la.name}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>length</td>
							<td>
								<input type="number" id="length" name="length" value="${filmOne.length}">분
							</td>
						</tr>
						<!-- specialFeatures -->
						<tr>
							<td>specialFeatures</td>
							<td>
								<input type="checkbox" name="specialFeatures" class="specialFeatures" value="Trailers"
								       <c:forEach var="feature" items="${specialFeaturesArray}">
								           <c:if test="${feature == 'Trailers'}">checked</c:if>
								       </c:forEach>
								>Trailers<br>
								
								<input type="checkbox" name="specialFeatures" class="specialFeatures" value="Commentaries"
								       <c:forEach var="feature" items="${specialFeaturesArray}">
								           <c:if test="${feature == 'Commentaries'}">checked</c:if>
								       </c:forEach>
								>Commentaries<br>
								
								<input type="checkbox" name="specialFeatures" class="specialFeatures" value="Deleted Scenes"
								       <c:forEach var="feature" items="${specialFeaturesArray}">
								           <c:if test="${feature == 'Deleted Scenes'}">checked</c:if>
								       </c:forEach>
								>Deleted Scenes<br>
								
								<input type="checkbox" name="specialFeatures" class="specialFeatures" value="Behind the Scenes"
								       <c:forEach var="feature" items="${specialFeaturesArray}">
								           <c:if test="${feature == 'Behind the Scenes'}">checked</c:if>
								       </c:forEach>
								>Behind the Scenes<br>
							</td>
						</tr>
					</table>
					<button id="btnAddFilm" type="button">필름수정</button>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
	$('#btnAddFilm').click(function(){
		// 폼 유효성검사(제외 : description, releaseYear, originalLanguageId, length, specialFeatures)
		if ($('#title').val() == '') {
			alert('title을 입력하세요.');
		} else if ($("#languageId").val() == '') {
			alert('languageId를 입력하세요.');
		} else if ($.isNumeric($('#rentalDuration').val()) == false) {
			alert('rentalDuration에 숫자를 입력하세요.');
		} else if ($.isNumeric($('#rentalRate').val()) == false) {
			alert('rentalRate에 숫자를 입력하세요.');
		} else if ($.isNumeric($('#replacementCost').val()) == false) {
			alert('replacementCost에 숫자를 입력하세요.');
		} else if ($('.rating:checked').length == 0) {
			alert('rating을 선택하세요.');
		} else {
			$('#formAddFilm').submit();
		}
	});
</script>
</html>