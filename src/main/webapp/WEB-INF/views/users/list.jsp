<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container{
	margin-top:80px;
}
body{
	font-family: "Noto Sans KR", sans-serif !important;
}

.form-control{
	 width: 250px !important;
}
.form-select{
	width: 150px !important;
	 margin-left: 800px !important;
}
#searchFromBtn{
	width: 80px !important;
}

#searchForm{
	margin-bottom: 20px;
}
th{
	font-size: 15px !important;
}

</style>
<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

 <div class="container">
 
        <h1>회원 리스트</h1>
        
        <!-- 검색기능 -->
        <form id="searchForm"  action="${pageContext.request.contextPath}/users/list.do" class="row g-2 align-items-center">
        <div class="col">
        <select class="form-select" name="searchKey">
        	<option value="loginId">회원아이디</option>
        	<option value="name">이름</option>
        </select>
        </div>
         <div class="col-auto">
        <input type="text" name="searchValue" class="form-control" value="${searchVo.searchValue}" placeholder="검색어 입력"/>
        </div>
        <div class="col-auto">
        <input id="searchFromBtn" class="w-100 btn btn-primary btn-lg" type="submit" value="검색" style="padding-top: 4px; padding-bottom: 4px;">
        </div>
        <input type="hidden" name="currentPageNo" value="1">
  		</form>
  		
  		<!-- 테이블 -->
        <table class="table align-middle">
            <thead>
                <tr>
                    <th scope="col" >회원 아이디</th>
                    <th scope="col" class="text-center">고유 아이디</th>
                    <th scope="col" class="text-center">이메일</th>
                    <th scope="col" class="text-center">이름</th>
                    <th scope="col" class="text-center">가입 상태</th>
                    <th scope="col" class="text-center">생성 날짜</th>
                    <th scope="col" class="text-center">수정 날짜</th>
                    <th scope="col" class="text-center">관리자 여부</th> 
                    <!-- <th scope="col" class="text-center">포인트</th>
                    <th scope="col" class="text-center">수정</th>
                    <th scope="col" class="text-center">삭제</th> -->
                </tr>
            </thead>
          <tbody class="table-group-divider">
    <c:forEach var="user" items="${find}">
        <tr class="align-bottom">
            <td>${user.loginId}</td>
            <td class="text-center">${user.userId}</td>
            <td class="text-center">${user.email}</td>
            <td class="text-center">${user.name}</td>
            <td class="text-center">${user.status}</td>
            <td class="text-center">${user.createdAt}</td>
            <td class="text-center">${user.updatedAt}</td>
            <td class="text-center">${user.adminAt}</td>
            <%-- <td class="text-center">${user.points}</td>
            <td class="text-center">
                <button onclick="location.href='${pageContext.request.contextPath}/users/edit.do?loginId=${user.loginId}'">수정</button>
            </td>
            <td class="text-center">
                <button onclick="location.href='${pageContext.request.contextPath}/users/del.do?UserId=${user.userId}'">삭제</button>
            </td> --%>
        </tr>
    </c:forEach>
</tbody>
        </table>

	<!-- 페이지 네이션 -->
    <nav aria-label="..." class="d-flex justify-content-center">
        <ul class="pagination">
            <c:if test="${searchVo.firstPageNoOnPageList != 1}">
                <li class="page-item">
                    <a class="page-link" href="#" onclick="goPage(${searchVo.firstPageNoOnPageList - 1});">이전</a>
                </li>
            </c:if>
            <c:forEach var="no" begin="${searchVo.firstPageNoOnPageList}" end="${searchVo.lastPageNoOnPageList}" step="1">
                <li class="page-item <c:if test="${no == searchVo.currentPageNo}">active</c:if>">
                    <a class="page-link" href="#" onclick="goPage(${no});">${no}</a>
                </li>
            </c:forEach>

            <c:if test="${searchVo.lastPageNoOnPageList < searchVo.totalPageCount}">
                <li class="page-item">
                    <a class="page-link" href="#" onclick="goPage(${searchVo.lastPageNoOnPageList + 1});">다음</a>
                </li>
            </c:if>
           </ul>
    	</nav>
   </div>

<script type="text/javascript">
    function goPage(pageNo) {
        document.querySelector('[name="currentPageNo"]').value = pageNo;
        document.getElementById('searchForm').submit(); // 폼 제출
    }
</script>
<script type="text/javascript">


var searchKey = '${searchVo.searchKey}';
var searchValue = '${searchVo.searchValue}';

document.addEventListener("DOMContentLoaded", function() {
    if (searchKey) {
        document.querySelector('[name="searchKey"]').value = '${searchVo.searchKey}';
    }
    if (searchValue) {
        document.querySelector('[name="searchValue"]').value = '${searchVo.searchValue}';
    }
});

</script>

	
</body>
</html>