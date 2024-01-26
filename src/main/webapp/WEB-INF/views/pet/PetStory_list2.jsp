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
<style>
@font-face {
    font-family: 'SOYOMapleBoldTTF';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/SOYOMapleBoldTTF.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
 
 .card{
 	font-family: 'SOYOMapleBoldTTF', serif;
 }

</style>
</head>
<body>
<div class="h-100 bg-light rounded p-4">
<c:forEach items="${list2}" var="vo">
			
			<%-- <div class="col-sm-12 col-md-6 col-xl-4"
				style="display: inline-block;">
				<div class="h-100 bg-light rounded p-4">
					<div class="card">
					<div class="card-view">
						<div class="title">
							<h4 class="mb-0">${vo.story_title}</h4>
						</div>
						<div class="myinfo">
							<div class="d-flex align-items-center justify-content-right mb-2">
							<dl>
								<dt>날짜</dt>
								<dd>
									${vo.story_date}
								</dd>
							</dl>
							<dl>
								<dt>공개여부</dt>
								<dd>${vo.story_private}</dd>
							</dl>
							</div>
						</div>
						<div class="cont">
							<h3>${vo.story_photo}</h3>
							<h4>${vo.story_content}</h4>
						</div>
					</div>
				</div>
			</div>
		</div> --%>

			<div class="col-sm-12 col-md-6 col-xl-4"
				style="display: inline-block;">
				
					<div class="card">
						<div class="card-view">
							<table style="text-align: center; width: 100%; height: 200px; border:1px solid #F7D358; border-radius:15px;">
								<tr style="ext-align:center;">
									<td colspan=3 style="ext-align:center; font-size:20px;">${vo.story_title}
									<hr></td>
									
								</tr>
								<tr>
									<td></td>
									<td style="width: 20%; font-size:12px">날짜</td>
									<td style="width: 20%; font-size:12px">공개여부</td>
								</tr>
								<tr>
									<td></td>
									<td style="width: 10%; font-size:12px">${vo.story_date}</td>
									<td style="width: 10%; font-size:12px">${vo.story_private}</td>
								</tr>
								<tr>

									<td colspan=3>${vo.story_photo}</td>

								</tr>
								<tr>
									<td colspan=3 style="width: 10%; font-size:20px">${vo.story_content}</td>

								</tr>

							</table>

						</div>
					</div>
				</div>
			
		</c:forEach>
	</div>

</body>
</html>

