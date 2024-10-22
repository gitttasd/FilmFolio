<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<header data-bs-theme="light">
	<nav class="navbar navbar-expand-md navbar-light bg-light fixed-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="/">FilmFolio</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="navbar-nav me-auto mb-2 mb-md-0">
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="/">Home</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/movie/list">MovieList</a>
				</li>
				<li class="nav-item">
					<select name="movieSearch" class="form-select me-2" id="navSearchOption" aria-label="Default select example">
						<option value="0">선택</option>
						<option value="1">영화제목</option>
						<option value="2">인물</option>
					</select>
				</li>				
				<li class="d-flex" role="search">
					<input class="form-control me-2" id="navSearchKey" type="search" placeholder="Search" aria-label="Search">
					<a href="" id="navSearch"><button class="btn btn-outline-dark" type="button" id="navSearchBtn">search</button></a>	
				</li>
        	</ul>
	        <div class="text-end">
	       		<c:if test='${pageContext.request.getSession(false).getAttribute("loginUser") == null}'>
					<button type="button" class="btn btn-outline me-4" onclick="location.href='${pageContext.request.contextPath}/login/login.do'" style="width: 130px;">Login</button>
	          	</c:if>
	          	<c:if test='${pageContext.request.getSession(false).getAttribute("loginUser") != null}'>
	          		<div class="dropdown">
	          			<button type="button" class="btn btn-outline-secondary me-4 dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" style="width: 130px;">${pageContext.request.getSession(false).getAttribute("loginUser").name} 님</button>
	
		          		<ul class="dropdown-menu dropdown-menu-end">
	          			 	<c:choose>
	          			 		<c:when test="${pageContext.request.getSession(false).getAttribute('loginUser').adminAt == 'Y'}">
	          			 			<li><a class="dropdown-item" href="${pageContext.request.contextPath}users/list.do">회원관리 페이지</a></li>
	          			 		</c:when>
	          			 		<c:otherwise>
	          			 			<li><a class="dropdown-item" href="/diary/list">MyDiary List</a></li>
	          			 			<li><a class="dropdown-item" href="/users/edit.do">MyPage</a></li>
	          			 		</c:otherwise>
	          			 	</c:choose>
		          			 <li><hr class="dropdown-divider"></li>
		          			 <li><a class="dropdown-item" href="#" id="logout">LogOut</a></li>
		          		</ul>
		          	</div>
	    		</c:if>
	        </div>
      	</div>
    </div>
  </nav>
</header>
<!-- 카카오 SDK 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
	// 카카오 키 정보 입력
	Kakao.init('4db53477384f18eac87ac0d203f32fab');
	
	// 로그아웃 버튼 클릭 이벤트 처리
	document.getElementById('logout').addEventListener('click', function() {
	    Kakao.Auth.logout(function() {
	        console.log('카카오 로그아웃 완료');
	        alert('로그아웃 되었습니다.');
	        // 서버 로그아웃 처리 후 페이지 리디렉션
	        window.location.href = '${pageContext.request.contextPath}/login/logout.do';
	    });
	});
</script>