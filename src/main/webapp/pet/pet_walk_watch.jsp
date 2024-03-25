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
    <link href="/roadpet/resources/css/project.css" rel="stylesheet">
	<script>
	let minutes = 0;
	let seconds = 0;
	let tenMillis = 0;
	let today = new Date();
	
	
	
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
		var tens = $('#tenMillis').text();
		var sec = $('#seconds').text();
		var min = $('#minutes').text();
		time= min;
		document.getElementById("walk_time").value = time;
		
		
		document.getElementById("walk_date").value = today.toISOString().substring(2,10);
		
		clearInterval(intervalId)
	}

	buttonReset.onclick = function(){
		clearInterval(intervalId)
		document.getElementById("walk_time").value = 0;
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
	<div class="watch-container">
		<h3>산책타이머</h3>
	
		<h2>
			<span id="minutes">00</span>분<span id="seconds">00</span>초<span
				id="tenMillis">00</span>
		</h2>
		<button id="bt__start">START</button>
		<button id="bt__stop">STOP</button>
		<button id="bt__reset">RESET</button><br><br>
		
        <h3 class="mb-4">산책 정보 입력</h3>
		
		<form action="pet_walk_insert" id="form" method="post"  enctype="multipart/form-data" name="walk_form">
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">1.펫 아이디</label> <input
					name="pet_id" class="form-control" id="exampleInputEmail1" value="${dto.pet_id}"
					placeholder="">
			</div>
			<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label" >2.산책 날짜</label>
			 <input name="walk_date" class="form-control" id="walk_date" >
			</div>
			<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">3.산책 거리</label>
			<input type="button" class="btn btn-primary" onclick="popup();" value="추가" >
			 <input name="walk_distance" class="form-control" id="walk_distance" placeholder="미터"><br>
					
			</div>
			<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">4.산책 시간</label> <input
					name="walk_time" class="form-control" id="walk_time" placeholder="분">
			</div>
			<div class="button-login-box">
				<button id="bt__ok" type="submit" class="btn btn-primary">등록</button>
			</div>
		</form>
		
	
	</div>

	<script src="/roadpet/resources/js/watch.js"></script>

</body>
</html>