<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <div class="container">
        <h1>회원가입</h1>
        <form action="<c:url value='/users/edit.do'/>" method="post">
            <div class="form-group">
                <label for="loginId">회원 아이디:</label>
                <input type="text" id="loginId" name="loginId" value="${edit.loginId}" required>
            </div>
            
            <div class="form-group">
                <label for="email">이메일:</label>
                <input type="email" id="email" name="email" value="${edit.email}" required>
            </div>

            <div class="form-group">
                <label for="password">비밀번호:</label>
                <input type="password" id="password" name="password" value="${edit.password}" required>
            </div>

            <div class="form-group">
                <label for="name">고객 이름:</label>
                <input type="text" id="name" name="name" value="${edit.name}" required>
            </div>
            
            <div class="form-group">
                <input type="hidden" id="userId" name="userId" value="${edit.userId}" required>
            </div>
           

            <button type="submit">수정완료</button>
        </form>
    </div>
</body>
</html>