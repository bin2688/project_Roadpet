<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	Integer sessionUserId = (Integer)session.getAttribute("user_id");
	String sessonNickName  = (String)session.getAttribute("nickname");

%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>라운지 글쓰기</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<%@ include file="../sidebar.jsp"%>
<style>
.preview-image {
    max-width: 100%;
    max-height: 200px;
    margin-bottom: 10px;
    border-radius: 10px;
}

.close-button {
    background-color: #ff0000;
    color: #ffffff;
    border: none;
    padding: 1px 5px;
    cursor: pointer;
    border-radius: 50%;

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
			<%@ include file="../header.jsp"%>
			<!-- Form Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
				
					<form action="insert" method="post" enctype="multipart/form-data" id="form">
						<div class="col-sm-24 col-xl-12">
							<div class="bg-light rounded h-30 p-4">
								<h6 class="mb-4">카테고리</h6>
								<select class="form-select form-select-sm mb-3"
									name="lounge_pet_type" aria-label=".form-select-sm example">
									<option value="강아지" selected>강아지</option>
									<option value="고양이">고양이</option>
									<option value="소동물">소동물</option>
									<option value="물고기">물고기</option>
								</select>
							</div>
							<div class="bg-light rounded h-30 p-4">
								<h6 class="mb-4">제목</h6>
								<input name="lounge_title" class="form-control mb-3" type="text"
									placeholder="제목을 입력해주세요.">
							</div>
							<div class="bg-light rounded h-30 p-4">
								<div class="form-floating">
									<h6 class="mb-4">내용</h6>
									<textarea placeholder="내용을 입력해주세요." name="lounge_content"
										class="form-control" id="floatingTextarea"
										style="height: 250px;"></textarea>
								</div>
							</div>
							<div class="bg-light rounded h-30 p-4">
								<h6 class="mb-4">이미지 첨부하기</h6>
								<div class="input-form-box">
									<input type="file" name="file" id="file" class="form-control" onchange="previewImage()">
									<div id="image-preview-container"></div>
								</div>
							</div>
						</div>
						<div class="m-n2" style="text-align: center;">
							<input type="hidden" name="user_id" value="<%=sessionUserId%>">
							<input type="hidden" name="lounge_replyCount" value="0">
							<button class="btn btn-primary w-40 m-2" type="submit">글작성
								완료</button>
						</div>
					</form>
				</div>
			</div>
			<!-- Form End -->

		</div>
		<!-- Content End -->


		<!-- Back to Top -->
		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>
	</div>
<script>
		function previewImage() {
			const input = document.getElementById('file');
			const container = document.getElementById('image-preview-container');

			// 이전에 추가된 이미지 및 버튼 제거
			container.innerHTML = '';

			if (input.files && input.files[0]) {
			    const reader = new FileReader();
				reader.onload = function (e) {
			   		// 미리보기 이미지 생성
			        const previewImage = document.createElement('img');
			        previewImage.src = e.target.result;
			        previewImage.classList.add('preview-image');
			        container.appendChild(previewImage);

			        // 미리보기 이미지 첨부삭제 버튼 생성
			        const closeButton = document.createElement('button');
			        closeButton.innerHTML = 'X';
			        closeButton.classList.add('close-button');
			        closeButton.onclick = function() {
			            // 클릭시 첨부값 초기화
			            container.innerHTML = '';
			            input.value = null;
			        };
			            
			      container.appendChild(closeButton);
			   };
			   reader.readAsDataURL(input.files[0]);   
			}
		}
	</script>
	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="../resources/lib/chart/chart.min.js"></script>
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