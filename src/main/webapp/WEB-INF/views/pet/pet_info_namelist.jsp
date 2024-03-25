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
<div style="margin:20px;">
<c:forEach items="${list}" var="vo">
<input type="radio" value="${vo.pet_name}" name="pet_name" class="form-check-input">
<label class="form-check-label">${vo.pet_name}</label>
</c:forEach>

</div>

</body>
</html>