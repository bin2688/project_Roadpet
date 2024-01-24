<%@page import="java.util.ArrayList"%>
<%@page import="com.multi.roadpet.story.PetStoryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="../resources/css/mapservice.css">
<title>스토리 작성</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Script Setting -->
<script type="text/javascript" src="../resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1991e110a0fbe362aac08fce1f5fba8c"></script>

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="../resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="../resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="../resources/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/roadpet/resources/css/board.css">
</head>

<body>
			<%@ include file="/header.jsp"%>
			<%@ include file="/sidebar.jsp"%>
	<!-- 404 Start -->
	<div class="container-fluid pt-4 px-4">
		<div
			class="row vh-100 bg-light rounded align-items-center justify-content-center mx-0">
			<div class="col-md-6 text-center p-4">
				<i class="bi bi-exclamation-triangle display-1 text-primary"></i>
				<h1 class="display-1 fw-bold">완료!</h1>
				<h1 class="mb-4">스토리 수정 성공</h1>
				<a class="btn btn-primary rounded-pill py-3 px-5" href="PetStory_list">전체목록</a>
			</div>
		</div>
	</div>
	<!-- 404 End -->


</body>
</html>