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
	  	<a href="">지점 리스트</a>
	  </li>
	  <li class="list-group-item text-center">
	  	<a href="">지점 추가</a>
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
</div>