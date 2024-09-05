<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyDiary 추가</title>
</head>
<body>
	<h1>MyDiary 추가</h1>
	
	<div>
		<form:form modelAttribute="diaryVo">
			<form:hidden path="diaryId"/><br/>
			
			<form:label path="title">제목</form:label>
			<form:input  path="title"/>
			<form:errors path="title"/><br/>
			
			<form:label path="movieTitle">영화이름</form:label>
			<form:input path="movieTitle"/><br/>

			<form:label path="watchDate">시청날짜</form:label>
			<input type="date" name="watchDate" id="watchDate" required="required" />
			<form:errors path="watchDate"/><br/>
			
			<form:label path="rating">별점</form:label>
			<input type="number" name="rating" id="rating" />
			<form:errors path="rating"/><br/><hr/>

			<form:label path="content">내용</form:label><br/>
			<form:textarea path="content" cols="80" rows="30"/>
			<form:errors path="content"/><br/>
			
			<form:radiobutton path="openAt" value="Y" label="공개"/>
			<form:radiobutton path="openAt" value="N" label="비공개" checked="checked" />
			
			<form:hidden path="reviewAt"/><br/><hr/>
			
			<form:button type="submit">등록</form:button>
		</form:form>	
	</div>
</body>
</html>