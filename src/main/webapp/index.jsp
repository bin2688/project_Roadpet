<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="../resources/css/mapservice.css">
		<title>로드펫 메인페이지</title>		
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
	    <meta content="" name="keywords">
	    <meta content="" name="description">
		
		<!-- Script Setting -->
		<script type="text/javascript" src="../resources/js/jquery-3.7.1.js"></script>
    	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1991e110a0fbe362aac08fce1f5fba8c"></script>
   	    
	    <!-- Google Web Fonts -->
	    <link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
	    
	    <!-- Icon Font Stylesheet -->
	    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
	
	    <!-- Libraries Stylesheet -->
	    <link href="../resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
	    <link href="../resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
	
	    <!-- Customized Bootstrap Stylesheet -->
	    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
	
	    <!-- Template Stylesheet -->
	    <link href="../resources/css/style.css" rel="stylesheet">
	
	
	</head>

<body>

	<div class="container-fluid position-relative bg-white d-flex p-0">
		<div id="spinner"
			class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>

		<div class="content open">

				<!-- Navbar & Sidebar -->
				<%@ include file="../header.jsp"%>
				<%@ include file="../sidebar.jsp"%>
		
		<!--홈페이지 로고(이름,설명칸 )-->
		<div class="container-fluid pt-4 px-4">
		<h1 style="text-align:center; color: blue;"> RoadPet </h1><br>
		<h4 style="text-align:center;"> 반려동물의 기록을 작성하고 정보를 공유하는 커뮤니티</h4>
		</div>
		
		
		<!--홈페이지 메뉴칸  -->
		<div class="container-fluid pt-4 px-4">
			<div class="row g-4" style="width:80%; margin:auto;" >
				<div class="col-sm-6 col-xl-3">
					<div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
						<a href="/roadpet/pet/pet_home.jsp">
						<img src="/roadpet/resources/img/mypet_logo.png">
						</a>
						<div class ="ms-3" style="text-align:center;">
						<h4 class="mb-0">마이 펫</h4><br>
						<h6 class="mb-0">반려동물을 등록하고 나의 펫 정보 보기,산책기록 등의 서비스를 이용할 수 있어요.</h6>
						</div>
					</div>
				</div>
			<div class="col-sm-6 col-xl-3">
					<div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
						<a href="/roadpet/story/PetStory_list?page=1&story_private=0">
						<img src="/roadpet/resources/img/storylogo2.png">
						</a>
						<div class ="ms-3" style="text-align:center;">
						<h4 class="mb-0">펫 스토리</h4><br>
						<h6 class="mb-0">나와 반려동물의 일상을 올려 다른 사람과 공유하고 공감할 수 있어요.</h6>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-xl-3">
				<a href="/roadpet/lounge/list?page=1">
					<div class="bg-light rounded d-flex align-items-center justify-content-between p-4">					
						<img src="/roadpet/resources/img/community_logo.png">						
						<div class ="ms-3" style="text-align:center;">						
						<h4 class="mb-0">펫 커뮤니티</h4><br>
						<h6 class="mb-0">반려동물에 대한 정보나 그 외의 여러가지 정보를 공유할 수 있어요.</h6>

						</div>
					
					</div>
					</a>
				</div>
				<div class="col-sm-6 col-xl-3">
					<div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
						<a href="/roadpet/map/mapservice_home.jsp">
						<img src="/roadpet/resources/img/map_logo.png">
						</a>
						<div class ="ms-3" style="text-align:center;">
						<h4 class="mb-0">펫 지도</h4><br>
						<h6 class="mb-0">동물병원,보호소 위치정보를 제공하고 실종동물정보를 등록하고 공유할 수 있어요 .</h6>

						</div>
					</div>

				</div>
			</div>

			<!--최근 커뮤니티 글  -->
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4" style="width: 80%; margin: auto;">
					<div class="bg-light text-center rounded p-4">
						<div
							class="d-flex align-items-center justify-content-between mb-4">
							<a href="/roadpet/lounge/list?page=1">
							<h2 style="padding: 10px; text-align: center; margin-top:20px; margin-bottom:20px;">
      <img src="/roadpet/resources/img/index_community.png" style="width:60px; height:60px; display:inline-block;">인기 커뮤니티글</h2>
							</a>
						</div>

						<div id="main_result1" style="text-align: left;">
							<div style="display: flex; flex-direction: row; gap: 25px;">
							<div id="result"></div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="container-fluid pt-4 px-4">
				<div class="row g-4" style="width: 80%; margin: auto;">
					<div class="bg-light text-center rounded p-4">
						<div
							class="d-flex align-items-center justify-content-between mb-4">
							<h2 style="padding: 10px; text-align: center; margin-top:20px; margin-bottom:20px;">
      <img src="/roadpet/resources/img/pslogo2.png" style="width:60px; height:60px; display:inline-block;">최근 스토리</h2>
							<a href="">자세히 보기</a>
						</div>
						<div id="main_result2" style="text-align: left;">
							<h5>스토리 리스트</h5>
						</div>
					</div>
				</div>
			</div>

			<div class="container-fluid pt-4 px-4">
				<div class="row g-4" style="width: 80%; margin: auto;">
					<div class="bg-light text-center rounded p-4">

						<div class="d-flex align-items-center justify-content-between mb-4">
						<h2 style="padding: 10px; text-align: center; margin-top:20px; margin-bottom:20px;">
      				<img src="/roadpet/resources/img/crown.png" style="width:60px; height:60px; display:inline-block;">산책왕</h2>  
						<h6>* 시간 기준 랭킹이며 최근 7일 기록을 기준으로 산정합니다.</h6>				
						</div>	
						<div id="main_result3">
										
						</div>		

					</div>
				</div>
			</div>

			<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i

			class="bi bi-arrow-up"></i></a>

	</div>
	</div>
	</div>	
			

	<script>
		
	window.onload = function() {
	
	}

	
		$(function() {
			$.ajax({
				url : "pet/all_walk_week",
				success : function(x) {
					$("#main_result3").html(x)
				}//success
			})//ajax	

			$.ajax({
				url : "lounge/bestList",
				success : function(response) {
					console.log(response)
					$("#result").append(response)
				},//success
				error : function(){
					console.log("error")
				}
				
			})//ajax
		})
				
	</script>
	<%@ include file="../footer.jsp"%>
</body>
</html>