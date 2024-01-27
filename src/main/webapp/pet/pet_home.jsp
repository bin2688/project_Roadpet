<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<meta charset="UTF-8">
		
		<title>로드펫-펫 홈</title>		
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
	    <meta content="" name="keywords">
	    <meta content="" name="description">
		
		<!-- Script Setting -->
		<script type="text/javascript" src="../resources/js/jquery-3.7.1.js"></script>
   
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
	    

	<style>
@font-face {
    font-family: 'SOYOMapleBoldTTF';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/SOYOMapleBoldTTF.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
 
 	*{
 	font-family: 'SOYOMapleBoldTTF', serif;
 }

</style>


</head>

<body>
	<div class="container-fluid position-relative bg-white d-flex p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>

		<div class="content open">
	<%@ include file="../header.jsp"%>
	<%@ include file="../sidebar.jsp"%>
	
	<%
	if (session.getAttribute("user_id")!= null){
	%>
		<!--내 펫 리스트  -->
      
      
      <h2 style="padding: 10px; text-align: center; margin-top:40px; margin-bottom:40px;">
      <img src="/roadpet/resources/img/pwlogo.png" style="width:60px; height:60px; display:inline-block;">펫 정보</h2>  
      
      <br>
      <div class="bg-light rounded " style="width:80%; margin:auto;">
             <div class="row g-4" style="background-color:#F3F6F9;">               
                	<div id="all" style="background-color:#F3F6F9; width:70%; margin:auto; padding: 20px;">
                	내 펫들이름 들어가는곳
                	</div>         
				<div id="result" style="background-color:#F3F6F9; width:70%; margin:auto;"></div>			  
    		 	
    		 </div>
    	</div>
    <br><br>
    
    	<!--스토리  -->
    	<h2 style="padding: 10px; text-align: center; margin-top:40px; margin-bottom:40px;">
      <img src="/roadpet/resources/img/pslogo2.png" style="width:60px; height:60px; display:inline-block;">내 스토리</h2>
    	 <br>  
    <div class="bg-light rounded" style="width:80%; margin:auto;">
    	         <div style="background-color:#F3F6F9; margin:auto;" >
					<div id="result2" style="background-color:#F3F6F9; width:90%; margin:auto; padding: 20px;">다이어리 들어가는곳</div>
				</div>
			
	</div>
	
		<br><br>
  	 	
  	 	<!-- 산책 -->
  	 	
  	 	<h2 style="padding: 10px; text-align: center; margin-top:40px; margin-bottom:40px;">
      <img src="/roadpet/resources/img/petlogo.png" style="width:60px; height:60px; display:inline-block;">산책기록</h2>
  	 	<br>
  	 	
			<div class="bg-light rounded" style="width:80%; height:80%; margin:auto; ">
				<br><br>
					<div style="width: 50%; height: 50%; float:left; border-right: dotted 3px black">
					<h2 style="padding: 10px; text-align: center; margin-top:40px; margin-bottom:40px;">
      <img src="/roadpet/resources/img/1day.png" style="width:60px; height:60px; display:inline-block;">Today</h2>
					<div style="text-align:center">
						<input type="button" class="btn btn-primary" onclick="popup();"
							value="추가">	
						<a href="/roadpet/pet/my_walk_list?<%=session.getAttribute("user_id")%>">
						<button class="btn btn-primary">기록보기</button>
						</a>
					</div>
					<div id="result5">산책정보2</div>
					</div>

				<div style="width: 50%; height: 50%; float: right;">
					<h2
						style="padding: 10px; text-align: center; margin-top: 40px; margin-bottom: 40px;">
						<img src="/roadpet/resources/img/7day.png"
							style="width: 60px; height: 60px; display: inline-block;">Week
					</h2>
					<div id="result6">주간정보</div>

				</div>
			</div>
			

			<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>
		<%}else{%>
		<h4>상단에 로그인 해주세요.</h4>
		
		<%
		}
		%>	
			
   </div> 
 </div>
 
   <script type="text/javascript">

function getToday(){
	 var date = new Date();
	 var year = date.getFullYear();
	 var month = ("0" + (1+date.getMonth())).slice(-2);
	 var day = ("0" + date.getDate()).slice(-2);
	 
	 return year+month+day;
	 }
	 
function popup(){
    var url = "pet_walk_map.jsp";
    var name = "popup test";
    var option = "width = 800, height = 800, top = 100, left = 200, location = no"
    window.open(url, name, option);
	 window.close();
}


	 

 $(function() {
	 $.ajax({
			url : "pet_walk_today",
			data : {
				walk_date : getToday()
				 
			},
			success : function(x) {	
				$("#result5").html(x)
			}//success
		})//ajax	
		
		$.ajax({
			url : "pet_walk_week",
			data : {
										
			},
			success : function(x) {	
				$("#result6").html(x)
			}//success
		})//ajax	
	  
		$.ajax({
			url : "PetStory_list2",
			data : {
										
			},
			success : function(x) {	
				$("#result2").html(x)
			}//success
		})//ajax
		
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
					
					//$.ajax({
					//	url : "pet_walk_one",
					//	data : {
					//		pet_id : clickValue
					//	},
					//	success : function(x) {	
					//		$("#result3").html(x)
					//	}//success
					//})//ajax		
				})//b1
			}//success
		})//ajax

		
		
	})//$
</script>

</body>
</html>