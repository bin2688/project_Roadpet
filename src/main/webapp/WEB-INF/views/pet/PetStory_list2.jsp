<%@page import="java.util.ArrayList"%>
<%@page import="com.multi.roadpet.pet.PetInfoVO"%>
<%@page import="com.multi.roadpet.story.PetStoryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/roadpet/resources/css/style.css">
</head>
<body>
<div class="h-100 bg-light rounded p-4">
<div align="right">
펫스토리 페이지 
</div>
<%
 ArrayList<PetStoryVO> list2 =(ArrayList<PetStoryVO>)request.getAttribute("list2");
 for(PetStoryVO vo : list2){
%>
<h2>${vo.user_id}</h2>
<h2>${vo.story_date}</h2>
<h2>${vo.story_title}</h2>
<h2>${vo.story_content}</h2>
<h2>${v0.story_photo}</h2>


<%} %>

</div>

</body>
</html>

