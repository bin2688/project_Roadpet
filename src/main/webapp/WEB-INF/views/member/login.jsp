<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="/roadpet/index.jsp">dasdas</a>
<%if(session.getAttribute("user_id")!=null){ %>
	세션 id 값은 : <%= session.getAttribute("user_id") %>
<%} %>

<script>

 alert("로그인이 완료되었습니다.");
 
</script>
</body>
</html>