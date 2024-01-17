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
</head>
<body>

<%
 ArrayList<PetWalkVO> list2 =(ArrayList<PetWalkVO>)request.getAttribute("list2");
for(PetWalkVO dto : list2){
%>
<!--model로 views/one.jsp까지 전달한 데이터를 받아 꺼내서 출력 -->
<div class="week-div" style="flex-direction: column;">
<div class="d-flex align-items-center border-bottom py-3">				
				
				<div class="w-100 ms-3"style="flex-direction: column;" >
						<span><h4 class="mb-0"><%=dto.getPet_name() %></h4></span>
				
				</div>		
				<div class="w-100 ms-3" style="flex-direction: column;">
						<h4>최근 7일 평균 시간</h4>
						<h4 class="mb-0" style="color:orange;"> <%=dto.getWalk_time() %>분</h4><br><br>
				
						<h4>산책 랭킹</h4>
						<h4 class="mb-0" style="color:orange;"> <%=dto.getWalk_date() %>위</h4><br><br>
				</div>	
				<div class="w-100 ms-3" style="flex-direction: column;">
						<h4>최근 7일 평균 거리</h4>
						<h4 class="mb-0" style="color:orange;"> <%=dto.getWalk_distance() %>m</h4><br><br>
				
						<h4>거리 랭킹</h4>
						<h4 class="mb-0" style="color:orange;"> <%=dto.getWalk_id() %>위</h4><br><br>
				</div>		
</div>	
</div>

<br>
<%} %>
	
</body>
</html>