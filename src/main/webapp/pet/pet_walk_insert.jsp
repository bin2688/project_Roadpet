<%@page import="com.multi.roadpet.pet.PetWalkVO"%>
<%@page import="com.multi.roadpet.pet.PetWalkDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
    <title>DASHMIN - Bootstrap Admin Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
	<%@ include file="../sidebar.jsp"%>
	<script>
	let minutes = 0;
	let seconds = 0;
	let tenMillis = 0;

	const appendTens = document.getElementById("tenMillis");
	const appendSeconds = document.getElementById("seconds");
	const appendMinutes = document.getElementById("minutes");
	const buttonStart = document.getElementById("bt__start");
	const buttonStop = document.getElementById("bt__stop");
	const buttonReset = document.getElementById("bt__reset");
	let intervalId;

	buttonStart.onclick = function(){
		clearInterval(intervalId)
		intervalId = setInterval(operateTimer,10)
	}

	buttonStop.onclick = function(){
		document.getElementById("walk_time").value = appendTens+appendSeconds+appendMinutes;
		alert(appendTens+appendSeconds+appendMinutes)
		clearInterval(intervalId)
	}

	buttonReset.onclick = function(){
		clearInterval(intervalId)
		tenMillis =0; seconds =0; minutes =0;
		appendTens.textContent = "00"
		appendSeconds.textContent = "00"
		appendMinutes.textContent = "00"
	}


	function operateTimer(){
		tenMillis++;
		appendTens.textContent = tenMillis > 9 ? tenMillis : '0' +tenMillis
		if(tenMillis > 99){
		seconds++;
		appendSeconds.textContent = seconds > 9 ? seconds : '0' +seconds
		tenMillis = 0
		appendTens = "00"
		}
		if(seconds > 59){
		minutes++;
		appendMinutes.textContent= minutes > 9 ? minutes : '0' +minutes
		seconds = 0
		appendSeconds.textContent = "00"
		}
		
		
	}
	
	</script>

</head>
<body>
	<%
	PetWalkVO dto = (PetWalkVO)request.getAttribute("dto");
	%>
	alert(${dto.pet_id})
	<div class="container-xxl position-relative bg-white d-flex p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
	<div class="content">
	<%@ include file="../header.jsp"%>
   <div class="bg-light rounded h-100 p-4">
        <h3 class="mb-4">산책 정보 입력</h3>
		
		<form action="pet_walk_insert" id="form" method="post"  enctype="multipart/form-data" name="walk_form">
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">1.펫 아이디</label> <input
					name="pet_id" class="form-control" id="exampleInputEmail1" value="${dto.pet_id}"
					aria-describedby="emailHelp">
			</div>
			<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">2.산책 날짜</label> <input
					name="walk_date" class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp">
			</div>
			<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">3.산책 거리</label> <input
					name="walk_distance" class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp">
			</div>
			<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">4.산책 시간</label> <input
					name="walk_time" class="form-control" id="walk_time"
					aria-describedby="emailHelp">
			</div>
			<div class="button-login-box">
				<button type="submit" class="btn btn-primary">완료</button>
			</div>
		</form>
		</div>
		</div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="../resources/lib/chart/chart.min.js"></script>
	<script src="../resources/lib/easing/easing.min.js"></script>
	<script src="../resources/lib/waypoints/waypoints.min.js"></script>
	<script src="../resources/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="../resources/lib/tempusdominus/js/moment.min.js"></script>
	<script
		src="../resources/lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script
		src="../resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Template Javascript -->
	<script src="../resources/js/main.js"></script>
	
</body>
</html>