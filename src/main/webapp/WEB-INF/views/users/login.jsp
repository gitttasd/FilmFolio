<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
form{
   background-color: #ffffff; /* 흰색 배경 */
    padding: 80px; /* 내부 여백 */
    width: 700px; /* 폼 너비 */
    border-radius: 10px; /* 모서리 둥글게 */
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 */
}
p {
    margin-top: 10px; /* 원하는 만큼 조정 */
    
}
body {
    height: 100vh; /* 전체 높이를 100%로 설정 */
    display: flex;
    justify-content: center; /* 수평 중앙 정렬 */
    align-items: center; /* 수직 중앙 정렬 */
    margin: 0; /* 기본 여백 제거 */
    background-color: #f8f8f8 !important; 
}
#login{
	color:black;
	
}
#SNS{
	color:black;
	margin-top: 15px;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 20px;
	
}
#joinBtn{
	color:black;
	margin-top: 20px;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 20px;
	/* margin-left: 15px; */

	
}
#sign{
	color:#fdc122;
	text-decoration: none;
	
}

#container{
	display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh; /* 화면 중앙에 배치 */
    text-align: center;
}

#frmLogin{
	display:none;
}

h1{
	font-family: "Noto Sans KR", sans-serif;
}

form .btn-primary {
    font-size: 25px !important; /* !important를 사용해 강제로 적용 */
}

#imoticon{
	display: flex; 
	align-items: center;
	font-family: "Noto Sans KR", sans-serif;
	margin: 0 auto;
	justify-content: center; /* 수평 가운데 정렬 */
	
}

#name{
	margin-left:10px;
	font-size: 60px;
	margin-bottom: 30px;
}

.home{
	text-decoration:none;
	color:black;
}

#findIdResult {
    color: green; /* 성공 메시지 색상 */
    margin-top: 20px;
    text-align: center;

}

#findIdButton{
	cursor: pointer;
}

#findPwButton{
	cursor: pointer;
}
/* 버튼 끝 */




#findIdName{
	
	 padding: 15px;
	margin-bottom: 20px;
	width:100%;
}
#findIdemail{
	
	margin-bottom:15px;
	padding: 15px;
	width:100%;

}
label{
	margin-bottom: 10px;
	font-size: 18px !important;

}

.modal-body input[type="text"],
.modal-body input[type="email"] {
    border: 1px solid #ddd; /* 테두리 색상 */
    padding: 10px; /* 내부 여백 */
    border-radius: 10px; /* 둥근 모서리 */
    font-size: 16px; /* 폰트 크기 */
    width: 100%; /* 넓이 설정 */
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 */
    transition: border-color 0.3s ease, box-shadow 0.3s ease; /* 효과 전환 */
}

.modal-body input[type="text"]:focus,
.modal-body input[type="email"]:focus {
    border-color: #4a90e2; /* 포커스 시 테두리 색상 */
    box-shadow: 0px 0px 8px rgba(74, 144, 226, 0.4); /* 포커스 시 그림자 강조 */
    outline: none; /* 기본 outline 제거 */
    }
    
#findPwButton{
	text-decoration: none;
	color:black;
}    


</style>

<!-- 제이쿼리 -->	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
<!-- 부트스트랩 JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>

<body>
<!-- 부트스트랩 JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<!-- 로그인 폼 -->
	<div id="container">
	
		<form action="${pageContext.request.contextPath}/login/login.do" method="post">
	   		<div id="imoticon">
	   		<p id="name"><a class="home" href="${pageContext.request.contextPath}/">FilmFolio</a></p>
	   		</div>
	    		<div class="form-floating">
			      <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com" name="loginId">
			      <label for="floatingInput">id</label>
	    		</div>
			    <div class="form-floating">
			      <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
			      <label for="floatingPassword">Password</label>
			    </div>
			    <br>
	    		<button class="btn btn-primary w-100 py-2" type="submit"><strong id="buttonStyle">로그인</strong></button>
	    		<hr>
	    		<p id="SNS">SNS 로그인</p>
			    <a class="btn-kakao" href="#" data-type="login" style="margin-right: 15px; display: inline-block; vertical-align: middle;" >
					<img src="/resources/image/free-icon-kakao-talk-4494622.png" width="50" alt="카카오 로그인 버튼" />
				</a>
				<a class="btn-naver" href="${url}" data-type="login">
					<img src="/resources/image/btnG_아이콘원형.png" width="50" alt="네이버 로그인 버튼" style="display: inline-block; vertical-align: middle;" />
				</a>
				
				<div class="user-Request">
				<p id="joinBtn"><a id="sign" href='${pageContext.request.contextPath}/join/siteUseAgree.do'>회원가입</a>
				<a data-bs-toggle="modal" data-bs-target="#memModal" id="findIdButton">아이디찾기</a>
				<a data-bs-toggle="modal" data-bs-target="#PwModal" id="findPwButton">비밀번호찾기</a>
			  	</p>
			  	</div>
		</form>
		</div>
		
		<!-- 로그인 폼 끝-->

