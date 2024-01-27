<%@page import="java.util.ArrayList"%>
<%@page import="com.multi.roadpet.pet.PetInfoVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<body style="text-align: center">

<a href="/roadpet/pet/pet_home.jsp">
<button class="btn btn-primary"> 이전 </button>
</a>
	<div class="bg-light rounded " style="width: 70%; margin: auto;">
		<c:forEach items="${list4}" var="vo">
			<div
				style="width: 70%; margin: auto; border: 2px solid black; margin-top: 50px;">
				<h3 style="color: green; text-align: center; margin-top: 20px;">${vo.pet_name}</h3>
				<table class="table" style="text-align: center;">
					<tr>
						<td style="width: 50%; color: orange;">날짜</td>
						<td>${vo.walk_date}</td>
					</tr>
					<tr>
						<td style="width: 50%; color: orange;">시간</td>
						<td>${vo.walk_distance}m</td>
					</tr>

					<tr>
						<td style="width: 50%; color: orange;">거리</td>
						<td>${vo.walk_time}분</td>
					</tr>

				</table>
			</div>
		</c:forEach>
	</div>
</body>
</html>