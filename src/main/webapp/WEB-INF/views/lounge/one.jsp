<%@page import="com.nimbusds.oauth2.sdk.ciba.CIBASignedRequestClaimsSet"%>
<%@page import="java.awt.print.Printable"%>
<%@page import="com.multi.roadpet.lounge.LoungeVO"%>
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
<%@ include file="/sidebar.jsp"%>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<style>
.result div[style*="flex: 1;"] {
        font-size: 20px; /* 예시로 16px로 지정했으니 필요에 따라 조절하세요. */
    }

.bg-light rounded div[style*="padding: 5px;"] {
        font-size: 20px; /* 예시로 14px로 지정했으니 필요에 따라 조절하세요. */
    }
</head>
</style>
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
			<div class="container-fluid pt-4 px-4">
			<c:if test="${sessionScope.user_id != null && sessionScope.user_id == bag.user_id}">				
				<div style="display: flex; justify-content: flex-end;">
					<a href="update?lounge_id=${bag.lounge_id}">
						<button class="btn btn-primary w-20 m-2" type="submit">글수정</button>
					</a>
					<form action="delete">
						<button class="btn btn-primary w-20 m-2" name="lounge_id"
							value="${bag.lounge_id}">글삭제</button>
					</form>
				</div>
			</c:if>

				<div class="bg-light rounded">
					<div style="display: flex; gap: 20px;">
						<div>
							<span class="badge bg-warning">${bag.lounge_pet_type}</span>
						</div>
					</div>
					<div>
						<h3 style="padding: 5px;">${bag.lounge_title}</h3>
					</div>
					<hr>
					<div
						style="padding: 10px 20px;  max-height: 200px; overflow-y: auto;">${bag.lounge_content}</div>
					<img alt="" src="../resources/upload/${bag.lounge_img}"> <br>
					<!--썸네일 추가할부분-->
					<div style="display: flex; justify-content: space-between;">
						<div style="padding: 5px;">${bag.lounge_writer}</div>
						<div style="padding: 1px;">

							<div id="replyCount">댓글: ${bag.lounge_replyCount}</div>
						</div>
						<div style="padding: 5px;">
							<c:choose>
								<c:when test="${sessionScope.user_id != null}">
									<div class="likeClick" style="text-align: center;">
										<c:choose>
											<c:when test="${likeCheck.likeState eq 'off'}">
												<img id="likeImg" style="display: inline-block;" alt="like"
													src="../resources/img/heartDefault.png">
											</c:when>
											<c:otherwise>
												<img id="likeImg" style="display: inline-block;" alt="like"
													src="../resources/img/heartOn.png">
											</c:otherwise>
										</c:choose>
										<div id="b1" style="display: inline-block;">${bag.likeCnt}</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="" style="text-align: center;" onclick="handleLikeClick()">
										<img id="likeImg" style="display: inline-block;" alt="like"
											src="../resources/img/heartDefault.png">
										<div id="b1" style="display: inline-block;">${bag.likeCnt}</div>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
						<div style="padding: 5px;">${bag.lounge_date}</div>
					</div>
					<hr>
				</div>
			</div>
			<br>
			<div class="container-fluid pt-4 px-4">
				<form action="rpInsert">
					<div class="input-group mb-3" style="text-align: center">
						<textarea id="reply" name="reply_content"
							style="display: inline-block;" class="form-control"
							placeholder="댓글을 입력해주세요."></textarea>
						<input type="hidden" name="reply_oriid" value="${bag.lounge_id}">
						<input type="hidden" name="user_id" value="${sessionScope.user_id}">
						<button class="btn btn-primary" style="display: inline-block;"
							id="replyBtn">댓글등록</button>
					</div>
				</form>
			</div>
			<c:forEach items="${rpList}" var="rp">
				<div id="result"></div>
				<div id="comment_${rp.reply_id}"
					class="container-fluid pt-4 px-4 comment">
					<div class="bg-light rounded">
						<div style="display: flex; justify-content: space-between;">
							<div style="padding: 5px;">${sessionScope.nickName}</div>
							<div style="padding: 5px;">${rp.reply_date}</div>
						</div>
						<div class="rpContent">
							<div style="padding: 20px;">${rp.reply_content}</div>
							<c:if test="${sessionScope.user_id != null && sessionScope.user_id == rp.user_id}">

								<div style="display: flex; justify-content: flex-end;">
									<button class="btn btn-primary w-20 m-2"
										id="rpUpdateBtn_${rp.reply_id}" data-reply_id="${rp.reply_id}"
										name="reply_content" value="${rp.reply_content}">댓글수정</button>
									<form action="rpDelete">
										<input type="hidden" name="reply_oriid"
											value="${rp.reply_oriid}"> <input type="hidden"
											name="reply_id" value="${rp.reply_id}">
										<button class="btn btn-primary w-20 m-2">댓글삭제</button>
									</form>
								</div>
							</c:if>
						</div>
						<form action="rpUpdate">
							<div class="editForm" style="display: none;">
								<input type="hidden" id="reply_id" name="reply_id"
									value="${rp.reply_id}"> <input type="hidden"
									id="reply_oriid" name="reply_oriid" value="${rp.reply_oriid}">
								<textarea name="reply_content" class="form-control newReply">${rp.reply_content}</textarea>
								<div style="display: flex; justify-content: flex-end;">
									<button class="btn btn-primary w-20 m-2 rpEditDoneBtn">수정
										완료</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</c:forEach>

			<!-- Table End -->

		</div>
		<!-- Content End -->
		<script type="text/javascript">
		$(function() {
			let userId = '${sessionScope.user_id}';
			let loungeId = '${bag.lounge_id}';
			$('.likeClick').click(function() {
				console.log('${sessionScope.user_id}')
				console.log('${bag.lounge_id}')
				
				$.ajax({
			        type: "get",
			        url: "likeCheck",  // 서버에서 좋아요 상태 체크를 위한 URL
			        data: {
			            user_id : userId,
			            lounge_id : loungeId,
			        },
			        success: function(response) {
			            console.log("좋아요 상태: " + response.likeState);
			            
				 if(response.likeState == 'off') { 
					$.ajax({
						type: "get",
						url: "likeInsert",
						data: {						
							user_id : userId,
							lounge_id : loungeId,
						},
						success : function(response) {	
							console.log("res>>"+ response)
							console.log("좋아요수"+ response.likeCnt)
							console.log("새로추가된likeid"+ response.likeId)
							$("#likeImg").attr("src", "../resources/img/heartOn.png");
							$("#b1").html(response.likeCnt)

						},
						error : function(response) {
							console.log(response)
						}							
					})
				 }else {
					$.ajax({
						type: "get",
						url: "likeDelete",
						data: {
							user_id : userId,
							lounge_id : loungeId,
						},
						success : function(response) {	
							console.log("res>>"+ response)
							console.log("좋아요수"+ response.likeCnt)		
							$("#likeImg").attr("src", "../resources/img/heartDefault.png");
							$("#b1").html(response)

						},
						error : function(response) {
							console.log(response)
						}
							
					})
				} 
			 }
			})
			})
		})

//좋아요 비로그인시
function handleLikeClick() {
	alert('좋아요는 로그인 후 이용가능합니다.')
}

		
		//댓글수정 클릭시 해당위치 스크립트 처리
		$(function() {
			$('[id^="rpUpdateBtn_"]').click(function() {
				var reply_id = $(this).data('reply_id');
				var commentDiv = $(this).closest(".comment");
				console.log(reply_id + "//" + commentDiv)
				commentDiv.find(".editForm").show();
				commentDiv.find(".rpContent").hide();
				console.log(".rpUpdateBtn_" + reply_id);
			});
		});
			
	</script>

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