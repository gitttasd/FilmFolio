<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Detail</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
.custom-height {
    height: 300px; /* 원하는 높이로 설정 */
}
.custom-height img {
    max-height: 300px; /* 이미지 크기 제한 */
}
li{
list-style-type: none;
}
#contentHidden {
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 1; /* 2줄로 제한 */
    overflow: hidden;
    text-overflow: ellipsis;
}

</style>
</head>
<jsp:include page="../template/header.jsp"></jsp:include>
<body style="margin-top: 100px;">
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="row custom-height g-0 border rounded overflow-hidden flex-md-row mb-2 shadow-sm position-relative">
				<div class="col-auto d-none d-lg-block">
					<img alt="" src="" class="bd-placeholder-img">
				</div>
				<div class="col mx-4 d-flex flex-column position-static">
					<input type="hidden" name="movieId" value="${movieVo.id}" id="movieId"/>
					<h3 class="my-2" id="title"></h3>
					<div class="mb-1 text-body-secondary" id="release_date"></div>
					<ul class="mb-0 d-flex flex-row" id="genre" style="padding: 0;"></ul>
					<hr style="margin: 8px;" />
					
					<div class="mb-auto text-body-secondary" id="overview"></div>
	    		</div>
			</div>
	    </div>
        <div class="mt-3">
            <a href="/"><button type="button" class="btn btn-outline-success my-2">처음으로</button></a>
            <button type="submit" class="btn btn-outline-success my-2" id="diaryWr">일기 작성하기</button></a>
        </div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<table border="1" class="table">
				<thead>
					<tr>
					 	<th colspan="5">총 게시물 수 <span>${movieCountAll}</span> 건</th>
					</tr>
					<tr>
						<th width="60px;">순번</th>
						<th width="130px;">일기제목</th>
						<th>일기내용</th>
						<th width="130px;">일기쓴날짜</th>
						<th colspan="2" width="100px;">추천수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${diaryOpenList}" var="list" varStatus="i">
						<tr>
							<td>${i.count}</td>
							<td ><p id="contentHidden"><a href="/diary/select/${list.diaryId}" class="diarySh" data-diaryId="${list.diaryId}">${list.diaryTitle}</a></p></td>
							<td><p id="contentHidden">${list.content}</p></td>	
							<td><fmt:formatDate value="${list.reviewAt}" pattern="yyyy-MM-dd"/></td>
							<td>
								<div class="d-flex align-items-center">
									<span class="me-2">${list.point}</span>
									<button type="button" class="btn btn-outline-light" id="goodBtn" data-idInp="${list.diaryId}">
										<img alt="좋아요" src="/resources/image/free-icon-font-heart.png"  style="width: 20px; height: 20px;"/>
									</button>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				
			</table>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="/resources/movie/select.js"></script>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>
