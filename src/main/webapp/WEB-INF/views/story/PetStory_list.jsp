<%@page import="java.util.ArrayList"%>
<%@page import="com.multi.roadpet.story.PetStoryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>스토리 작성</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<style>
.search-wrap {
	display: flex;
	align-items: center;
	gap: 5px;
}

.search-wrap .search-select {
	flex: 0.8;
}

.search-wrap .search-input {
	flex: 2;
}

.search-wrap .search-btn {
	flex: 0.2;
}
</style>
<%@ include file="/sidebar.jsp"%>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="content open">
			<%@ include file="/header.jsp"%>
			<!-- 글 목록 -->
			<div class="container mt-4">
			<h4 style="padding: 10px; text-align: center;">펫 스토리</h4>
			<br>
			
			<%
				if (session.getAttribute("user_id") != null) {
			%>
			<!-- 로그인한 경우 -->
			<div style="display: flex; justify-content: flex-end;">
				<span class="alert alert-success"> <%=session.getAttribute("user_id")%>님
					환영합니다.
				</span> <a
					href="PetStory_insert.jsp?user_id=<%=session.getAttribute("user_id")%>">
					<button type="button" class="btn btn-outline-danger m-2"
						id="insertType" aria-hidden="true">글쓰기</button>
				</a>
			</div>
			<%
				} else {
			%>
			<!-- 로그인하지 않은 경우 -->
			<div style="display: flex; justify-content: flex-end;">
				<a href="/roadpet/member/login.jsp">
					<button type="button" class="btn btn-outline-danger m-2"
						style="float: right;">로그인 후 작성하기</button>
				</a>
			</div>
			<%
				}
			%>
			<!-- 스토리 목록 -->
				<div id="result">
				<c:forEach items="${list}" var="vo">
						<div class="bg-light rounded">
							<div style="display: flex; gap: 20px;">
								<div>
									<span class="badge bg-warning">${vo.story_id}</span>
								</div>
							</div>
							<a href="PetStory_one?story_id=${vo.story_id}">
								<div>
									<h6 style="padding: 5px;">${vo.story_title}</h6>
								</div>
								<div style="display: flex; align-items: center; padding: 5px;">
									<div style="flex: 1; padding-right: 10px; overflow: hidden; text-overflow: ellipsis;">${vo.story_content}</div>
									<img img src="../resources/upload/${vo.story_photo}" width="80" height="80">
								</div>
							</a>
							<div style="display: flex; justify-content: space-between;">
								<div style="padding: 2px;">${vo.user_id}</div>
								<div style="padding: 5px;">${vo.story_date}</div>
							</div>
						<hr>								
					</div>			
				</c:forEach>
			</div>
		</div>
			
				<!-- 페이징 -->
				<c:forEach begin="1" end="${pages}" var="p">
					<div class="btn-group me-2" role="group" aria-label="First group">
						<button class="btn btn-primary pages">${p}</button>
					</div>
				</c:forEach>
			</div>
		</div>
	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="../resources/lib/easing/easing.min.js"></script>
	<script src="../resources/lib/waypoints/waypoints.min.js"></script>
	<script src="../resources/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="../resources/lib/tempusdominus/js/moment.min.js"></script>
	<script src="../resources/lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script
		src="../resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Template Javascript -->
	<script src="../resources/js/main.js"></script>			

</body>

</html>