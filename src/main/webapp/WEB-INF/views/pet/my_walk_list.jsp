<%@page import="java.util.ArrayList"%>
<%@page import="com.multi.roadpet.pet.PetInfoVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/roadpet/resources/css/style.css">
</head>
<body style="text-align:center">
<div class="h-100 bg-light rounded p-4">
<div align="right">
</div>

<c:forEach items="${list4}" var="vo">
<div class="d-flex align-items-center border-bottom py-3">
				<div class="w-100 ms-3">
					<div class="d-flex w-100 justify-content-between">
						<span style="color:blue;border:2px;font-size:20px;">${vo.pet_name}</span>
						<br>
					</div>
				</div>		
</div>
<br>

<table style="border-spacing: 10px 10px;" align=center width=400px height=50px>
	<th>날짜</th>
	<th>거리</th>
	<th>시간</th>
	<tr>
		<td>${vo.walk_date}</td>
		<td>${vo.walk_distance}m</td>
		<td> ${vo.walk_time}분</td>
	</tr>
</table>
<br>
<hr style="width:40%;">
</c:forEach>

</body>
</html>