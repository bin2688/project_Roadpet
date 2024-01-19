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
<script type="text/javascript">
	//댓글작성
	$(function() {
		$('#replyBtn').click(function() {
			$.ajax({
				url : "rpInsert",
				data : {
					reply_oriid : '${bag.lounge_id}',
					reply_content : $('#reply').val(),
					reply_user_id : '1',
				},
				success : function(response) {
					$('#result').prepend(response)
				}
			})
		})
	})
	
	//댓글수정 클릭시 해당위치 스크립트 처리
	$(function() {
		$('[id^="rpUpdateBtn_"]').click(function() {
			var reply_id = $(this).data('reply_id');
			var commentDiv = $(this).closest(".comment");
			commentDiv.find(".editForm").show();
			commentDiv.find(".rpContent").hide();
			console.log(".rpUpdateBtn_" + reply_id);
		});
	});
	
	//댓글 수정완료
	$(function() {
		$('.rpEditDoneBtn').click(function() {
			var reply_id = $(this).data('reply_id');
			var commentDiv = $(this).closest(".comment");
			$.ajax({
				url : "rpUpdate",
				data : {
					reply_content : commentDiv.find('.newReply').val(),
					reply_id : reply_id
				},
				success : function(response) {
					commentDiv.find('.comment').html(response);
					commentDiv.find('.editForm').hide();
					console.log(response)
				}
			})
		})
	})
	
	//댓글 삭제
	$(function() {
		$('[id^="rpDeleteBtn_"]').click(function() {
			var replyId = $(this).data('reply_id');
			$.ajax({
				url: 'rpDelete',
				data: {
					reply_id : replyId,
					reply_oriid : '${bag.lounge_id}'
					},
				success : function(response) {
					 $('#comment_' + replyId).remove();					
				},
			})
		})
	})
	
</script>
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


		<!-- views 파일에서 구현예정 -->
		<div class="content">
			<%@ include file="/header.jsp"%>
			<div class="container-fluid pt-4 px-4">
				<div style="display: flex; justify-content: flex-end;">
					<a href="update?lounge_id=${bag.lounge_id}">
						<button class="btn btn-primary w-20 m-2" type="submit">글수정</button>
					</a>
					<form action="delete">
						<button class="btn btn-primary w-20 m-2" name="lounge_id"
							value="${bag.lounge_id}">글삭제</button>
					</form>
				</div>
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
					<div style="padding: 10px 20px; max-height: 200px; overflow-y: auto;">${bag.lounge_content}</div>
					<div style="padding: 10px;">${bag.lounge_img}</div>	
					<br>
					<!--썸네일 추가할부분-->
					<div style="display: flex; justify-content: space-between;">
						<div style="padding: 5px;">${bag.lounge_writer}</div>
						<div style="padding: 1px;">
						 댓글:<div id="replyCount">${bag.lounge_replyCount}</div>
						</div>
						<div style="padding: 5px;">
							<img alt="like" src="../resources/img/heartDefault.png"> 0
						</div>
						<div style="padding: 5px;">${bag.lounge_date}</div>
					</div>
					<hr>
				</div>
			</div>
			<br>
			<div class="container-fluid pt-4 px-4">
				<div class="input-group mb-3">
					<textarea id="reply" class="form-control" placeholder="댓글을 입력해주세요."></textarea>
					<button class="btn btn-primary" id="replyBtn">댓글등록</button>
				</div>
			</div>
			<c:forEach items="${rpList}" var="rp">
				<div id="result"></div>
				<div id="comment_${rp.reply_id}" class="container-fluid pt-4 px-4 comment">
					<div class="bg-light rounded">
						<div style="display: flex; justify-content: space-between;">
							<div style="padding: 5px;">hongg</div>
							<div style="padding: 5px;">${rp.reply_date}</div>
						</div>
						<div class="rpContent">
							<div style="padding: 20px;">${rp.reply_content}</div>
							<div style="display: flex; justify-content: flex-end;">
								<button class="btn btn-primary w-20 m-2"
									id="rpUpdateBtn_${rp.reply_id}" data-reply_id="${rp.reply_id}"
									name="reply_content" value="${rp.reply_content}">댓글수정</button>
								<input type="hidden" name="reply_oriid" value="${rp.reply_oriid}">
								<button class="btn btn-primary w-20 m-2" id="rpDeleteBtn_${rp.reply_id}" data-reply_id="${rp.reply_id}"
										value="${rp.reply_id}">댓글삭제</button>
								
							</div>
						</div>
						<div class="editForm" style="display: none;">
							<input type="hidden" id="reply_id" name="reply_id"
								value="${rp.reply_id}">
							<textarea class="form-control newReply">${rp.reply_content}</textarea>
							<div style="display: flex; justify-content: flex-end;">
								<button class="btn btn-primary w-20 m-2 rpEditDoneBtn"
									data-reply_id="${rp.reply_id}">수정 완료</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

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