<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>

body{

}

#navigation{
	display: flex;
	margin: 0 auto; /* 양쪽 여백을 자동으로 설정하여 중앙 정렬 */
	max-width: 900px; /* 최대 너비 설정 (필요에 따라 조정) */
	justify-content: space-around;
	align-items: center; /* 수직 정렬 */
	margin-top:30px;
	
}

#space{
	margin-top: 80px;
}
.select{
	display: flex;
	justify-content: center;
}
#memberType{
	background-color: #f8f8f8;
	margin-left: 10px;  /* 왼쪽 여백 추가 (필요에 따라 조정) */
    margin-right: 10px; /* 오른쪽 여백 추가 (필요에 따라 조정) */
    width: 420px;
    padding: 40px 10px;
}
#hr size{
	width: 200px;
}
strong{
	font-size: 20px;
}
hr{
width:300px;
margin: 0 auto;
}
#button-container{
 margin-top: 30px;
}

</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
</head>

<body>
<div id="navigation">
<div>
<img src="/resources/image/join_step2.svg">
<p>약관동의</p>
</div>
<div>
<img src="/resources/image/join_step1_on.svg">
<p>회원유형</p>
</div>
<div>
<img src="/resources/image/join_step4.svg">
<p>정보입력</p>
</div>
<div>
<img src="/resources/image/join_step5.svg">
<p>가입완료</p>
</div>
</div>
<div class="container marketing">
    <div id="space"></div>
    <div class="select">
    <h2>회원유형 선택</h2>
    </div>
    <br>
    <hr>
    <br><br>
    <div class="row">
        <div id="memberType" class="col-lg-4 text-center">
            <img alt="회원가입이미지" src="/resources/image/ico_user.svg" class="img-fluid mb-3">
            <p><strong>일반회원</strong></p>
            <p>일반회원</p>
            <hr>
            <div id="button-container">
            <article>
                <ul class="list-unstyled">
                    <li>
                        <button onclick="location.href='${pageContext.request.contextPath}/users/add.do'" class="btn btn-primary btn-lg">회원가입</button>
                    </li>
                </ul>
            </article>
            </div>
        </div>
        
        <div id="memberType" class="col-lg-4 text-center">
            <img alt="회원가입이미지" src="/resources/image/ico_user.svg" class="img-fluid mb-3">
            <p><strong>SNS회원</strong></p>
            <p>카카오회원</p>
            <hr>
            <div id="button-container">
            <a class="btn-kakao" href="#" data-type="join">
                <img src="/resources/image/kakao_login_large_narrow.png" class="img-fluid" width="150" alt="카카오 로그인 버튼" />
            </a>
            </div>
        </div>
        
        <div id="memberType" class="col-lg-4 text-center">
            <img alt="회원가입이미지" src="/resources/image/ico_user.svg" class="img-fluid mb-3">
            <p><strong>SNS회원</strong></p>
            <p>네이버회원</p>
            <hr>
            <div id="button-container">
            <a class="d-flex justify-content-center btn-naver" href="${url}" data-type="join">
                <img src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" class="img-fluid" width="150" alt="네이버 로그인 버튼">
            </a>
            </div>
        </div>
    </div>
</div>
<%-- <div class="container px-4 py-5"  id="featured-3">
    <h2 class="pb-2 border-bottom">회원유형 선택</h2>
    <div class="row g-4 py-5 row-cols-1 row-cols-lg-3">
        <!-- 일반회원 -->
        <div class="feature col d-flex flex-column align-items-center text-center">
            <h3 class="fs-2 text-body-emphasis">일반회원</h3>
            <img alt="회원가입이미지" src="/resources/image/ico_user.svg" class="img-fluid">
            <a href="#" class="icon-link mt-3">
                <article>
                    <ul class="list-unstyled">
                        <li>
                            <button onclick="location.href='${pageContext.request.contextPath}/users/add.do'" class="btn btn-primary">가입하기</button>
                        </li>
                    </ul>
                </article>
                <svg class="bi"><use xlink:href="#chevron-right"></use></svg>
            </a>
        </div>
        <div class="feature col d-flex flex-column align-items-center text-center">
            <h3 class="fs-2 text-body-emphasis">카카오회원</h3>
            <img alt="회원가입이미지" src="/resources/image/ico_user.svg" class="img-fluid">
            <a class="btn-kakao" href="#" data-type="join">
                <img src="/resources/image/kakao_login_large_narrow.png" width="150" alt="카카오 로그인 버튼" />
            </a>
            <svg class="bi"><use xlink:href="#chevron-right"></use></svg>
        </div>
        <div class="feature col d-flex flex-column align-items-center text-center">
            <h3 class="fs-2 text-body-emphasis">네이버회원</h3>
            <img alt="회원가입이미지" src="/resources/image/ico_user.svg" class="img-fluid">
            <a class="btn-naver" href="${url}" data-type="join">
                <img src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" width="150" alt="네이버 로그인 버튼">
            </a>
            <svg class="bi"><use xlink:href="#chevron-right"></use></svg>
        </div>
    </div>
</div> --%>


<form id="joinFrm" name="joinFrm" method="post" action="/join/insertMember.do">
    <input type="hidden" name="loginType" value="${UsersVo.loginType}">
    <input type="hidden" name="loginId" value="${UsersVo.loginId}">
    <input type="hidden" name="name" value="${UsersVo.name}">
</form>

<!-- jQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>  
<!-- 올바른 카카오 SDK 경로로 수정 -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<script>
$(document).ready(function(){
    //카카오 로그인 버튼
    $(".btn-kakao").click(function(){
        const type = $(this).data("type"); // data-type의 속성인 join을 가져오고 KaKaLogin 함수의 인자로 전달
        kakaoLogin(type);
        return false;
    });
});

//카카오 키 정보 입력
Kakao.init('4db53477384f18eac87ac0d203f32fab');

// 카카오 로그인 함수
function kakaoLogin(type) {
    Kakao.Auth.login({
        success: function (response) {
            Kakao.API.request({
                url: '/v2/user/me',
                success: function (res) {
                    document.joinFrm.loginType.value = "KAKAO"; // 로그인타입 설정
                    document.joinFrm.loginId.value = res.id; // 로그인 아이디 설정
                    document.joinFrm.name.value = res.kakao_account.profile.nickname; // 사용자 이름 설정
                    document.joinFrm.submit();
                },
                fail: function (error) {
                    console.log(error);
                },
            });
        },
        fail: function (error) {
            console.log(error);
        },
    });
}
</script>

</body>
</html>