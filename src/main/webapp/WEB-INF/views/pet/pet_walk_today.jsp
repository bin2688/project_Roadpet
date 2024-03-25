<%@page import="java.util.ArrayList"%>
<%@page import="com.multi.roadpet.pet.PetWalkVO"%>

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

<%
 ArrayList<PetWalkVO> list =(ArrayList<PetWalkVO>)request.getAttribute("list");
 int count=0; 
for(PetWalkVO dto : list){
	 count++;
%>
	

<div style="width:70%; margin:auto; border:2px solid black; margin-top:50px;">
<h3 style="color:green; text-align:center; margin-top:20px;"><%=dto.getPet_name() %></h3>
<table class="table" style="text-align:center;">
	
	<tr>
	<td colspan=2 style="text-align:right;"><a href="/roadpet/pet/pet_walk_delete?walk_id=<%=dto.getWalk_id() %>">삭제</a></td>
	</tr>
	<tr>
		<td style="width:50%; color:orange;">날짜</td>
		<td><%=dto.getWalk_date() %></td>
	</tr>
	<tr>
		<td style="width:50%; color:orange;">시간</td>
		<td><%=dto.getWalk_time()%> 분</td>
	</tr>
	
	<tr>
		<td style="width:50%; color:orange;">거리</td>
		<td><%=dto.getWalk_distance()%> m</td>
	</tr>
	
</table>
</div>
<%} %>





	
</body>
</html>