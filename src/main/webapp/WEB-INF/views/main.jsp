<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <title>Main</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/main/main.css">
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lusitana:wght@700&family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
</head>
<jsp:include page="template/header.jsp"></jsp:include>
<body>
	<div class="mainSpace">
		<div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="/resources/image/movie-theater.jpg" class="d-block w-100" id="carousel-img" alt="이미지1"/>
					<div class="container">
						<div class="carousel-caption">
		      				<h1 class="display-4 lusitana-bold">FilmFolio</h1>
		      				<p class="col-lg-8 mx-auto lead noto-sans-regular">
		        				FilmFolio는 영화를 보고 느낀 감정을 일기로 기록하며,<br/>여러분에게 특별한 여정을 선사합니다.
		      				</p>
		      			</div>
	    			</div>
				</div>
				<div class="carousel-item">
					<img src="/resources/image/cinema-5069314.jpg" class="d-block w-100" id="carousel-img" alt="이미지2"/>
					<div class="container">
						<div class="carousel-caption">
		      				<h1 class="display-4 lusitana-bold">FilmFolio</h1><br/>
		      				<p class="col-lg-8 mx-auto lead noto-sans-regular">
		        				스크린 속 이야기가 당신의 삶과 맞닿는 순간,<br/>FilmFolio는 그때의 깊은 울림을 저장합니다.
		      				</p>
		      			</div>
	    			</div>
				</div>
				<div class="carousel-item">
					<img src="/resources/image/camera-6252267.jpg" class="d-block w-100" id="carousel-img" alt="이미지3"/>
					<div class="container">
						<div class="carousel-caption">
		      				<h1 class="display-4 lusitana-bold">FilmFolio</h1><br/>
		      				<p class="col-lg-8 mx-auto lead noto-sans-regular">
		        				한 편의 영화가 남긴 여운을 일기로 기록하고,<br/>마음 속에 오래 간직해보세요.
		      				</p>
		      			</div>
	    			</div>
				</div>
			</div>
		</div>
	</div>
	<div class="topSpace">
		<div class="container">
			<h2 class="noto-sans-regular">Hot&New</h2>
		</div>
	  	<div class="container">	   
		   <div id="movieListContainer" class="row row-cols-md-5 g-5"></div>
	   	</div>
	</div>
	
   <template id="movieTemplate">
	<div class="col">
		<div class="card shadow-sm rotate-card">
			<a href="" id="selectBtn" style="text-decoration: none; color: black;">
	      		<img alt="" src="" class="" width="100%"/>
	      		<div class="card-body">
		      		<p class="card-text">
						<font style="vertical-align: inherit;"></font>
		      		</p>
	      		</div>
		   </a>
    	</div>
     </div>
   </template>

<script src="/resources/main/main.js"></script>
<script>
document.querySelector('#navSearchBtn').onclick = function(){
	let option = document.querySelector('#navSearchOption').value;
	let keyword = document.querySelector('#navSearchKey').value;
	let navSearch = document.querySelector('#navSearch');
	
	if(option === '0'){
		alert('검색옵션을 선택해주세요'); return false;
	}else{
		if(!keyword){
			alert('검색어를 입력해주세요!'); return false;
		}else{
			navSearch.href = '/movie/list?searchNm='+option+'&keyWord='+keyword+'&page=1';
		};
	};
};
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<jsp:include page="template/footer.jsp"></jsp:include>
</body>
</html>