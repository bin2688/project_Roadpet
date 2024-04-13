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
<!-- Script Setting -->
<script type="text/javascript" src="../resources/js/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

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
.result div[style*="flex: 1;"] {
        font-size: 20px;
    }

.bg-light rounded div[style*="padding: 5px;"] {
        font-size: 20px; 
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

		<!-- Content Start -->
		<div class="content open">
			<%@ include file="/header.jsp"%>
			<%@ include file="/sidebar.jsp"%>
			
			<!-- details Start -->
			<div class="container mt-4">
			<c:if test="${sessionScope.user_id != null && sessionScope.user_id == details.user_id}">				
				<div style="display: flex; justify-content: flex-end;">
					<a href="update?lounge_id=${details.lounge_id}">
						<button class="btn btn-primary w-20 m-2" type="submit">글수정</button>
					</a>
					<form action="delete">
						<button class="btn btn-primary w-20 m-2" name="lounge_id"
							value="${details.lounge_id}">글삭제</button>
					</form>
				</div>
			</c:if>

				<div class="bg-light rounded">
					<div style="display: flex; gap: 20px;">
						<div>
							<span class="badge bg-warning">${details.lounge_pet_type}</span>
						</div>
					</div>
					<div>
						<h3 style="padding: 5px;">${details.lounge_title}</h3>
					</div>
					<hr>
					<div
						style="padding: 10px 20px;  max-height: 200px; overflow-y: auto;">${details.lounge_content}</div>
					<img alt="" src="../resources/upload/${details.lounge_img}" width="400" height="400"> <br>

					<div style="display: flex; justify-content: space-between;">
						<div style="padding: 5px;">${details.lounge_writer}</div>
						<div style="padding: 1px;">

							<div id="replyCount">댓글: ${details.lounge_replyCount}</div>
						</div>
						<div style="padding: 5px;">
							<c:choose>
								<c:when test="${sessionScope.user_id != null}">
									<div class="likeClick" style="text-align: center;">
										<c:choose>
											<c:when test="${likeCheck.likeState eq 'off'}">
												<img id="likeImg" style="display: inline-block;" alt="like"
													src="../resources/img/heart-Off.png">
											</c:when>
											<c:otherwise>
												<img id="likeImg" style="display: inline-block;" alt="like"
													src="../resources/img/heart-On.png">
											</c:otherwise>
										</c:choose>
										<div id="b1" style="display: inline-block;">${details.likeCnt}</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="" style="text-align: center;" onclick="handleLikeClick()">
										<img id="likeImg" style="display: inline-block;" alt="like"
											src="../resources/img/heart-Off.png">
										<div id="b1" style="display: inline-block;">${details.likeCnt}</div>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
						<div style="padding: 5px;">${details.lounge_date}</div>
					</div>
					<hr>
				</div>
			</div><br>
			
			
			<div class="container mt-4">
				<a href="list?page=1">
				<button class="btn btn-success" style="display: inline-block;" id="returnBtn">목록으로</button>
				</a>
				<br><br>
				<c:choose>
					<c:when test="${sessionScope.user_id != null}">	
						<form action="rpInsert">					
							<div class="input-group mb-3" style="text-align: center">
								<textarea id="reply" name="reply_content" style="display: inline-block;" class="form-control" placeholder="댓글을 입력해주세요."></textarea>
								<input type="hidden" name="reply_oriid" value="${details.lounge_id}">
								<input type="hidden" name="user_id" value="${sessionScope.user_id}">
								<input type="hidden" name="reply_writer" value="${sessionScope.nickName}">			
							    <button class="btn btn-primary" style="display: inline-block;" id="replyBtn">댓글등록</button>	
							</div>				
						    </form>						
						</c:when>				
					<c:otherwise>
							<div class="input-group mb-3" style="text-align: center">						
								<textarea id="reply" name="reply_content" style="display: inline-block;" class="form-control" placeholder="로그인 후 작성이 가능합니다." readonly></textarea>
							    <button class="btn btn-primary" style="display: inline-block;" id="loginAlertBtn" onclick="checkLogin()">댓글등록</button>
						    </div>
					</c:otherwise>
			   </c:choose>				   
			</div>
			
		
			<c:forEach items="${replyList}" var="rp">
				<div id="comment_${rp.reply_id}"
					class="container mt-4 comment">
					<div class="bg-light rounded">
						<div style="display: flex; justify-content: space-between;">
							<div style="padding: 5px;">${rp.reply_writer}</div>
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
									<button class="btn btn-primary w-20 m-2 rpEditDoneBtn">수정완료</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</c:forEach>
			<!-- details End -->	
			
			<!-- Back to Top -->				
			<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
				class="bi bi-arrow-up"></i></a>			

		</div>
		<!-- Content End -->
	</div>		
		<!-- Back to Top -->
			
<script type="text/javascript">
	//좋아요 클릭시 호출		
	$(function() {
		let userId = '${sessionScope.user_id}';
		let loungeId = '${details.lounge_id}';
		$('.likeClick').click(function() {		
			$.ajax({
		        type: "get",
		        url: "likeCheck",  // 서버에서 좋아요 상태 체크를 위한 URL
		        data: {
		            user_id : userId,
		            lounge_id : loungeId,
		        },
		        success: function(response) {		            
				 if(response.likeState == 'off') {  
							$.ajax({
								type: "get",
								url: "likeInsert",  // 정보가없다면 insert
								data: {						
									user_id : userId,
									lounge_id : loungeId,
								},
								success : function(response) {	
									$("#likeImg").attr("src", "../resources/img/heart-On.png");
									$("#b1").html(response.likeCnt)			
								},
								error : function(response) {
									console.log(response)
								}							
							}) 
				 }else {
							$.ajax({
								type: "get",
								url: "likeDelete",  // 정보가있다면 delete
								data: {
									user_id : userId,
									lounge_id : loungeId,
								},
								success : function(response) {		
									$("#likeImg").attr("src", "../resources/img/heart-Off.png");
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
		alert('로그인이 필요한 서비스입니다.')
	}
	
	//댓글작성 비로그인시
	function checkLogin() {
	     alert("로그인이 필요한 서비스입니다.");
	     event.preventDefault(); 
	}
	
	
	//댓글수정 클릭시 해당위치 스크립트 처리
	$(function() {
		$('[id^="rpUpdateBtn_"]').click(function() {
			let reply_id = $(this).data('reply_id');
			let commentDiv = $(this).closest(".comment");
			commentDiv.find(".editForm").show();
			commentDiv.find(".rpContent").hide();
		});
	});
	</script>	
</body>

</html>