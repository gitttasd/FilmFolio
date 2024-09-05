<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Main</title>
</head>
<body>
	<h1>
		Hello FilmFolio!  
	</h1>

	<button onclick="location.href='${pageContext.request.contextPath}/users/login.do'">member login</button>
	
	<P>Button Time</P>
	<div>
		<a href="/diary/list">
			<button type="button">MyDiary List</button>	
		</a>
	</div>
</body>

</html>

<script>
$(document).ready(function()){
	#(".btn-regist").click(function()){
		$("#frm").submit();
		return false;
	});
});


</script>