<!--아이디 찾기 모달 -->
<div class="modal fade" id="memModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">아이디찾기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
				<label for="findIdName"><strong>성함</strong></label><br>	
				<input id="findIdName" type="text"><br>	
				<label for="findIdemail"><strong>이메일</strong></label><br>
				<input id="findIdemail" type="email"><br>
			<div id="findIdResult" style="display:none;"></div> <!-- 결과를 표시할 div -->
      </div>
      <div class="modal-footer">
       	<button type="button" id="findIdBtn" class="btn btn-primary">아이디 찾기</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<!--비밀번호 찾기 모달 -->
<div class="modal fade" id="PwModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호찾기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
				<label for="userId">아이디</label>
					<input type="text" id="userId" name="loginId"><br>
					<label for="username">이름</label>
					<input type="text" id="username" name="name"><br>
					<label for="email">이메일</label>
					<input type="text" id="email" name="email"><br><br>
					<div id="findPwResult" style="display:none;"></div> <!-- 결과를 표시할 div -->
					<div id="sendEmailBtn" style="display: none;"><br>
					<button id="finalPwBtn" type="button" class="btn btn-primary" style="background-color: green; color: white;">메일전송하기</button> 
					</div>
					
      </div>
      <div class="modal-footer">
       	<button type="button" id="submitBtn" class="btn btn-primary">비밀번호 찾기</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>


<script>
$(document).ready(function(){
	
	const myModal = new bootstrap.Modal('#memModal')

	let findBtn = document.querySelector('#findIdButton');
			
	findBtn.onclick = function(){
		myModal.show();
	}
		
	function findId(){
		const idName = document.querySelector('#findIdName');
		const idEmail = document.querySelector('#findIdemail');
		
		if(idName.value === "" || idEmail.value === "" ){
			alert("아이디와 이메일을 모두 입력하세요");
			return;
		}
		
		//Ajax 요청으로 아이디 찾기
		$.ajax({
			url:"${pageContext.request.contextPath}/users/findId.do",
			method: "POST",
			data:{
				name: idName.value,
				email: idEmail.value
			},
			success: function(response) {
				if(response.success){
					$('#findIdResult').text("ID:" +response.id).css("color","green").show();
				}else{
					$('#findIdResult').text("아이디를 찾을 수 없습니다.").css("color","red").show();
				}
			},
			error:function(xhr,status,error){
				console.error("AJAX 요청 중 오류 발생:",error);
				alert("서버와 통신 중 오류가 발생했습니다.");
			}
		});		
	  }
	
	$('#findIdBtn').click(function(){
		findId();
	})
	

	});

</script>


<!-- 비밀번호 스크립트 -->
<script>

const myPwModal = new bootstrap.Modal('#PwModal')

const submitBtn = document.querySelector('#submitBtn')
const loginId = document.querySelector('#userId')
const name = document.querySelector('#username')
const email = document.querySelector('#email')
let userEmail;

	let findPwBtn = document.querySelector('#findPwButton');
			
	findPwBtn.onclick = function(){
		myPwModal.show();
	}
	

	submitBtn.onclick= function(event){
		
		if(loginId.value === "" || name.value === "" || email.value === ""){
			alert("가입 시 정보를 모두 입력하세요");
			return;	
		}else{
			
			findByinfo();	
			}
		}
			
	
	function findByinfo(){
			
			let reqData ={loginId: loginId.value, name: name.value, email: email.value}
			
			fetch('/users/findPw.do',{
				method: 'POST',
				headers : {'Accept':'application/json'},
				body: new URLSearchParams(reqData)
			})	
			.then(resp=>resp.json())
			.then(data=>{
				console.log(data);
				if(data.length > 0){
					userEmail=data[0].email;
					document.querySelector('#findPwResult').innerHTML = "가입정보가 확인 되었습니다.<br>"+data[0].email+"으로 임시비밀번호를 발송하시겠습니까?"		
					document.querySelector('#findPwResult').style.color ="green"
					document.querySelector('#findPwResult').style.display ="block"
				    document.querySelector('#sendEmailBtn').style.display ="block"
				}else{
					document.querySelector('#findPwResult').innerText = "가입 정보가 상이합니다."
					document.querySelector('#findPwResult').style.color ="red"
					document.querySelector('#findPwResult').style.display ="block"
				}
			}).catch(e =>{
				alert("조회 실패");
			});
		}
	
		let finalPwBtn = document.querySelector('#finalPwBtn')
		
		finalPwBtn.onclick= function(){
			finalByMail();
			alert("메일이발송되었습니다.")
		}
		
		function finalByMail() {
			/* let mailData = {email:userEmail} */
			
			$.ajax({
				url:"${pageContext.request.contextPath}/users/finalPw.do",
				type: 'POST',
				/* contentType: 'application/json', */
		        data:{
		        	email:userEmail
		        }, 
		        success: function(response) {
		            console.log("임시 비밀번호가 발송되었습니다.");
		        },
		        error: function(jqXHR, textStatus, errorThrown) {
		            alert("이메일 발송에 실패했습니다: " + textStatus);
		        }
			});
		}		
</script>
   
    
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

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

<!-- 카카오로그인 데이터 전송 form -->
<form id="frmLogin" name="frmLogin" method="post" action="/login/login.do">
	<input type="hidden" name="loginType" value="">
	<input type="hidden" id="snsId" name="loginId">
</form>

<c:if test="${not empty overlapMessage}">
    <script>alert('${overlapMessage}');</script>
</c:if>

<!-- 부트스트랩 JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>