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
<body>
<div class="h-100 bg-light rounded p-4">
<div align="right">
<a href="/roadpet/pet/pet_info_insert.jsp">추가</a>
</div>

<c:forEach items="${all_list}" var="vo">
<button class="btn_pet" id="${vo.pet_id}" style="margin-right:50px;">
	<img class="petprofile" src="../resources/upload/${vo.pet_photo}" style="width:120px; height:120px; border-radius:70%; border: 3px solid gold;"  >
</button>

</c:forEach>


</div>

</body>
</html>