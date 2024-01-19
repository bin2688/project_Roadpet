<%@page import="java.util.ArrayList"%>
<%@page import="com.multi.roadpet.story.PetStoryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>RoadPet</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<!-- core, fmt, functions, jquery, css가 실행될 수 있게끔 포함시킨 header.jsp 페이지 -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" type="text/css" media="all"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/roadpet/resources/lib/chart/chart.min.js"></script>
<script src="/roadpet/resources/lib/easing/easing.min.js"></script>
<script src="/roadpet/resources/lib/waypoints/waypoints.min.js"></script>
<script src="/roadpet/resources/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="/roadpet/resources/lib/tempusdominus/js/moment.min.js"></script>
<script
	src="/roadpet/resources/lib/tempusdominus/js/moment-timezone.min.js"></script>
<script
	src="/roadpet/resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Template Javascript -->
<script src="/roadpet/resources/js/main.js"></script>
<!-- Favicon -->
<link href="/roadpet/resources/img/favicon.ico" rel="icon">

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
<link
	href="/roadpet/resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="/roadpet/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="/roadpet/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->

<link rel="stylesheet" href="/roadpet/resources/css/style.css">


</head>

<body>

	<!-- nav -->
	<!-- Sidebar Start -->
	<div class="sidebar pe-4 pb-3">
		<nav class="navbar bg-light navbar-light">
			<a href="index.html" class="navbar-brand mx-4 mb-3">
				<h3 class="text-primary">
					<i class="fa fa-hashtag me-2"></i>RoadPet
				</h3>
			</a>
			<div class="d-flex align-items-center ms-4 mb-4">
				<div class="position-relative">
					<img class="rounded-circle" src="../resources/img/default.jpg"
						alt="" style="width: 40px; height: 40px;">
				</div>
				<div class="ms-3">
					<h6 class="mb-0">비회원</h6>
					<span>로그인 해주세요.</span>
				</div>
			</div>
			<div class="navbar-nav w-100">
				<a href="index.html" class="nav-item nav-link"><i
					class="fa fa-tachometer-alt me-2"></i>마이펫정보</a> <a href="#"
					class="nav-item nav-link"><i class="fa fa-laptop me-2"></i>커뮤니티</a>
				<a href="PetStory_list" class="nav-item nav-link"><i
					class="fa fa-keyboard me-2"></i>펫 스토리</a> <a href="widget.html"
					class="nav-item nav-link"><i class="fa fa-th me-2"></i>지도서비스</a>


			</div>
		</nav>
	</div>
	<!-- Content Start -->
	<div class="content">
		<!-- Navbar Start -->
		<nav
			class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
			<a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
				<h2 class="text-primary mb-0">
					<i class="fa fa-hashtag"></i>
				</h2>
			</a> <a href="#" class="sidebar-toggler flex-shrink-0"> <i
				class="fa fa-bars"></i>
			</a>
			<div class="navbar-nav align-items-center ms-auto">


				<div class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle"
						data-bs-toggle="dropdown"> <img class="rounded-circle me-lg-2"
						src="../resources/img/default.jpg" alt=""
						style="width: 40px; height: 40px;"> <span
						class="d-none d-lg-inline-flex">로그인 후 이용가능합니다.</span>
					</a>
					<div
						class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
						<a href="#" class="dropdown-item">My Profile</a> <a href="#"
							class="dropdown-item">Settings</a> <a href="#"
							class="dropdown-item">Log Out</a>
					</div>
				</div>
			</div>
		</nav>
		<!-- Navbar End -->

		<h6 class="mb-4"></h6>
		<div class="container">
			<c:forEach items="${list}" var="vo">
				<div class="story_list">
					<div class="card"
						style="border: 1px solid blue; float: left; width: 33%; padding: 10px;">
						<h4>NO.${vo.story_no}</h4>
						<div class="img">
							<img src="../resources/upload/${vo.story_photo}" width="200"
								height="200">
						</div>
						<div class="text">
							<h2>${vo.story_title}</h2>
							<p>${vo.story_content}</p>
							<button type="button" class="btn btn-primary m-2"
								onclick="location.href='PetStory_one?story_id=${vo.story_id}'">상세보기
							</button>
						</div>
					</div>
			</c:forEach>
		</div>
		<hr color="red">
	</div>
		

		<%
			int pages = (int) request.getAttribute("pages"); //int <-- object
		for (int p = 1; p <= pages; p++) {
		%>
		<a href="PetStory_list?page=<%=p%>&story_private=0">
			<button class="btn btn-primary pages"><%=p%></button>
		</a>
		<%
			}
		%>



	<!-- Content End -->
	<!-- Back to Top -->
	<button type="button" class="btn btn-primary m-2" style="float: right;"
		onclick="location.href='PetStory_insert.jsp'">글작성하기</button>


</body>

</html>

