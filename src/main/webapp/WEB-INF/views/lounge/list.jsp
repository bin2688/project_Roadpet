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
<!-- Script Setting -->
<script type="text/javascript" src="../resources/js/jquery-3.7.1.js"></script>

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="../resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="../resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="../resources/css/style.css" rel="stylesheet">
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

#result div[style*="flex: 1;"] {
	font-size: 20px; /* 예시로 16px로 지정했으니 필요에 따라 조절하세요. */
}

#result div[style*="padding: 5px;"] {
	font-size: 20px; /* 예시로 14px로 지정했으니 필요에 따라 조절하세요. */
}
}
</style>


</head>
<body>
	<div class="container-fluid">
	<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->
	
		<div class="content open">
			<%@ include file="/header.jsp"%>
			<%@ include file="/sidebar.jsp"%>

			<!-- best list Start -->
			<div class="container mt-4">
				<h2 style="padding: 10px; text-align: center;">라운지 인기글</h2>
				<br>
				<div style="display: flex; flex-direction: row; gap: 20px;">
		   			<c:if test="${empty bestList}">
        				<div style="text-align: center;">최근 인기 게시글이 없습니다</div>
    				</c:if>
					<c:forEach items="${bestList}" var="vo">
						<div class="bg-light rounded"
							style="max-width: 400px; overflow: hidden; white-space: nowrap;">
							<div style="display: flex; gap: 20px;">
								<div>
									<span class="badge bg-warning">${vo.lounge_pet_type}</span>
								</div>
							</div>
							<a href="detail?lounge_id=${vo.lounge_id}">
								<div>
									<h5 style="padding: 5px; overflow: hidden; text-overflow: ellipsis;">${vo.lounge_title}</h5>
								</div>
								<div style="display: flex; align-items: center; padding: 5px;">
									<div
										style="flex: 1; padding-right: 10px; overflow: hidden; text-overflow: ellipsis;">${vo.lounge_content}</div>
									<c:if
										test="${not empty vo.lounge_img and vo.lounge_img ne null}">
										<img alt="" src="../resources/upload/${vo.lounge_img}"
											width="40" height="40">
									</c:if>

								</div>
							</a>
							<div style="display: flex; justify-content: space-between;">
								<div style="flex: 1; padding: 10px;">${vo.lounge_writer}</div>
								<div style="flex: 1; padding: 10px;">댓글:
									${vo.lounge_replyCount}</div>
								<div style="flex: 1; padding: 10px;">
									 <c:choose>
					                    <c:when test="${vo.likeState == 1}">
					                        <img alt="like" src="../resources/img/heart-On.png">${vo.likeCnt}
					                    </c:when>
					                    <c:otherwise>
					                        <img alt="like" src="../resources/img/heart-Off.png">${vo.likeCnt}
					                    </c:otherwise>
					                </c:choose>	
								</div>
								<div style="flex: 1; padding: 7px;">${vo.lounge_date}</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<br> <br> <br>

				<!-- lounge Start -->
				<h2 style="padding: 10px; text-align: center;">라운지</h2>
				<br>
				<form id="searchForm" action="list" method="get">
					<div class="search-wrap">
						<input type="hidden" name="page" value="1"> 
						<select class="form-control search-select" name="searchType">
							<option value="all"<c:if test="${searchType == 'all'}">selected</c:if>>전체</option>
							<option value="titleContent"<c:if test="${searchType == 'titleContent'}">selected</c:if>>제목+내용</option>
							<option value="writer"<c:if test="${searchType == 'writer'}">selected</c:if>>작성자</option>
						</select> 
						<input type="text" class="form-control search-input"
							name="keyWord" value="${keyWord}" placeholder="검색어를 입력해주세요.">
						<button id="submit" type="submit" class="btn btn-info search-btn">검색</button>
					</div>
				</form>
				<br>

				<c:choose>
					<c:when test="${sessionScope.user_id != null}">
						<!-- 로그인 한 경우 -->
						<div style="display: flex; justify-content: flex-end;">
							<a href="lounge_insert.jsp?user_id=${sessionScope.user_id}">
								<button type="button" class="btn btn-outline-danger m-2" id="insertType" aria-hidden="true">글쓰기</button>
							</a>
						</div>
					</c:when>
					<c:otherwise>
						<!-- 로그인하지 않은 경우 -->
						<div style="display: flex; justify-content: flex-end;">
							<a href="/roadpet/member/login.jsp">
							 <button type="button" class="btn btn-outline-danger m-2" id="insertType" aria-hidden="true">로그인 후 글쓰기</button>
							</a>
						</div>
					</c:otherwise>
				</c:choose>


				<!-- lounge list Start -->
				<div id="result">
					<c:forEach items="${list}" var="bag">
						<div class="bg-light rounded">
							<div style="display: flex; gap: 20px;">
								<div>
									<span class="badge bg-warning">${bag.lounge_pet_type}</span>
								</div>
							</div>
							<a href="detail?lounge_id=${bag.lounge_id}">
								<div>
									<h5
										style="padding: 6px; overflow: hidden; text-overflow: ellipsis;">${bag.lounge_title}</h5>
								</div>
								<div style="display: flex; align-items: center; padding: 5px;">
									<div
										style="flex: 1; padding-right: 10px; overflow: hidden; text-overflow: ellipsis;">${bag.lounge_content}</div>
									<c:if
										test="${not empty bag.lounge_img and bag.lounge_img ne null}">
										<img alt="" src="../resources/upload/${bag.lounge_img}"
											width="80" height="80">
									</c:if>
								</div>
							</a>
							<div style="display: flex; justify-content: space-between;">
								<div style="flex: 1; padding: 5px;">${bag.lounge_writer}</div>
								<div style="flex: 1; padding: 5px;">댓글:
									${bag.lounge_replyCount}</div>
								<div style="flex: 1; padding: 5px;">
								 <c:choose>
					                    <c:when test="${bag.likeState == 1}">
					                        <img alt="like" src="../resources/img/heart-On.png">${bag.likeCnt}
					                    </c:when>
					                    <c:otherwise>
					                        <img alt="like" src="../resources/img/heart-Off.png">${bag.likeCnt}
					                    </c:otherwise>
					                </c:choose>	

								</div>
								<div style="flex: 1; padding: 1px;">${bag.lounge_date}</div>
							</div>
							<hr>
						</div>
					</c:forEach>
				</div>

				<!-- paging-->
				<c:forEach begin="1" end="${pages}" var="p">
					<div class="btn-group me-2" role="group" aria-label="First group">
						<button class="btn btn-primary pages">${p}</button>
					</div>
				</c:forEach>
			</div>
			<!-- lounge list End -->

		</div>
		<!-- Content End -->


		<!-- Back to Top -->
		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>

	</div>
	<script type="text/javascript">
		//paging 처리 함수
		$(function() {
			$('.pages').click(function() {
				let pageNum = $(this).text();
				let dataForm = {
					page : pageNum,
					searchType : "${searchType}",
					keyWord : "${keyWord}"
				};
				$.ajax({
					url : "pageList",
					data : dataForm,
					success : function(table) {
						$('#result').html(table);
					},
					error : function(response) {
					console.log(response)
					}
				}) //ajax
			}) //.pages
		}) //$
	</script>
</body>

</html>