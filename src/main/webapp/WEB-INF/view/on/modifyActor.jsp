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
				<h1 class="sticky-top bg-white p-3">배우 수정</h1><br>
				
				<div class="container">
						<table class = "table table-borderless">
							<tr>
								<td>
									<form id="formFirstName" method="post" action="${pageContext.request.contextPath }/on/modifyActor">
										<div class=" container input-group">
											<input type="hidden" name="actorId" value="${actor.actorId }">
											<span class="input-group-text">이름</span>
											<input type="text" class="form-control" id="firstName" name="firstName" value="${actor.firstName }">
											<button type="button" id="btnFirstName" class="btn btn-primary">수정</button>
										</div>
									</form>
									
								</td>
								<td>
									<form id="formLastName" method="post" action="${pageContext.request.contextPath }/on/modifyActor">
										<input type="hidden" name="actorId" value="${actor.actorId }">
										<div class=" container input-group">
										  <span class="input-group-text">성</span>
										  <input type="text" class="form-control" id="lastName" name="lastName" value="${actor.lastName }">
										  <button type="button" id="btnLastName" class="btn btn-primary">수정</button>
										</div>
									</form>
								</td>
							</tr>
						</table>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$('#btnFirstName').click(function() {
		if ($('#firstName').val() == '') {
			alert('이름을 입력해주세요.');
		} else {
			$('#formFirstName').submit();
		}
	})
	
	$('#btnLastName').click(function() {
		if ($('#lastName').val() == ''){
			alert('성을 입력해주세요.')
		} else {
			$('#formLastName').submit();
		}
	});
</script>
</html>