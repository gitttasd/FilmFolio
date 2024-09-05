<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>     
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
        <h1>회원가입</h1>
        <form:form modelAttribute="UsersVo" action='${pageContext.request.contextPath}/users/add.do' method="post">
            <div class="form-group">
            	아이디:<form:input path="loginId" id="id"/>
            	<!-- 중복확인 버튼 -->
            	<button type="button" onclick="checkId()">중복확인</button>
            	<span id="idMessage"></span>
            	<!-- 중복확인 끝 -->
            	<form:errors path="loginId"></form:errors>
            </div>
            <div class="form-group">
            	비밀번호:<form:password path="password"/>
     			<form:errors path="password"></form:errors>
            </div>
            <div class="form-group">
            	이름:<form:input path="name"/>
     			<form:errors path="name"></form:errors>
            </div>
            <div class="form-group">
                이메일:<form:input path="email"/>
                <form:errors path="email"></form:errors>
            </div>
            <button type="submit">가입하기</button>
        </form:form>
    </div>
    

	<!-- 중복확인 소스 -->    
    
    <script type="text/javascript">
    
    function checkId() {
    	var id = document.getElementById("id").value;
    	console.log(id);
    	var xhr = new XMLHttpRequest();
    	xhr.open("GET","${pageContext.request.contextPath}/users/checkId.do?loginId="+encodeURIComponent(id),true);
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState === XMLHttpRequest.DONE){
				if(xhr.status ===200){
					try{
						var jsonResponse = JSON.parse(xhr.responseText);
						var message = jsonResponse.exists ? "아이디가 이미 존재합니다." : "아이디를 사용 할 수 있습니다.";
						document.getElementById("idMessage").innerText= message;
					} catch(e){
						console.error("Invalid JSON: ", e);
						console.log("Server response: ", xhr.responseText);
						document.getElementById("idMessage").innerText = "서버 응답이 올바르지 않습니다.";
					}
				} else{
					console.error("Request failed with status: " + xhr.status);
					document.getElementById("idMessage").innerText = "요청실패:"+xhr.status;
				}
			}
		};
		xhr.send();
	}
    
    </script>
    
    

    <%-- <div class="container">
        <h1>회원가입</h1>
        <form action="<c:url value='/users/add.do'/>" method="post">
            <div class="form-group">
                <label for="loginId">회원 아이디:</label>
                <input type="text" id="loginId" name="loginId" required>
            </div>
            
            <div class="form-group">
                <label for="email">이메일:</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="password">비밀번호:</label>
                <input type="password" id="password" name="password" required>
            </div>

            <div class="form-group">
                <label for="name">고객 이름:</label>
                <input type="text" id="name" name="name" required>
            </div>

            <button type="submit">가입하기</button>
        </form>
    </div> --%>
</body>
</html>