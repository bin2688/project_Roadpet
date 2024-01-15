<%@page import="com.multi.roadpet.pet.PetWalkVO"%>
<%@page import="com.multi.roadpet.pet.PetInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
 <!-- Bootstrap JS (optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<!--model로 views/one.jsp까지 전달한 데이터를 받아 꺼내서 출력 -->
<%
	PetInfoVO dto = (PetInfoVO)request.getAttribute("dto");
%>
	 <div class="walk-top">
		<div class="h-100 bg-light rounded p-4">
			<table border=0>
			<tr>
				<td>
				<img class="petprofile" src="../resources/upload/${dto.pet_photo}" style="width:120px; height:120px; border-radius:70%; border: 3px solid gold;"  >
				</td>
				<td>
				<h3 >${dto.pet_name}</h3>
				</td>		
				</tr>
			</table>		
		</div>
		</div>
	
		
	
</body>
</html>