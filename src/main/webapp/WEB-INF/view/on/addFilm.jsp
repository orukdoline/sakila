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
				<h1 class="sticky-top bg-white p-3">영화 추가</h1><br>
				
				<form id="formAddFilm" method="post" action="${pageContext.request.contextPath }/on/addFilm">
					<table class="table" style="width:80%">
						<tr>
							<td colspan="2">필수 항목</td>
						</tr>
						<tr>
							<td>title</td>
							<td>
								<input type="text" id="title" name="title">
							</td>
						</tr>
						<tr>
							<td>languageId</td>
							<td>
								<select id="languageId" name="languageId">
									<option value="">언어선택</option>
									<c:forEach var="la" items="${languageList }">
										<option value="${la.languageId }">${la.name }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>rentalDuration</td>
							<td>
								<!-- DB기본값 : 3 -->
								<input type="number" id="rentalDuration" name="rentalDuration" value="3">
							</td>
						</tr>
						<tr>
							<td>rentalRate</td>
							<td>
								<!-- DB기본값 : 4.99 -->
								<input type="number" id="rentalRate" name="rentalRate" value="4.99">
							</td>
						</tr>
						<tr>
							<td>replacementCost</td>
							<td>
								<!-- DB기본값 : 19.99 -->
								<input type="number" id="replacementCost" name="replacementCost" value="19.99">
							</td>
						</tr>
						<tr>
							<td>rating</td>
							<td>
								<!-- DB기본값 : G, enum(G, PG, PG-13, R, NC-17) -->
								<input type="radio" name="rating" class="rating" value="G">G<br>
								<input type="radio" name="rating" class="rating" value="PG">PG<br>
								<input type="radio" name="rating" class="rating" value="PG-13">PG-13<br>
								<input type="radio" name="rating" class="rating" value="R">R<br>
								<input type="radio" name="rating" class="rating" value="NC-17">NC-17<br>
							</td>
						</tr>
					</table><br>
					
					<!-- 선택적 항목 -->
					<table class="table" style="width:80%">
						<tr>
							<td colspan="2">선택적 항목</td>
						</tr>
						<tr>
							<td>description</td>
							<td>
								<textarea rows="3" cols="50" id="description" name="description"></textarea>
							</td>
						</tr>
						<tr>
							<td>releaseYear</td>
							<td>
								<input type="number" id="releaseYear" name="releaseYear">
							</td>
						</tr>
						<tr>
							<td>originalLanguageId</td>
							<td>
								<select id="originalLanguageId" name="originalLanguageId">
									<option value="">오리지널언어선택</option>
									<c:forEach var="la" items="${languageList}">
										<option value="${la.languageId}">${la.name}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>length</td>
							<td>
								<input type="number" id="length" name="length">분
							</td>
						</tr>
						<tr>
							<td>specialFeatures</td>
							<td>
								<input type="checkbox" name="specialFeatures" class="specialFeatures" value="Trailers">Trailers<br>
								<input type="checkbox" name="specialFeatures" class="specialFeatures" value="Commentaries">Commentaries<br>
								<input type="checkbox" name="specialFeatures" class="specialFeatures" value="Deleted Scenes">Deleted Scenes<br>
								<input type="checkbox" name="specialFeatures" class="specialFeatures" value="Behind the Scenes">Behind the Scenes<br>
							</td>
						</tr>
					</table>
					<button id="btnAddFilm" type="button">필름추가</button>
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