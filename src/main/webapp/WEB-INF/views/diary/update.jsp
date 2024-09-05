<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyDiary Content</title>
</head>
<body>
	<h1>MyDiary Detail</h1>
	<!-- 변경폼과 세부내용 폼을 동일하게 생각 -->
	<div>
		<form action="../update/${diaryVo.diaryId}" method="post">
			<label><input type="hidden" name="diaryId"></label><br/>
			<label>제목<input type="text" name="title" value="${diaryVo.title}"></label><br/>
			
			<label>시청 날짜
				<input type="date" name="watchDate" value="<fmt:formatDate value='${diaryVo.watchDate}' pattern='yyyy-MM-dd'/>">
			</label><br/>
			
			
			<label>별점<input type="number" name="rating" value="${diaryVo.rating}"></label><br/>
			<label>내용<textarea name="content" rows="10" cols="50">${diaryVo.content}</textarea></label><br/>
			<label>일기 작성 날짜
				<input type="datetime" name="reviewAt" value="<fmt:formatDate value='${diaryVo.reviewAt}' pattern='yyyy-MM-dd HH:mm:ss'/>" readonly="readonly">
			</label><br/>
			<label>공개 여부
				<c:if test="${diaryVo.openAt == 'Y'}">
					<input type="radio" value="Y" checked="checked" name="openAt">공개
					<input type="radio" value="N" name="openAt">비공개
				</c:if>
				<c:if test="${diaryVo.openAt == 'N'}">
					<input type="radio" value="Y" name="openAt">공개
					<input type="radio" value="N" checked="checked" name="openAt">비공개
				</c:if>			
			</label><br/>
			<hr>
			<button type="submit">변경</button>
			<a href="../list"><button type="button">목록</button></a>
			<button type="button" id="showRepl">댓글보기</button>
		</form>
	</div>
	
	
<!-- 댓글 부분 -->
	<div>
		<hr/>
		<div class="replList"></div>
		
		<template id="replTemp">
			<div class="diaryReplUser"></div>
			<div class="diaryReplContent"></div>
			<div class="diaryReplAt"></div>
			<button type="button" class="del">삭제</button>
		</template>
	</div>
	
	<script>
	var replTemp = document.querySelector('#replTemp');
	var replList = document.querySelector('.replList');
	var diaryReplContent = document.querySelector('#diaryReplContent');
	var diaryReplOpen = document.querySelector('#diaryReplOpen');
	
	document.querySelector('#showRepl').onclick = function refreshList(){
		fetch('${pageContext.request.contextPath}/diaryRepl/list/${diaryVo.diaryId}',{
			method: 'GET',
			headers: {'Accept':'application/json'}
		})
		
		.then(resp => resp.json())

		.then(function(data){
			console.log(data);
			var repListHtml ='';
				
			replList.innerHTML = '';
			
			//list 출력
			for (var i = 0; i < data.length; i++) {
				var v = data[i];
				var rt = replTemp.content.cloneNode(true);
				
				rt.querySelector('.diaryReplUser').textContent = v.diaryReplUser;
				rt.querySelector('.diaryReplContent').textContent = v.diaryReplContent;
				rt.querySelector('.diaryReplAt').textContent = v.diaryReplAt;
				
				/*
					if(v.diaryReplUser === '${sessionScope.loginUser.memId}'){ //''를 붙여야 변수로 나오지 않음
						rt.querySelector('.del').setAttribute('data-no', v.repNo);
						rt.querySelector('.del').onclick = delReply; //delReply() ->는 안됨, 저 메소드 실행 후,  return 값을 넣기 때문
					}else {
						rt.querySelector('.del').remove();
					}
				*/
				rt.querySelector('.del').remove();
				
				replList.append(rt);
			}
			
		})
		.catch(function(err) { //요청 처리가 실패한 경우 실행할 함수
			console.log(err); //발생한 오류 정보가 인자로 전달
			alert('댓글 목록 조회 실패');
		});
	}
	//refreshList();
	</script>

</body>
</html>