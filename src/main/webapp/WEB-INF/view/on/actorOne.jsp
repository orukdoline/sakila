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
				<h1 class="sticky-top bg-white p-3">배우 상세정보</h1><br>
				
				<!-- 배우 상세정보 -->
				<!-- 배우 수정 : /on/modifyActor -->
				<!-- 배우 삭제 : /on/removeActor (actor_file 삭제 + film_actor 삭제 + actor 삭제)-->
				<div class="container-fluid p-3">
					<h5 class="p-1">배우 프로필</h5>
					<table class="table table-striped">
						<tr>
							<td>actorId</td>
							<td>${actor.actorId}</td>
						</tr>
						<tr>
							<td>firstName</td>
							<td>${actor.firstName}</td>
						</tr>
						<tr>
							<td>lastName</td>
							<td>${actor.lastName}</td>
						</tr>
						<tr>
							<td>lastUpdate</td>
							<td>${actor.lastUpdate}</td>
						</tr>
					</table>
					<div>
						<a href="${pageContext.request.contextPath }/on/modifyActor?actorId=${actor.actorId}" class="btn btn-primary mt-auto">배우수정</a>
						<a href="${pageContext.request.contextPath }/on/removeActor?actorId=${actor.actorId}" class="btn btn-primary mt-auto">배우삭제</a>
					</div>
				</div>
				
				<!-- 배우 파일정보 -->
				<!-- actor_file 삭제 : /on/removeActorFile-->
				<div class="container-fluid p-3">
					<h5 class="p-1">배우 관련파일</h5>
					<table class="table table table-striped">
						<tr>
							<td>image</td>
							<td>type</td>
							<td>size</td>
							<td>createDate</td>
							<td>menu</td>
						</tr>
						<tr>
							<c:forEach var="af" items="${actorFileList }">
								<td><img src="${pageContext.request.contextPath }/upload/${af.filename}.${af.ext}" download="${af.originname}.${af.ext}"></td>
								<td>${af.type}</td>
								<td>${af.size} Byte</td>
								<td>${af.createdate}</td>
								<td><a class="btn btn-primary" href="${pageContext.request.contextPath }/on/removeActorFile?actorFileId=${af.actorFileId}&actorId=${actor.actorId}">삭제</a></td>
							</c:forEach>
						</tr>
					</table>
					<div>
						<a href="${pageContext.request.contextPath}/on/addActorFile?actorId=${actor.actorId}" class="btn btn-primary mt-auto">이미지파일 추가</a>
					</div>
				</div>
				
				<div class="container-fluid p-3">
					<!-- 출연작품 추가 -->
					<h5 class="p-1">출연작품추가</h5>
					<div>
						<!-- 영화검색 -->
						<form id="formSearchFilm" method="get" action="${pageContext.request.contextPath }/on/actorOne">
							<input type="hidden" name="actorId" value="${actor.actorId }"> <!-- 필름 검색 시 actorId 같이 전송 -->
							<input type="text" name="searchTitle">
							<button id="btnSearchFilm" type="button" class="btn btn-primary">영화검색</button>
						</form>
						<form id="formAddFilm" method="post" action="${pageContext.request.contextPath }/on/addFilmByActor">
							<input type="hidden" name="actorId" value="${actor.actorId }"> <!-- 필름 검색 시 actorId 같이 전송 -->
							<select size="5" name="filmId">
								<c:forEach var="sf" items="${searchFilmList }">
									<option value="${sf.filmId }">${sf.title }</option>
								</c:forEach>
							</select>
							<button id="btnAddFilm" type="button" class="btn btn-primary">영화추가</button>
						</form>
					</div>
				</div>
					
				<div class="container-fluid p-3">
				<h5 class="p-1">출연작품</h5>
				<div class="d-flex flex-wrap gap-3 ">
					<c:forEach var="f" items="${filmList}">
						<div class="card" style="width:200px">
							<img class="card-img-top" src="${pageContext.request.contextPath }/image/defualtAvatar.png" alt="Card image">
							<div class="card-body">
								<h4 class="card-title">${f.title}</h4>
								<div class="d-flex flex-row">
									<a href="${pageContext.request.contextPath }/on/filmOne?filmId=${f.filmId }" class="btn btn-primary btn-sm">작품보기</a>&nbsp;
									<a href="${pageContext.request.contextPath }/on/removeFilmActor?filmId=${f.filmId}&actorId=${actor.actorId}" class="btn btn-danger btn-sm">작품삭제</a>
								</div>
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
	// film title 검색하는 버튼 
	$('#btnSearchFilm').click(function() {
		$('#formSearchFilm').submit();
	});
	
	// film 추가하는 버튼
	$('#btnAddFilm').click(function() {
		$('#formAddFilm').submit();
	});
</script>
</html>