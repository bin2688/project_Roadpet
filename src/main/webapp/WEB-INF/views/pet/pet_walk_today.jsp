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
	<hr color="blue">
<!--model로 views/one.jsp까지 전달한 데이터를 받아 꺼내서 출력 -->

<div class="d-flex align-items-center border-bottom py-3">
				<div class="w-100 ms-3">
					<div class="d-flex w-100 justify-content-between">
						<span style="color:blue;border:2px;font-size:20px;"><%=dto.getPet_name() %></span>
						
					</div>
				</div>		
</div>

<div class="d-flex align-items-center border-bottom py-3">
				<div class="w-100 ms-3">
					<div class="d-flex w-100 justify-content-between">
						<span>날짜</span>
						<h6 class="mb-0"> <%=dto.getWalk_date() %></h6>
					</div>
				</div>		
</div>
<div class="d-flex align-items-center border-bottom py-3">
				<div class="w-100 ms-3">
					<div class="d-flex w-100 justify-content-between">
						<span>거리</span>
						<h6 class="mb-0"> <%=dto.getWalk_distance()%>m</h6>
					</div>
				</div>		
</div>
<div class="d-flex align-items-center border-bottom py-3">
				<div class="w-100 ms-3">
					<div class="d-flex w-100 justify-content-between">
						<span>시간</span>
						<h6 class="mb-0"> <%=dto.getWalk_time()%> 분</h6>
					</div>
				</div>		
</div>	
<br><br>
<%} %>
	
</body>
</html>