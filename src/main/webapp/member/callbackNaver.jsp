<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("tsYjqfXvytINvKw8g8wN",
				"http://localhost:9999/roadpet/member/callbackNaver.jsp");
		// 접근 토큰 값 출력
		alert(naver_id_login.oauthParams.access_token);
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
			// naver_id_login.getProfileData('프로파일항목명');
			// 프로필 항목은 개발가이드를 참고하시기 바랍니다.
			alert(naver_id_login.getProfileData('id'));
			alert(naver_id_login.getProfileData('nickname'));
			alert(naver_id_login.getProfileData('name'));
		}


		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
	</script>

	<!-- 네이버 회원가입 -->
	<script>
	$(document).ready(function(){
		$.ajax({
			url : 'naverLogin', //MemberController에서 요청 받을 주소
			type : 'post',
			data : {
				id : login_naverid,
				nickname : nickname,
				name : name,
			},
			success : function(result) {
				if (result == 0) {
					alert("회원가입 되셨습니다.")
				} else {
					alert("다시 시도해주세요.")
				}
			},
			error : function(jqxhr, textstatus, error) {
				console.log(jqxhr);
				//alert(textstatus);
				//alert(error);

			}

		})
	}
	</script>
	<script>
 alert("로그인이 완료되었습니다.");
 self.close();
 location.href = "login.jsp";
</script>
</body>
</html>