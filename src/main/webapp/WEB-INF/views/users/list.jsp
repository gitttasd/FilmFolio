<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.container {
    width: 80%;
    margin: auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    color: #333;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
}

table, th, td {
    border: 1px solid #ddd;
}

th, td {
    padding: 12px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
    color: #333;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}

tr:hover {
    background-color: #f1f1f1;
}
</style>

</head>
<body>
<body>
 <div class="container">
        <h1>회원 리스트</h1>
        <table>
            <thead>
                <tr>
                    <th>회원 아이디</th>
                    <th>고객 고유 아이디</th>
                    <th>이메일</th>
                    <th>고객 이름</th>
                    <th>회원 탈퇴 여부</th>
                    <th>생성 날짜</th>
                    <th>수정 날짜</th>
                    <th>관리자 여부</th>
                    <th>소유 포인트</th>
                    <th>수정</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${find}">
                    <tr>
                        <td>${user.loginId}</td>
                        <td>${user.userId}</td>
                        <td>${user.email}</td>
                        <td>${user.name}</td>
                        <td>${user.status}</td>
                        <td>${user.createdAt}</td>
                        <td>${user.updatedAt}</td>
                        <td>${user.adminAt}</td>
                        <td>${user.points}</td>
                        <td><button onclick="location.href='${pageContext.request.contextPath}/users/edit.do?loginId=${user.loginId}'">edit</button></td>
                        <td><button onclick="location.href='${pageContext.request.contextPath}/users/del.do?UserId=${user.userId}'">delete</button></tr>
                </c:forEach>
            </tbody>
        </table>
		<button onclick="location.href='${pageContext.request.contextPath}/users/add.do'">회원가입</button>
		
    </div>
</body>
</body>
</html>