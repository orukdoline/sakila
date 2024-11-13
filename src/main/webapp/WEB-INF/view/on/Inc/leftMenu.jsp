<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="list-group sticky-top">
	<div class="text-center">
	<br>
		<h4>메인메뉴</h4>
	</div>
	<ul class="list-group">
	  <li class="list-group-item text-center">
	  	<a href="${pageContext.request.contextPath}/on/main">홈으로</a>
	  </li>
	  <li class="list-group-item text-center">
	  	<a href="${pageContext.request.contextPath}/on/staffOne">${loginStaff.username }님</a>
	  </li>
	  <li class="list-group-item text-center">
	  	<a href="${pageContext.request.contextPath}/on/logout">로그아웃</a>
	  </li>
	</ul><br>
	  
	<ul class="list-group">
	  <li class="list-group-item text-center list-group-item-secondary">::: 지점 관리 :::</li>
	  <li class="list-group-item text-center">
	  	<a href="${pageContext.request.contextPath}/on/storeList">지점 리스트</a>
	  	<!--  
	  		StoreMapper.selectStoreList() : List<Map> 타입으로 반환 - store x staff x address 조인 
	  		StoreService.getStoreList() : List<Map> 타입으로 반환
	  		GET /on/storeList -> StoreController.getStoreList() -> storeList.jsp
	  	 -->
	  </li>
	  <li class="list-group-item text-center">
	  	<a href="${pageContext.request.contextPath}/on/addStore">지점 추가</a>
	  	<!-- 
	  		GET - /on/addStore 
	  			- StoreController.addStore() : staffList 모델추가, search 주소검색결과 모델추가 - addStore.jsp
	  		StoreMapper.insertStore() : Integer
	  		StoreService.addStore() : Integer
	  		POST - /on/addStore - StoreController.addStore(Store)		
	  	 -->
	  </li>
	  <li class="list-group-item text-center">
	  	<a href="${pageContext.request.contextPath}/on/addInventory">인벤토리 추가</a>
	  </li>
	</ul><br>
	
	<ul class="list-group">
	  <li class="list-group-item text-center list-group-item-secondary">::: 스태프 관리 :::</li>
	  <li class="list-group-item text-center">
	  	<a href="${pageContext.request.contextPath}/on/staffList">스태프 리스트</a>
	  </li>
	  <li class="list-group-item text-center">
	  	<a href="${pageContext.request.contextPath}/on/addStaff">스태프 추가</a>
	  </li>
	</ul><br>
	  
	<ul class="list-group">
	  <li class="list-group-item text-center list-group-item-secondary">::: 고객 관리 :::</li>
	  <li class="list-group-item text-center">
	  	<a href="">고객 리스트</a>
	  </li>
	  <li class="list-group-item text-center">
	  	<a href="">고객 추가</a>
	  </li>
	</ul><br>
	
	<ul class="list-group">
	  <li class="list-group-item text-center list-group-item-secondary">::: 배우 관리 :::</li>
	  <li class="list-group-item text-center">
	  	<a href="${pageContext.request.contextPath}/on/actorList">배우 리스트</a>
	  </li>
	  <li class="list-group-item text-center">
	  	<a href="${pageContext.request.contextPath}/on/addActor">배우 추가</a>
	  </li>
	</ul><br>
	
	<ul class="list-group">
	  <li class="list-group-item text-center list-group-item-secondary">::: 영화 관리 :::</li>
	  <li class="list-group-item text-center">
	  	<a href="${pageContext.request.contextPath}/on/filmList">영화 리스트</a>
	  </li>
	  <li class="list-group-item text-center">
	  	<a href="${pageContext.request.contextPath}/on/addFilm">영화 추가</a>
	  </li>
	  <li class="list-group-item text-center">
	  	<a href="${pageContext.request.contextPath}/on/languageList">언어 리스트</a>
	  </li>
	  <li class="list-group-item text-center">
	  	<a href="${pageContext.request.contextPath}/on/addlanguage">언어 추가</a>
	  </li>
	  <li class="list-group-item text-center">
	  	<a href="${pageContext.request.contextPath}/on/categoryList">카테고리 리스트</a>
	  </li>
	  <li class="list-group-item text-center">
	  	<a href="${pageContext.request.contextPath}/on/addcategory">카테고리 추가</a>
	  </li>
	</ul><br>
	
	<ul class="list-group">
	  <li class="list-group-item text-center list-group-item-secondary">::: 기타 :::</li>
	  <li class="list-group-item text-center">
	  	<a href="${pageContext.request.contextPath}/on/actorList">통계</a>
	  </li>
	</ul><br>
</div>