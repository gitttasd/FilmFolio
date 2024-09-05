<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyDiary List</title>
</head>
<body>
	<h1>MyDiary List</h1>
	<hr>
	
	
	<div>
		<table border="1">
			<thead>
				<tr>
					<th>순번</th>
					<th>영화ID</th>
					<th>시청날짜</th>
					<th>별점</th>
					<th>제목</th>
					<th>일기쓴날짜</th>
					<th>공개여부</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="list">
					<tr>
						<td>
							${countAll}
						</td>
						<td>${list.movieTitle}</td>
						<td><fmt:formatDate value="${list.watchDate}" pattern="yyyy-MM-dd"/></td>
						<td>${list.rating}</td>
						<td><a href="update/${list.diaryId}">${list.title}</a></td>
						<td><fmt:formatDate value="${list.reviewAt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>${list.openAt}</td>
						<td><a href="delete/${list.diaryId}"><button type="button">삭제</button></a> <a href="update/${list.diaryId}"><button type="button">변경</button></a></td>						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<hr>
	<a href="add"><button type="button">등록</button></a>
</body>
</html>