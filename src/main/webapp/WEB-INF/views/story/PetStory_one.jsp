<%@page import="com.multi.roadpet.story.ReplyVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.multi.roadpet.story.PetStoryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="../resources/css/mapservice.css">
<title>상세보기</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Script Setting -->
<script type="text/javascript" src="../resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1991e110a0fbe362aac08fce1f5fba8c"></script>

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
</head>

<body>
	<div class="container-fluid position-relative bg-white d-flex p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>

		<div class="content open">
			<%@ include file="/header.jsp"%>
			<%@ include file="/sidebar.jsp"%>

			</head>


			<%
				PetStoryVO bag = (PetStoryVO) request.getAttribute("bag");
			%>

			<script type="text/javascript">
	//jquery는 버튼 하나당 함수 하나, 요청 하나당 함수 하나
	//특정한 이번트가 발생하기를 기다렸다가 이벤트가 발생하면 자동으로 함수를 실행시켜주는 방식의 함수를 사용
	//콜백함수
	//body를 먼저 브라우저가 읽도록 하는 코드를 넣어주어야 함
	$(function() {
		$('#b1').click(function() {
			$.ajax({
				url : "insert4",
				data : {
					reply_user_id : '<%=bag.getUser_id()%>',
					reply_oriid : '<%=bag.getStory_id()%>',
					reply_content : $('#reply').val()
							},
							success : function(response) {
								alert('댓글이 성공적으로 작성되었습니다!' + response)
								$('#result').append(response)
							}
						})
					})
				})
			</script>

			</head>

			<body>
				<br>
				<h4>상세보기</h4>
				<hr>


				<table class="table-bordered">
					<colgroup>
						<col style="width: 150px" />
						<col style="width: 500px" />
					</colgroup>
					<tr>
						<th>작성자</th>
						<td><%=bag.getUser_id()%></td>
					</tr>
					<tr>
						<th>작성일</th>
						<td><%=bag.getStory_date()%></td>
					</tr>
				</table>
				<br>
				<img src="../resources/upload/<%=bag.getStory_photo()%>" width="500"
					height="300">
				<table class="table">
					<tr>
						<td colspan="10" style="background-color: white;"><pre
								style="font-size: 20px; font-family: 고딕, arial; background-color: white"><%=bag.getStory_content()%></pre>
						</td>
					</tr>
				</table>
				<br>
				<!-- 댓글 작성 부분 -->
				<div class="container-fluid pt-4 px-4">
					<div class="input-group mb-3">
						<textarea id="reply" class="form-control"
							placeholder="댓글을 입력해주세요."></textarea>
						<button class="btn btn-primary" id="b1">댓글등록</button>
					</div>
				</div>

				<button type="button" class="btn btn-primary m-2"
					onclick="location.href='PetStory_list?page=1'">글목록</button>
				<!-- 로그인했을때 수정 삭제 버튼 보여주기 -->
				<%
					if (session.getAttribute("user_id") != null) {
				%>
				<a href="PetStory_update?user_id=<%=bag.getUser_id()%>">
					<button type="button" class="btn btn-primary m-2">수정</button>
				</a>
				<a href="PetStory_delete?user_id=<%=bag.getUser_id()%>">
					<button type="button" class="btn btn-primary m-2">삭제</button>
				</a>
				<%
					}

				%>

				<div id="result">
					<%
						List<ReplyVO> list = (List<ReplyVO>) request.getAttribute("list");
					%>
					<%
						for (ReplyVO vo : list) {
					%>-<%=vo.getReply_id()%>.<%=vo.getReply_content()%>
					<br>
					<%
						}
					%>
				</div>
			</body>
</html>