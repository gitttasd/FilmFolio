<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>     
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
  /* 화면 높이 100% 적용 */
  html, body {
    height: 100%;
  }

  /* 폼을 가운데 정렬하기 위한 스타일 */
  .form-container {
    display: flex;
    justify-content: center; /* 가로 가운데 정렬 */
    align-items: center; /* 세로 가운데 정렬 */
    margin-top: 80px;
  }

  .form-box {
    width: 100%;
    max-width: 500px; /* 폼의 최대 너비 설정 */
  }
    .error-message {
    color: red;
  }
  #navigation{
	display: flex;
	margin: 0 auto; /* 양쪽 여백을 자동으로 설정하여 중앙 정렬 */
	max-width: 900px; /* 최대 너비 설정 (필요에 따라 조정) */
	justify-content: space-around;
	align-items: center; /* 수직 정렬 */
	margin-top:30px;	
}
#hr size{
	width: 200px;
}
</style>
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
<img src="/resources/image/join_step4_on.svg">
<p>정보입력</p>
</div>
<div>
<img src="/resources/image/join_step5.svg">
<p>가입완료</p>
</div>
</div>
<!-- 폼을 가운데 정렬하는 div -->
<div class="form-container">
    <div class="form-box">
        <h1 class="mb-3 text-center">회원가입</h1>
        <br>
        <hr>
        <br>
        <form:form modelAttribute="UsersVo" action='${pageContext.request.contextPath}/users/add.do' method="post" class="needs-validation" novalidate="">
            <div class="row g-3">
                <!-- 아이디 입력 및 중복확인 -->
                <div class="col-12 form-group">
                    <label for="loginId" class="form-label">아이디</label>
                    <form:input path="loginId" class="form-control" id="id"/>
                    <button type="button" class="btn btn-secondary mt-2" onclick="checkId()">중복확인</button>
                    <span id="idMessage" class="error-message"></span>
                    <form:errors path="loginId" cssClass="error-message"></form:errors>
                </div>

                <!-- 비밀번호 입력 -->
                <div class="col-12 form-group">
                    <label for="password" class="form-label">비밀번호</label>
                    <form:password path="password" class="form-control" id="password"/>
                    <form:errors path="password" cssClass="error-message"></form:errors>
                </div>

                <!-- 이름 입력 -->
                <div class="col-12 form-group">
                    <label for="name" class="form-label">이름</label>
                    <form:input path="name" class="form-control" id="name"/>
                    <form:errors path="name" cssClass="error-message"></form:errors>
                </div>

                <!-- 이메일 입력 -->
                <div class="col-12 form-group">
                    <label for="email" class="form-label">이메일 <span class="text-body-secondary"></span></label>
                    <form:input path="email" class="form-control" id="email" placeholder="you@example.com"/>
                    <form:errors path="email" cssClass="error-message"></form:errors>
                </div>
            </div>

            <hr class="my-4">

            <!-- 제출 버튼 -->
            <button class="w-100 btn btn-primary btn-lg" type="submit">가입하기</button>
        </form:form>
    </div>
</div>

<!-- 중복확인 스크립트 -->
<script type="text/javascript">
function checkId() {
    var id = document.getElementById("id").value;
    console.log(id);
    var xhr = new XMLHttpRequest();
    xhr.open("GET","${pageContext.request.contextPath}/users/checkId.do?loginId="+encodeURIComponent(id),true);
    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");

    xhr.onreadystatechange = function(){
        if(xhr.readyState === XMLHttpRequest.DONE){
            if(xhr.status === 200){
                try {
                    var jsonResponse = JSON.parse(xhr.responseText);
                    var message = jsonResponse.exists ? "아이디가 이미 존재합니다." : "아이디를 사용할 수 있습니다.";
                    document.getElementById("idMessage").innerText = message;
                } catch(e){
                    console.error("Invalid JSON: ", e);
                    console.log("Server response: ", xhr.responseText);
                    document.getElementById("idMessage").innerText = "서버 응답이 올바르지 않습니다.";
                }
            } else {
                console.error("Request failed with status: " + xhr.status);
                document.getElementById("idMessage").innerText = "요청 실패: " + xhr.status;
            }
        }
    };
    xhr.send();
}
</script>

</body>
</html>
