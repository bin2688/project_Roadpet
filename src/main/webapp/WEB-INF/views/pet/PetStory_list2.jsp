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
 
 .card1{
 	font-family: 'SOYOMapleBoldTTF', serif;
	height: 300px;
	width: 200px;
	border-radius: 15px;
	display: inline-block;
	margin-top: 30px;
	margin-left: 30px;
	margin-bottom: 30px;
	margin-right: 30px;
	position: relative;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	overflow: hidden;
}
html, body, div, span, applet, object, iframes, h1, h2, h3, h4, h5, h6,
	p, blockquote, pre, a, abbr, acronym, address, big, quotes, code, del,
	dfn, em, img, ins, kbd, q, s, samp, small, strike, sub, sup, tt, var, u,
	i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table,
	caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	do: inherit;
	vertical-align: baseline;
}





</style>
</head>
<body>


<c:forEach items="${list2}" var="vo">
			
			<div class="card1" style= "border: 2px solid black; border-radius: 15px; width: 320px; height: 420px;">
				<div class="card-view">
					<table
						style="text-align: center; width: 100%; height: 200px; border-spacing:2px; border-collapse:separate;" >

						<tr>

							<td colspan=3><img
								src="../resources/upload/${vo.story_photo}" width="100%"
								height="200px"></td>

						</tr>
						

						<tr style="text-align: center; padding:5px;" >
							<td colspan=3 style="text-align: center; font-size: 18px; ">${vo.story_title}
								
							</td>

						</tr>
						<tr>
							<td colspan=3
								style="text-align: center; width: 10%; font-size: 13px; color:green; ">${vo.story_date}<hr></td>
						</tr>
						<tr>
							<td colspan=3 style="width: 10%; font-size: 15px">${vo.story_content}</td>

						</tr>
						

					</table>
				</div>
			</div>
		</c:forEach>


</body>
</html>













<!-- <body>
	<a href=""> 클릭 시 링크 설정
	<div class="card">
		카드 헤더
		  카드 바디
		<div class="card-body">

			  카드 바디 헤더
			<div class="card-body-header">
				<h1>4월 15일 순천만 동행구해요!</h1>
				<p class="card-body-hashtag">#여수 #순천 #광양</p>
				 <p class = "card-body-nickname"> 
                                 작성자: ENDORPHIN0710
           		         </p>
			</div>
			<p class="card-body-description">
				안녕하세요!
				4월 15일 순천만 동행구합니다!
			</p>
  카드 바디 본문

			
		</div>

	</div>
	</a>
</body>
</html> -->



