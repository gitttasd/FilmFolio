<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyDiary List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/diary/css/diaryList.css">
</head>
<jsp:include page="../template/header.jsp"></jsp:include>
<body>
	<div class="topSpace">	
		<div class="container">
			<h1 class="title my-4">MyDiary List</h1>
		</div>
		<div class="container tableHigh">
			<table class="table table-warning table-striped table-hover caption-right text-center align-middle">
				<thead>
					<tr>
						<th scope="col">순번</th>
						<th scope="col" colspan="2">영화</th>
						<th scope="col">시청날짜</th>
						<th scope="col">별점</th>
						<th scope="col">제목</th>
						<th scope="col">일기쓴날짜</th>
						<th scope="col">공개여부</th>
						<th scope="col" colspan="2">관리</th>
					</tr>
				</thead>
				<tbody class="table-striped table-hover">
					<c:forEach items="${list}" var="list" varStatus="i">
						<tr>
							<td>${i.count}</td>	
							<td><a href="/movie/select/${list.id}">
									<img id="movieImg" class="my-0" data-id="${list.id}" alt="" src="" width="30px;"/>
								</a></td>
							<td><a href="/movie/select/${list.id}" style="text-decoration: none; color: black;">${list.title}</a></td>
							<td><fmt:formatDate value="${list.watchDate}" pattern="yyyy-MM-dd"/></td>
							<td>${list.rating}</td>
							<td><a href="select/${list.diaryId}" style="text-decoration: none;">${list.diaryTitle}</a></td>
							<td><fmt:formatDate value="${list.reviewAt}" pattern="yyyy-MM-dd"/></td>
							<td>${list.openAt}</td>
							<td>
								<a href="delete/${list.diaryId}"><img alt="삭제" src="/resources/image/free-icon-font-trash-3917378.png" class="mx-2" id="delBtn" data-name="${list.diaryTitle}" style="width: 25px;"/></a>
								<a href="update/${list.diaryId}"><img alt="변경" src="/resources/image/free-icon-font-pencil-3917376.png" class="mx-2" id="editBtn" data-name="${list.diaryTitle}"  style="width: 25px;"/></a>
							</td>						
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<caption>작성한 일기 수 <span>${diaryTotal}</span> 건</caption>
				</tfoot>
			</table>
			<div class="container">
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a 
							<c:choose>
								<c:when test="${searchVo.lastPageNoOnPageList == 1}">
									class="page-link disabled"
								</c:when>
								<c:otherwise>
									class="page-link"
								</c:otherwise>
							</c:choose>
								href="#" id="first" onclick="goPage(${searchVo.firstPageNoOnPageList});">처음</a></li>
						<li class="page-item"><a 
							<c:choose>
								<c:when test="${searchVo.firstPageNoOnPageList != 1}">
									class="page-link"
								</c:when>
								<c:otherwise>
									class="page-link disabled"
								</c:otherwise>
							</c:choose>
							 id="before" href="#" onclick="goPage(${searchVo.firstPageNoOnPageList - 1});" >이전</a>
						</li>
						<c:forEach var="no" begin="${searchVo.firstPageNoOnPageList}" end="${searchVo.lastPageNoOnPageList}" step="1">
			                <li class="page-item <c:if test="${no == searchVo.currentPageNo}">active</c:if>">
			                    <a class="page-link" href="#" onclick="goPage(${no});">${no}</a>
			                </li>
			            </c:forEach>
						<li class="page-item"><a 
							<c:choose>
								<c:when test="${searchVo.lastPageNoOnPageList < searchVo.totalPageCount}">
									class="page-link"
								</c:when>
								<c:otherwise>
									class="page-link disabled"
								</c:otherwise>
							</c:choose>
								href="#" id="next" onclick="goPage(${searchVo.lastPageNoOnPageList + 1});">다음</a>
						</li>
						<li class="page-item"><a 
							<c:choose>
								<c:when test="${searchVo.lastPageNoOnPageList == searchVo.totalPageCount}">
									class="page-link disabled"
								</c:when>
								<c:otherwise>
									class="page-link"
								</c:otherwise>
							</c:choose>
								href="#" id="last" onclick="goPage(${searchVo.lastPageNoOnPageList + 1});">마지막</a>
						</li>
					</ul>
				</nav>
			</div>
			<div>
				<a href="/movie/list"><button type="button" id="addBtn" class="btn">등록</button></a>
				<a href="/"><button type="button" id="mainBtn" class="btn">메인으로</button></a>
			</div>
		</div>
	</div>
	
<script src="/resources/diary/list.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>