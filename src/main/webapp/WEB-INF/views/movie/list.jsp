<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/movie/css/list.css">
</head>
<jsp:include page="../template/header.jsp"></jsp:include>
<body style="background : white; margin-top: 100px;">
	<div class="container" style="margin-bottom:10px;">
		<h2 style="text-align: center; color:black;">Movie Search</h2>
	</div>
	<hr id="hrLine" />
	<div class="container d-flex">
		<p class="my-2" id="result"><span id="searchResult"></span>에 대한 영화 검색 결과입니다.</p>
		<button type="button" id="cleanBtn" class="btn btn-sm btn-outline-light me-2 ms-auto">검색 초기화</button>
	</div>
	
	<template id="movieTemplate">
			<li>
				<a class="ProductItem_link__Xbuct" href="" id="selectIcon" style="text-decoration: none;">
					<div class="ProductItem_poster_wrap__85V06">
						<div class="Thumbnail_image_wrap__KWHAU Thumbnail_type_xs__KTMV9">
							<div class="LazyImage_root__GexeS" style="width: 124px; height: 166px;">
								<div class="LazyImage_imageWrap__Hc0hs LazyImage_loaded__NkzN2" id="card">
									<img class="Thumbnail_image__TxHd0" alt="" src="">
								</div>
							</div>
						</div>
					</div>
					<div class="ProductItem_info_wrap__S_v7z">
						<strong class="ProductItem_title__1vfcf" id="font"></strong>
						<div class="ProductItem_info_area__WlhJQ">
							<div class="ProductItem_info_item___jLcl" id="gernes"></div>
							<span class="ProductItem_info_item___jLcl" id="release_date"></span>
						</div>
						<div class="ProductItem_description__4I0Ln" id="overview"></div>
						<div class="ProductItem_price_group__3PJi0">
							<div class="Price_price_area__DmygU Price_accent__69Ygv">
								<div class="Price_price_group__ekquZ">
								</div>
							</div>
						</div>
					</div>
				</a>
			</li>
	</template>
	
	<div class="container">
		<ul id="movieListContainer"></ul>
	</div>
	<ul class="pageContainer pagination justify-content-center" >
	    <li class="page-item"><a class="page-link" href="/movie/list?page=1" id="first">처음</a></li>
	    <li class="page-item"><a href="#" class="page-link" id="before">이전</a></li>
	  	<li id="pageList" class="pagination"></li>
	    <li class="page-item"><a class="page-link" href="#" id="next">다음</a></li>
	    <li class="page-item"><a class="page-link" href="#" id="last">마지막</a></li>
    </ul>
</body>
<script src="/resources/movie/list.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<jsp:include page="../template/footer.jsp"></jsp:include>