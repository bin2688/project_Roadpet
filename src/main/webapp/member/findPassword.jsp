<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="findPw">
		<table border="1" bordercolor='gray'>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" style="width: 250px;">비밀번호찾기</button>
				</td>
			</tr>
		</table>
	</form>
	<hr color="gray">

	<a href="member.jsp" class="btn btn-google btn-user btn-block">로그인화면</a>
	<a href="signUp.jsp" class="btn btn-google btn-user btn-block">회원가입</a>
	<a href="findIdCheck.jsp" class="btn btn-facebook btn-user btn-block">아이디
		찾기</a>
	<a href="findPassword.jsp" class="btn btn-warning btn-user btn-block">비밀번호 찾기</a>
</body>
</html>