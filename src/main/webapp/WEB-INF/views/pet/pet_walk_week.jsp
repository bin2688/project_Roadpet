<%@page import="java.util.ArrayList"%>
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
<style>
th {
font-size:17px;
color: orange;
}

</style>

</head>
<body>

<%
 ArrayList<PetWalkVO> list2 =(ArrayList<PetWalkVO>)request.getAttribute("list2");
for(PetWalkVO dto : list2){
%>

<div style="width:80%; margin:auto; border:2px solid black; margin-top:50px;">
<h3 style="color:green; text-align:center; margin-top:10px;"><%=dto.getPet_name() %></h3>
<table class="table" style="text-align:center;">
	<tr>
		<th>최근7일 평균시간</th>
		<th>최근7일 평균거리</th>
	</tr>
	<tr>
		<td><%=dto.getWalk_time() %>분</td>
		<td><%=dto.getWalk_distance() %>m</td>
	</tr>
	
	<tr>
	</tr>
	<tr>
		<td><%=dto.getWalk_date() %>위</td>
		<td><%=dto.getWalk_id() %>위</td>
	</tr>
	
</table>
</div>
<%} %>
	
	
	
	
</body>
</html>