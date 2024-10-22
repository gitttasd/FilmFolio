<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyDiary 추가</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/diary/css/add.css">
<jsp:include page="../template/header.jsp"></jsp:include>
<body>
	<c:choose>
		<c:when test="${not empty diaryVo.diaryId}">
			<c:set var="mode" value="Diary Update"></c:set>
			<c:set var="changeTitle" value="${diaryVo.title}"></c:set>
			<c:set var="formUrl" value="/diary/update/${diaryVo.diaryId}"></c:set>
			<c:set var="cancelUrl" value="../select/${diaryVo.diaryId}"></c:set>
			<c:set var="buttonText" value="변경"></c:set>
		</c:when>
		<c:otherwise>
			<c:set var="mode" value="Diary Add"></c:set>
			<c:set var="changeTitle" value="${movieVo.title}"></c:set>
			<c:set var="formUrl" value="/diary/add"></c:set>
			<c:set var="cancelUrl" value="/movie/select/${movieVo.id}"></c:set>
			<c:set var="buttonText" value="등록"></c:set>
		</c:otherwise>
	</c:choose>

	<div class="topSpace">
		<div class="container">
			<div class="title my-4">
				<h1 class="title">${mode}</h1><br/>
				<p style="margin-bottom: 0;">[ <span style="font-weight: bold;">${changeTitle}</span> ] 시청한 소감에 대한 일기를 작성해주세요.</p>
			</div>		
		</div>
		<div class="container">
			<div class="shadow bg-body-tertiary rounded">
				<form action="${formUrl}" method="post" id="upForm">
					<c:if test="${empty diaryVo.diaryId}">
						<input type="hidden"  name="loginId" value='${pageContext.request.getSession(false).getAttribute("loginUser").loginId}'/>
						<input type="hidden"  name="id" value="${movieVo.id}"/>
						<input type="hidden"  name="title" value="${movieVo.title}"/>
					</c:if>
					
					<div class="title_wrap d-flex">
						<div class="select_wrap" style="margin-top: 13px;">
							<p class="sel_txt">
								<span>Diary 제목</span>											
							</p>
						</div>
						<input type="text" name="diaryTitle" value="${diaryVo.diaryTitle}" class="board_title_input"/><br/>
						<label for="diaryTitle" class="form-label" id="diaryTitle"></label>					
					</div>
					<div class="title_wrap_noBorder d-flex">
						<div class="select_wrap" style="margin-top: 13px;">
							<p class="sel_txt">
								<span>시청날짜</span>											
							</p>
						</div>
						<input type="date" name="watchDate" value="<fmt:formatDate value="${diaryVo.watchDate}" pattern="yyyy-MM-dd"/>" class="board_title_input" required="required"/><br/>
						<label for="watchDate" class="form-label" id="watchDate"></label>
						<form:errors path="watchDate"/>
						
						<div class="select_wrap" style="margin-top: 13px;">
							<p class="sel_txt">
								<span>별점</span>											
							</p>
						</div>
						<input type="number" name="rating" value="${diaryVo.rating}" class="board_title_input" min="1" max="5"/><br/>
						<label for="rating" class="form-label" id="rating"></label>
						<form:errors path="rating"/>				
					</div>
					<div class="board_title_textarea">
						<div style="margin-left: 10px; margin-right: 10px;">
							<textarea class="form-control content" name="content" id="content" rows="10" placeholder="일기를 작성해주세요">${diaryVo.content}</textarea>
							<label id="content" class="form-label content"></label>
						</div>
						<div class="tag_write">
				            <span>공개 여부</span>
				            <div class="d-flex">
				            	<div class="form-check">
				            		<input type="radio" name="openAt" class="openAt" id="openAtY" value="Y" <c:if test="${diaryVo.openAt == 'Y'}">checked</c:if>/>
				            		<label for="openAt">공개</label>
									<input type="radio" name="openAt" class="openAt" id="openAtN" value="N" <c:if test="${diaryVo.openAt == 'N'}">checked</c:if>/>
				            		<label for="openAt">비공개</label>
								</div>
							</div>
			        	</div>
			        </div>	
				</form>
				<div class="btn_wrap">
		            <a href="${cancelUrl}"><button type="button" class="btn btn-outline-dark">취소</button></a>
		            <button type="submit" class="btn btn-outline-success" id="updateBtn">${buttonText}</button>
	        	</div>
			</div>
		</div>
	</div>
	<div style="margin-bottom: 35%;"></div>
<script src="/resources/diary/add.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<jsp:include page="../template/footer.jsp"></jsp:include>