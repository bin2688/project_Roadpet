<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String id2 = "root";
String pw2 = "1234";
String result = "로그인 실패";
if(id.equals(id2)&& pw.equals(pw2)){
	result = "로그인 성공";
	session.setAttribute("id",id);
	}else{
		out.print("재로그인 부탁");
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	로그인 결과 <%=result %>
<%if(session.getAttribute("id")!=null){ %>
	세션 id 값은 : <%= session.getAttribute("id") %>
<%} %>

</body>
</html>