<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<%@ include file="../sidebar.jsp"%>

<script type="text/javascript" src="/roadpet/resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript">

function getToday(){
	 var date = new Date();
	 var year = date.getFullYear();
	 var month = ("0" + (1+date.getMonth())).slice(-2);
	 var day = ("0" + date.getDate()).slice(-2);
	 
	 return year+month+day;
	 }
	 

 $(function() {
		$.ajax({
			url : "pet_info_list",
			success : function(x) {
				$("#all").html(x)
				$(".btn_pet").click(function() {	
					let clickValue = $(this).attr("id")
					$.ajax({
						url : "pet_info_one",
						data : {
							pet_id : clickValue
						},
						success : function(x) {	
							$("#result").html(x)
						}//success
					})//ajax
					
					$.ajax({
						url : "pet_walk_one",
						data : {
							pet_id : clickValue
						},
						success : function(x) {	
							$("#result3").html(x)
						}//success
					})//ajax	
				
					$.ajax({
						url : "pet_walk_watch.jsp",
						data : {
							
						},
						success : function(x) {	
							$("#result4").html(x)
						}//success
					})//ajax	
					$.ajax({
						url : "pet_walk_today",
						data : {
							walk_date :getToday()
						},
						success : function(x) {	
							$("#result5").html(x)
						}//success
					})//ajax	
				
				})//b1
				
				
			}//success
		})//ajax

	})//$
</script>
</head>

<body>
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
	<div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <h3 class="mb-0">마이펫 정보</h3>                    
                	<div id="all">
                	내 펫들이름 들어가는곳
                	</div>         
				<div id="result">마이펫 정보 들어가는곳</div>
	</div>	
    </div>
    
    <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <h3 class="mb-0">다이어리</h3>                    
                	      
				<div id="result2">다이어리 들어가는곳</div>
		</div>	
    </div>
		
			
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<h3 class="mb-0">산책기록</h3>

					<div id="result3">
			 			산책 강아지 이름,사진
					</div>
				</div>
			</div>
						
				
				<div style="float: left; width: 50%; height: 50%;">					
						<div class="h-100 bg-light rounded p-4">
							<h3>Today</h3>
							<div id="result4">스톱워치</div>
							<div id="result5">산책정보2</div>
						</div>		
				</div>
				
					
						
					<div style="float: left width:50%; height: 50%;">		
						<div class="h-100 bg-light rounded p-4">
							<h3>Week</h3>
						<div id="result6">주간정보</div>
						</div>			
					</div>

			
	
    	<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>
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