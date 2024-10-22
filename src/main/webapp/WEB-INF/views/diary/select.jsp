<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyDiary Content</title>
</head>
<link rel="stylesheet" href="/resources/diary/css/add.css">
<jsp:include page="../template/header.jsp"></jsp:include>
<body>
	<div class="topSpace">
		<div class="container">
			<div class="title my-4">
				<h1 class="title">Diary Detail</h1>		
			</div>
		</div>
		<div class="container">
			<p class="qs_title" style="margin-top:30px">
				<span>${diaryVo.diaryTitle}</span>
            </p>
            <div class="qs_info_wrap">
				<span class="qs_id" id="loginId">${diaryVo.loginId}</span>
                <img src="/resources/image/free-icon-font-user-3917688.png" class="mx-2" alt="글쓴이" style="width: 20px;"/>
                <c:if test="${diaryVo.openAt == 'N'}">
					<img src="/resources/image/free-icon-font-lock-3917591.png" class="mx-2" alt="비공개" style="width: 20px;"/>                  
                </c:if>
                <div class="qs_info">
                    <p><img src="/resources/image/free-icon-font-star-3916582.png" alt="별점" style="width: 20px;">${diaryVo.rating}</p>
                    <p class="last me-2"><img src="/resources/image/free-icon-font-eye-3917052.png" alt="작성 시간" style="width: 20px;"><fmt:formatDate value='${diaryVo.watchDate}' pattern='yyyy-MM-dd'/></p>
               	</div>
			</div>
            <div class="qs_text">
				<p>${diaryVo.content}</p>
            </div>
            <div class="qs_empathy_wrap">
				<div class="empathy_info">
					<a style="cursor: pointer;"><img src="/resources/image/free-icon-font-following-3917706.png" alt="공감하기 버튼" id="goodBtn" data-no="${diaryVo.diaryId}"></a>
			    </div>
			</div>
			<div class="qs_info_wrap">
				<c:if test='${pageContext.request.getSession(false).getAttribute("loginUser").loginId == diaryVo.loginId}'>			
					<button type="button" class="btn" id="diaryEdit">변경</button>
				</c:if>
				<a href="../list"><button type="button" class="btn">목록</button></a>
				<button type="button" id="writeBtn" class="btn" data-bs-toggle="writeModal" data-bs-target="#writeModal">댓글 쓰기</button>
                <div class="qs_info">
					<p><img src="/resources/image/free-icon-font-heart.png" alt="추천수" style="width: 20px;">${diaryVo.point}</p>
                    <p class="last me-2"><img src="/resources/image/free-icon-font-calendar-3917292.png" alt="시청 시간" style="width: 20px;"><fmt:formatDate value='${diaryVo.reviewAt}' pattern='yyyy-MM-dd HH:mm'/></p>
               	</div>
			</div>
			<!-- 댓글 보기 -->
			<div class="container">
				<div class="reply_wrap">
					<div class="reply_title">
						<h2>댓글<span id="replCount"></span></h2>
					</div>
					<div>
						<ul class="reply_ul replList"></ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 댓글 쓰기 -->
	<div class="modal fade" id="writeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">댓글 쓰기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
		  			<div class="newRepl"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-outline-primary" id="addBtn"></button>
				</div>
			</div>
		</div>
	</div>
	
<!-- 댓글 쓰기 template -->	
<template id="replTemp">
	<form id="replForm">
		<div id="diaryReplUserDiv" class="input-group">
			<div class="input-group-text">작성자</div>
			 <input type="text" class="form-control" id="diaryReplUserModal" name="diaryReplUser" readonly="readonly" />
		</div>
		<br />
		<div id="diaryReplContentDiv">
			<textarea id="diaryReplContentModal" rows="3" readonly="readonly" placeholder="댓글을 입력해주세요" style="width: 100%"></textarea>
		</div>
		<br />
		<div id="diaryReplAtDiv" class="input-group">
			<div class="input-group-text">작성 날짜</div>
			<input type="date" class="form-control" id="diaryReplAtModal" readonly="readonly" />
		</div>
		<br />
		<div id="diaryReplOpenDiv" style="pointer-events: none;" class="input-group">
			<div class="input-group-text">공개 여부</div>
			<div class="form-check" style="padding-bottom: 8px;">
	    		<input type="radio" id="diaryReplOpenModalY" class="diaryReplOpenModal" name="diaryReplOpen" value="Y"/>
	    		<label for="diaryReplOpenModalY">공개</label>
	    		
	    		<input type="radio" id="diaryReplOpenModalN" class="diaryReplOpenModal" name="diaryReplOpen" value="N"/>
	    		<label for="diaryReplOpenModalN">비공개</label>
	    	</div> 
		</div>
	</form>
</template>

<!-- 댓글 보기 template -->
<template id="replListTemp">
	<li style="pointer-events: none; list-style-type: none;">
		<div class="reply">
			<div class="common_char_id d-flex">
			    <p id="diaryReplUser"><img src="" alt="">작성자Id</p>
			    <span id="diaryReplAt"></span>
			</div>
			<ul class="reply_btn_wrap"></ul>
			<div class="reply_text" id="diaryReplContent">댓글 내용</div>
		</div>
		<div class="" style="float: right;">
			<button type="button" class="btn btn-sm btn-outline-success" id="replUpdBtn">변경</button>
			<button type="button" class="btn btn-sm btn-outline-danger" id="replDelBtn">삭제</button>
		</div>
	</li>
</template>

	<div style="margin-bottom : 80%;"></div>
	<div class="box"></div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="/resources/diary/select.js"></script>
</body>
</html>