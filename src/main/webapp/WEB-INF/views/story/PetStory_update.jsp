<%@page import="com.multi.roadpet.story.PetStoryVO"%>
<%@page import="com.multi.roadpet.story.PetStoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id="bag" class="com.multi.roadpet.story.PetStoryVO"></jsp:useBean>
    <jsp:setProperty property="id" name="bag"/>
    <%
    //jsp에서 자동import ==> "클릭" -> ctrl + shift + m
    	PetStoryDAO dao = new PetStoryDAO();
    	PetStoryVO bag2 = dao.one(bag);
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/project.css">
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
		<br>
		<hr color="blue">
		<!-- insert2.jsp?title=1&content=1 -->
		<form action="update2">
			<input name="story_id" value="<%= bag2.getStory_id() %>" type="hidden">
				<table border="1"  class="table table-hover">
					<tr  class="table-warning">
						<td width="200">제목</td>
						<td width="300"><input name="story_title" value="<%= bag2.getStory_title()%>"></td>
					</tr>
					<tr  class="table-warning">
						<td width="200">내용</td>
						<td width="300">
							<textarea name="story_content" rows="5" cols="20"><%= bag2.getStory_content()%>
						</textarea></td>
					</tr>
					<tr  class="table-warning">
						<td width="200">작성자</td>
						<td width="300">
							<input name="story_id" value="${story_id}" readonly="readonly">
						</td>
					</tr>
					<tr  class="table-warning">
						<td width="200" colspan="2">
							<button type="submit" class="btn btn-info">글수정하기</button>
						</td>
					</tr>
				</table>
		</form>
	</div>
</div>
</body>
</html>