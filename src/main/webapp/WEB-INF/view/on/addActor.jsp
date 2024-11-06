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
				<h1 class="sticky-top bg-white p-3">배우 추가</h1><br>
				
				<form id="formActor" method="post" action="${pageContext.request.contextPath }/on/addActor" enctype="multipart/form-data">
					<div>
						<table class = "table table-borderless">
							<tr>
								<td>
									<div class=" container input-group">
									  <span class="input-group-text">이름</span>
									  <input type="text" class="form-control" id="firstName" name="firstName" placeholder="이름">
									  <input type="text" class="form-control" id="lastName" name="lastName" placeholder="성">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div id = "fileDiv" class="m-2 p-1">
										<button type="button" id="btnAddFile" class="btn btn-primary btn-block">파일 추가</button>
										<button type="button" id="btnRemoveFile" class="btn btn-danger btn-block">파일 삭제</button>
									</div>
								</td>
								
							</tr>
						</table>
					</div>
					<div id = "fileDiv" class="d-grid container">
						<button type="button" id="btnAddActor" class="btn btn-secondary mt-2 btn-block">배우 추가</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

<script>
	$('#btnAddFile').click(function() {
		/* 자바스크립트 API
		let arr = $('.actorFile');
		arr.forEach(function(item, index) {
			
		});
		*/
		
		/* JQUERY API */
		
		if ($('input[name="actorFile"]').last().val() == '') {
			alert('첨부하지 않은 파일이 존재합니다.');
		} else {
			let html = '<div class="mt-2"><div class="input-group"><input type="file" class="form-control" name="actorFile" id="actorFile"></div></div>';
			$('#fileDiv').append(html);
		}
	});
	
	$('#btnRemoveFile').click(function() {
		if ($('input[name="actorFile"]').length == 0) { // class="actorFile" 없다
			alert('삭제할 파일이 없습니다.');
		} else {
			$('input[name="actorFile"]').last().remove();
		}
	});
	
	$('#btnAddActor').click(function() {
		if ($('#firstName').val() == '' || $('#lastName').val() == '') {
			alert('이름이 입력되지 않았습니다.');
		} else if ($('input[name="actorFile"]').last().val() == '' && $('input[name="actorFile"]').length > 0) {
			alert('첨부하지 않은 파일이 존재합니다.');
		} else {
			$('#formActor').submit();
		}
		
	});
	
</script>
</html>