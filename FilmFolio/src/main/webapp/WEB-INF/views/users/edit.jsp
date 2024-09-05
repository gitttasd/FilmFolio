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
        <h1>ȸ������</h1>
        <form action="<c:url value='/users/edit.do'/>" method="post">
            <div class="form-group">
                <label for="loginId">ȸ�� ���̵�:</label>
                <input type="text" id="loginId" name="loginId" value="${edit.loginId}" required>
            </div>
            
            <div class="form-group">
                <label for="email">�̸���:</label>
                <input type="email" id="email" name="email" value="${edit.email}" required>
            </div>

            <div class="form-group">
                <label for="password">��й�ȣ:</label>
                <input type="password" id="password" name="password" value="${edit.password}" required>
            </div>

            <div class="form-group">
                <label for="name">�� �̸�:</label>
                <input type="text" id="name" name="name" value="${edit.name}" required>
            </div>
            
            <div class="form-group">
                <input type="hidden" id="userId" name="userId" value="${edit.userId}" required>
            </div>
           

            <button type="submit">�����Ϸ�</button>
        </form>
    </div>
</body>
</html>