<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//세션끊자- 각 브라우저에 해당하는 서버 램에 저장했던 값들을 모두 지운다.
	//          id를삭제! ==> session 내장객체 
	session.invalidate(); //세션을 무효로 만들다.!
	
%>
<script>
alert("로그아웃이 완료되었습니다.");
self.close();
location.href = "http://localhost:9999/roadpet/member/login.jsp";
</script>