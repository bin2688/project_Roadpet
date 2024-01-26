<%@page import="java.util.ArrayList"%>
<%@page import="com.multi.roadpet.pet.PetInfoVO"%>
<%@page import="com.multi.roadpet.story.PetStoryVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/roadpet/resources/css/style.css">
<!-- <link rel="stylesheet" href="/roadpet/resources/css/board.css"> -->
</head>
<body>
	<div class="row g-4">
		<div>
			<a href>전체보기</a>
		</div>
		<c:forEach items="${list2}" var="vo">

			<div class="col-sm-12 col-md-6 col-xl-4"
				style="display: inline-block;">
				<div class="h-100 bg-light rounded p-4">
					<div class="card">
						<div class="card-view">
							<div class="title">
								<h4 class="mb-0">${vo.story_title}</h4>
							</div>
							<div class="myinfo">
								<div
									class="d-flex align-items-center justify-content-right mb-2">
									<dl>
										<dt>날짜</dt>
										<dd>${vo.story_date}</dd>
									</dl>
									<dl>
										<dt>공개여부</dt>
										<dd>${vo.story_private}</dd>
									</dl>
								</div>
							</div>
							<div class="cont">
								<h3>
									<img src="../resources/upload/${vo.story_photo}" width="250"
										height="200">
								</h3>
								<h4>${vo.story_content}</h4>
							</div>
						</div>
					</div>
				</div>
			</div>

		</c:forEach>


	</div>

</body>
</html>

