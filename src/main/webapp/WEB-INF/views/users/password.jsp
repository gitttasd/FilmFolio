<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
#navigation{
	display: flex;
	margin: 0 auto; /* 양쪽 여백을 자동으로 설정하여 중앙 정렬 */
	max-width: 900px; /* 최대 너비 설정 (필요에 따라 조정) */
	justify-content: space-around;
	align-items: center; /* 수직 정렬 */
	margin-top:30px;
	
}

#container{
	display: flex;
	flex-direction: column; /* 세로 방향으로 배치 */
    align-items: center; /* 가로 방향 가운데 정렬 */
    justify-content: center; /* 세로 방향 가운데 정렬 */
    margin: 0 auto; /* 양쪽 여백을 자동으로 설정하여 중앙 정렬 */
    margin-top:70px;
    max-width: 2000px; /* 최대 너비 설정 (필요에 따라 조정) */
    background-color: white; /* 배경색 */
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    padding: 20px;    
}

body{
	font-family: "Noto Sans KR", sans-serif;
	background-color: #f8f8f8;
}

.f1{
	font-size: 13px;
	margin-top: 10px;
}

#space{
	margin-top: 10px;
	font-size: 25px;
}

.space{
	margin-top: 20px;
	margin-bottom:30px;
}

#btn_next{
	background-color: #007bff;
	 color: white; /* 버튼 텍스트 색상 */ 
	 border: none;
	 border-radius: 5px;
	 padding: 10px 7px; /* 패딩 */
	 cursor: pointer;
	 width: 100px;
	 font-size: 20px;
	 margin-bottom: 50px;
	 
}

.button-container{
	display: flex;
	justify-content: center;
}

.checkbox-container{
	display: flex;
	justify-content: center;
	align-items: center; /* 가로 방향 가운데 정렬 */
	align-items: baseline;
}

button.btn_next:hover {
        background-color: #0056b3; /* 마우스 오버 시 색상 변화 */
    }

em{
	color:#005500;
	font-size: 28px;
}
p{
font-size: 25px;
}


   
</style>

<!-- 구글폰트 -->
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
<img src="/resources/image/join_step1.svg">
<p>회원유형</p>
</div>
<div>
<img src="/resources/image/join_step4.svg">
<p>정보입력</p>
</div>
<div>
<img src="/resources/image/join_step5_on.svg">
<p>가입완료</p>
</div>
</div>

<div id="container">
<img alt="가입완료 이모티콘" src="/resources/image/check1.jpg" width="100px" height="100px">
<h1>회원가입 완료</h1>
<p class="space">"<em>로그인 후</em> 사용해 주시기 바랍니다.”</p>

<div>
    
    <div>
    	<button id="btn_next" onclick="location.href='/login/login.do'">로그인</button>
    	<span class="spanSpace" style="display: inline-block; width: 10px;"></span>
        <button id="btn_next" onclick="location.href='/'">홈으로</button> 
    </div>
</div>
</div>

<script type="text/javascript">

</script>
</body>
</html>