<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
form{
	margin: 100px auto;
	width: 500px;
	display:block;
}


</style>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<form action="${pageContext.request.contextPath}/users/login.do" method="post">
	    
	    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
	
	    <div class="form-floating">
	      <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com" name="loginId">
	      <label for="floatingInput">id</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
	      <label for="floatingPassword">Password</label>
	    </div>
	
	    <div class="form-check text-start my-3">
	      <input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
	      <label class="form-check-label" for="flexCheckDefault">
	        Remember me
	      </label>
	    </div>
	    <button class="btn btn-primary w-100 py-2" type="submit">Sign in</button>
	    <a class="btn-kakao" href="#" data-type="login">
		<img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222" alt="카카오 로그인 버튼" />
		</a>
	    
	    <p class="mt-5 mb-3 text-body-secondary">© 2024</p>
	  </form>
	  
<script src="https://t1.kakaocdn.net/kakao_js_sdk/v1/kakao.min.js"></script>
<script>

$(document).ready(function(){
	//카카오 로그인 버튼
	$(".btn-kakao").click(function(){
		const type = $(this).data("type");
		kakaoLogin(type);
		
		return false;
	});
});

//카카오 키 정보 입력
Kakao.init('4db53477384f18eac87ac0d203f32fab');

//카카오SDK 초기화
Kakao.isInitialized();

//카카오로그인
function kakaoLogin(type){
	Kakao.Auth.login({
		success: function(response){
			Kakao.API.request({
				url: '/v2/user/me',
				success: function(response){
					console.log(response)
					$("input[name=loginType]").val("KAKAO");
					$("#snsId").val(response.id);
					$("#frmLogin").submit();
				},
				fail: function (error){
					console.log(error);
				},
			});
		},
		fail: function(error){
			console.log(error);
		},
	});
}


</script>
</body>
</html>