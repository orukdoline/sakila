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
				<h1 class="sticky-top bg-white p-3">영화 상세정보</h1><br>
				
				<!-- 필름 상세정보 -->
				<!-- 필름 수정 : /on/modifyFilm -->
				<!-- 필름 삭제 : /on/removeFilm (film_category 삭제 + film_actor 삭제 + film 삭제)-->
				<!-- inventory 렌탈정보확인 + film_category 삭제 + film_actor 삭제 + film 삭제 -->
				<div class="container-fluid p-3">
					<h5 class="p-1">작품 정보</h5>
					<table class="table table-striped">
						<tr>
							<td>FilmID</td>
							<td>${film.filmId }</td>
						</tr>
						<tr>
							<td>Title</td>
							<td>${film.title}</td>
						</tr>
						<tr>
							<td>Description</td>
							<td>${film.description}</td>
						</tr>
						<tr>
							<td>ReleaseYear</td>
							<td>${film.releaseYear }</td>
						</tr>
						<tr>
							<td>RentalDuration</td>
							<td>${film.rentalDuration}</td>
						</tr>
						<tr>
							<td>RentalRate</td>
							<td>${film.rentalRate }</td>
						</tr>
						<tr>
							<td>Length</td>
							<td>${film.length }</td>
						</tr>
						<tr>
							<td>ReplacementCost</td>
							<td>${film.replacementCost }</td>
						</tr>
						<tr>
							<td>Rating</td>
							<td>${film.rating }</td>
						</tr>
						<tr>
							<td>SpecialFeatures</td>
							<td>${film.specialFeatures }</td>
						</tr>
						<tr>
							<td>OriginalLanguageId</td>
							<td>${film.originalLanguageId }</td>
						</tr>
						<tr>
							<td>Language</td>
							<td>${film.language }</td>
						</tr>
					</table>
					
					<div>
						<a href="${pageContext.request.contextPath}/on/modifyFilm?filmId=${film.filmId}" class="btn btn-primary">영화 수정</a>
						<a href="${pageContext.request.contextPath}/on/removeFilm?filmId=${film.filmId}" class="btn btn-primary">영화 삭제</a>
					</div>
				</div>
				
				
				<!-- 필름 카테고리 정보 -->
				<!-- 필름 카테고리 추가 : on/addFilmCategory -->
				<!-- 필름 카테고리 삭제 : on/removeFilmCategory -->
				
				<div class="container-fluid p-3">
					<h5 class="p-1">카테고리</h5>
					<div class="d-flex gap-3 overflow-auto" style="white-space: nowrap;">
						<form id="formFilmCategory" method="post" action="${pageContext.request.contextPath }/on/addFilmCategory"> <!-- 영화 카테고리 추가 -->
							<input type="hidden" name="filmId" value="${film.filmId }">
							<select name="categoryId" id="categoryId">
								<option value="">카테고리 선택</option>
								<c:forEach var="ac" items="${allCategoryList}">
									<option value="${ac.categoryId }">${ac.name }</option>
								</c:forEach>
							</select>
							<button id="btnFilmCategory" type="button">현재 카테고리 추가</button>
						</form>
						
						<!-- 영화 카테고리 리스트 model.filmCategoryList-->
						<div>
							<c:forEach var="fc" items="${filmCategoryList }">
								<div>
									${fc.name }
									&nbsp;
									<a href="${pageContext.request.contextPath }/on/removeFilmCategory?filmId=${fc.filmId}&categoryId=${fc.categoryId}">삭제</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				
				
				<!-- 출연배우 리스트 -->
				<!-- film_actor 추가 : on/addActorByFilm -->
				<!-- film_actor 삭제 : on/removeFileActor -->
				<div class="container-fluid p-3">
					<h5 class="p-1">작품에 출연한 배우들</h5>
					<div class="d-flex gap-3 overflow-auto" style="white-space: nowrap;">
						<form id="formSearchName" method="get" action="${pageContext.request.contextPath }/on/filmOne"> <!-- 배우이름 검색 -->
							<input type="hidden" name="filmId" value="${film.filmId }">
							<input type="text" name="searchName" id="searchName">
							<button id="btnSearchName" type="button">이름검색</button>
						</form>
						
						<!-- 선택상자 -->
						<div class="container mt-2">
							<form id="formFilmActor" method="post" action="${pageContext.request.contextPath}/on/addFilmActorByFilm">
								<input type="hidden" name="filmId" value="${film.filmId }">
							    <select id="actorId" name="actorId" class="form-select" size="6">
							        <c:forEach var="sa" items="${searchActorList}">
							            <option value="${sa.actorId}">${sa.actorId} ${sa.firstName } ${sa.lastName }</option>
							        </c:forEach>
							    </select>
							    <button id="btnFilmActor" type="button">출연배우추가</button>
							</form>
						</div>
									
						<c:forEach var="a" items="${actorList}">
							<div class="card" style="min-width:200px">
								<img class="card-img-top" src="${pageContext.request.contextPath }/image/defualtAvatar.png" alt="Card image">
								<div class="card-body d-flex flex-column justify-content-between">
								    <h6 class="card-title">${a.firstName} ${a.lastName}</h6>
								    <a href="${pageContext.request.contextPath}/on/actorOne?actorId=${a.actorId}" class="btn btn-primary mt-auto">프로필 보기</a>
								    <a href="${pageContext.request.contextPath}/on/removeFilmActorByFilm?actorId=${a.actorId}&filmId=${film.filmId}" class="btn btn-danger mt-auto">삭제</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</body>
<script>
	$('#btnFilmActor').click(function() {
		if ($('#actorId').val() == '' || $('#actorId').val() == null) {
			alert('actorId를 선택하세요');
		} else {
			$('#formFilmActor').submit();
		}
	});

	$('#btnFilmCategory').click(function() {
		if ($('#categoryId').val() == '') {
			alert('categoryId를 선택하세요');
		} else {
			$('#formFilmCategory').submit();
		}
	});
	
	$('#btnSearchName').click(function() {
		if($('#searchName').val() == '') {
			alert('검색이름을 입력하세요.');
		} else {
			$('#formSearchName').submit();
		}
	});
</script>
</html>