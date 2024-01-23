<%@page import="com.multi.roadpet.lounge.LoungeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>로드펫 커뮤니티</title>
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
<script type="text/javascript">
	$(function() {
		$('.pages').click(function() {
			var pageNum = $(this).text();
			var dataForm = {
				page : pageNum,
				searchType : "${searchType}",
				keyWord : "${keyWord}"
			};
			$.ajax({
				url : "pageList",
				data : dataForm,
				success : function(table) {
					$('#result').html(table);
				}
			}) //ajax
		}) //.pages
	}) //$
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="content open">
			<%@ include file="/header.jsp"%>



			<!-- 검색  -->
			<div class="container mt-4">
				<h4 style="padding: 10px; text-align: center;">라운지 인기글</h4>
				<br>
				<div style="display: flex; flex-direction: row; gap: 20px;">
					<c:forEach items="${bestList}" var="vo">
						<div class="bg-light rounded"
							style="max-width: 200px; overflow: hidden; white-space: nowrap;">
							<div style="display: flex; gap: 20px;">
								<div>
									<span class="badge bg-warning">${vo.lounge_pet_type}</span>
								</div>
							</div>
							<a href="one?lounge_id=${vo.lounge_id}">
								<div>
									<h6 style="padding: 5px;">${vo.lounge_title}</h6>
								</div>
								<div style="display: flex; align-items: center; padding: 5px;">
									<div
										style="flex: 1; padding-right: 10px; overflow: hidden; text-overflow: ellipsis;">${vo.lounge_content}</div>
									<img alt="" src="../resources/upload/${vo.lounge_img}">
								</div>
							</a>
							<div style="display: flex; justify-content: space-between;">
								<div style="padding: 2px;">${vo.lounge_writer}</div>
								<div style="padding: 2px;">댓글: ${vo.lounge_replyCount}</div>
								<div style="padding: 2px;">
									<img alt="like" src="../resources/img/heartDefault.png">
									${vo.likeCount}
								</div>
								<div style="padding: 2px;">${vo.lounge_date}</div>
							</div>

						</div>
					</c:forEach>
				</div>
				<br>
				<h4 style="padding: 10px; text-align: center;">라운지</h4>
				<br>
				<form id="searchForm" action="list" method="get">
					<div class="search-wrap">
						<input type="hidden" name="page" value="1"> <select
							class="form-control search-select" name="searchType">
							<option value="all"
								<c:if test="${searchType == 'all'}">selected</c:if>>전체</option>
							<option value="titleContent"
								<c:if test="${searchType == 'titleContent'}">selected</c:if>>제목+내용</option>
							<option value="writer"
								<c:if test="${searchType == 'writer'}">selected</c:if>>작성자</option>
						</select> <input type="text" class="form-control search-input"
							name="keyWord" value="${keyWord}" placeholder="검색어를 입력해주세요.">
						<button id="submit" type="submit" class="btn btn-info search-btn">검색</button>
					</div>
				</form>
				<br>
				<div style="display: flex; justify-content: flex-end;">
					<a href="lounge_insert.jsp">
						<button type="button" class="btn btn-outline-danger m-2"
							id="insertType" aria-hidden="true">글쓰기</button>
					</a>
				</div>


				<!-- 게시글 목록 -->

				<div id="result">
					<c:forEach items="${list}" var="bag">
						<div class="bg-light rounded">
							<div style="display: flex; gap: 20px;">
								<div>
									<span class="badge bg-warning">${bag.lounge_pet_type}</span>
								</div>
							</div>
							<a href="one?lounge_id=${bag.lounge_id}">
								<div>
									<h6 style="padding: 5px;">${bag.lounge_title}</h6>
								</div>
								<div style="display: flex; align-items: center; padding: 5px;">
									<div style="flex: 1; padding-right: 10px; overflow: hidden; text-overflow: ellipsis;">${bag.lounge_content}</div>									
										<c:if test="${not empty bag.lounge_img}">
											<img alt="" src="../resources/upload/${bag.lounge_img}"
												width="80" height="80">
										</c:if>
								</div>
							</a>
							<div style="display: flex; justify-content: space-between;">
								<div style="padding: 5px;">${bag.lounge_writer}</div>
								<div style="padding: 5px;">댓글: ${bag.lounge_replyCount}</div>
								<div style="padding: 5px;">
									<img alt="like" src="../resources/img/heartDefault.png">
									${bag.likeCount}
								</div>
								<div style="padding: 5px;">${bag.lounge_date}</div>
							</div>
							<hr>
						</div>
					</c:forEach>
				</div>

				<!-- 페이징 -->
				<c:forEach begin="1" end="${pages}" var="p">
					<div class="btn-group me-2" role="group" aria-label="First group">
						<button class="btn btn-primary pages">${p}</button>
					</div>
				</c:forEach>
			</div>

			<!-- Table End -->


			<!-- Footer Start -->

			<!-- Footer End -->
		</div>
		<!-- Content End -->


		<!-- Back to Top -->
		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>

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