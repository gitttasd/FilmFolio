<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	

	<script>
	
	
	</script>

	<hr/>
	<c:choose>
		<c:when test="${not empty diaryReplVo.diaryReplId}">
			<c:set var="replUrl" value="/diaryRepl/update"></c:set>
		</c:when>
		<c:otherwise>
			<c:set var="replUrl" value="/diaryRepl/add"></c:set>
		</c:otherwise>
	</c:choose>
	<!-- 등록폼과 변경폼을 동일하게 생각 -->
	<div>
		<form action="${replUrl}" method="post">
			<input type="hidden" name="diaryId">
			<input type="hidden" name="diaryReplId">
			<input type="hidden" name="diaryReplUser">
			<label>댓글쓰기 <input type="text" id="diaryReplContent" name="diaryReplContent" placeholder="댓글 쓰기"></label>
			<input type="hidden" name="diaryReplAt">
			<label>공개여부
				<c:choose>
					<c:when test="${not empty diaryReplVo.diaryReplOpen}">
						<c:if test="${diaryReplVo.diaryReplOpen == 'Y'}">
							<input type="radio" value="Y" checked="checked" id="diaryReplOpen" name="diaryReplOpen">공개
							<input type="radio" value="N" name="diaryReplOpen">비공개
						</c:if>
						<c:if test="${diaryReplVo.diaryReplOpen == 'N'}">
							<input type="radio" value="Y" name="diaryReplOpen">공개
							<input type="radio" value="N" checked="checked" id="diaryReplOpen" name="diaryReplOpen">비공개
						</c:if>
					</c:when>
					<c:otherwise>
						<input type="radio" value="Y" checked="checked" name="diaryReplOpen">공개
						<input type="radio" value="N" name="diaryReplOpen">비공개
					</c:otherwise>
				</c:choose>
			</label>
			<div>
				<button type="submit">저장</button>
			</div>
		</form>
	</div>

</body>
</html>