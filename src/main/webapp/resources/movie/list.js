//영화 목록 불러오기
var params = new URLSearchParams(window.location.search);

window.onload = function(){
	getCurrent();
};
function getCurrent(){
	var currentPage = params.get('page');
		
	if(!currentPage){
		currentPage = 1;
	};
	
	if(!params.get('keyWord')) {
		document.querySelector('#result').textContent = '';
		Movie(currentPage);		
	}else{
		document.querySelector('#searchResult').textContent = params.get('keyWord');
		if( params.get('searchNm') === '0'){
			alert('검색 옵션을 선택해주세요!');
		};
		if( params.get('searchNm') === '1'){
			document.querySelector('[name="movieSearch"]').value = '1';
			searchMovie(currentPage, params.get('keyWord'));
		};
		if(params.get('searchNm') === '2'){
			document.querySelector('[name="movieSearch"]').value = '2';
			searchActor(currentPage, params.get('keyWord'));
			
		};
	};
};

//영화전체목록
function Movie(currentPage){
	const options = {
		method: 'GET',
		headers: {
		accept: 'application/json',
		Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNTFjZjUxNjQ3OTYyOTFkNjMyOTQ1ZjNhMDMzZDI3ZSIsIm5iZiI6MTcyNTkzNDgzNC4wNDYyMDgsInN1YiI6IjY2ZGE4OWJmZWUxZTE4ZDZlYTcwM2U1MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ORKWCXhUUEoRQrjIzYCVlIX4p_pPhqdDB2epgI6VoMg'
		}
	};	
	
	fetch('https://api.themoviedb.org/3/movie/top_rated?language=ko-KR&page='+currentPage, options)
	.then(response => response.json())
	.then(response => {
		listTemplate(response);
		pagination(currentPage, response['total_pages'] );
	})
	.catch(err => console.error(err));
};

//목록 출력
function listTemplate(response){
	//node Clone
	var movieList = response['results'];
	console.log(movieList);
	var baseSrc = 'https://image.tmdb.org/t/p/w300_and_h450_bestv2';

	var container = document.getElementById('movieListContainer');
	var template = document.getElementById('movieTemplate');

	container.innerHTML = '';
	
	movieList.forEach(movie =>{
		const clone = document.importNode(template.content, true);

		let img = clone.querySelector('img');
		let font = clone.querySelector('#font');
		let release_date = clone.querySelector('#release_date');
		let overview = clone.querySelector('#overview');
		let selectIcon = clone.querySelector('#selectIcon');
		let gernes = clone.querySelector('#gernes');
		
		img.src = baseSrc + movie['poster_path'];
		img.alt = movie['title'];
		img.id = movie['id'];
		
		font.textContent = movie['title'];
		font.id = movie['id'];
		
		release_date.textContent = movie['release_date'];
		overview.textContent = movie['overview'];

		gernes.textContent = '영화';

		selectIcon.href = 'select/'+movie['id'];

		container.appendChild(clone);
	});
};

//검색하기
var keyWord = '';
var searchNm = '';
document.getElementById('navSearchBtn').onclick = function(){
	keyWord = document.getElementById('navSearchKey').value;
	searchNm = document.querySelector('#navSearchOption').value;
	if(searchNm === '0'){
		alert('검색옵션를 선택하세요!');
		return false;
	}
	if(!keyWord){
		alert('검색어를 입력하세요!');
		return false;
	}else{
		params.set('searchNm', searchNm);
		params.set('keyWord', keyWord);
		params.set('page', 1);
		
		var newUrl = window.location.protocol + "//" + window.location.host + window.location.pathname + '?' + params.toString();
		window.history.replaceState(null, '', newUrl);
			
		getCurrent();
	};
};

//영화이름 찾기
function searchMovie(currentPage, keyWord){
	//searchMovie
	var options = {
		method: 'GET',
		headers: {
		accept: 'application/json',
		Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNTFjZjUxNjQ3OTYyOTFkNjMyOTQ1ZjNhMDMzZDI3ZSIsIm5iZiI6MTcyNTkzNDgzNC4wNDYyMDgsInN1YiI6IjY2ZGE4OWJmZWUxZTE4ZDZlYTcwM2U1MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ORKWCXhUUEoRQrjIzYCVlIX4p_pPhqdDB2epgI6VoMg'
		}
	};
	
	fetch('https://api.themoviedb.org/3/search/movie?query='+keyWord+'&include_adult=false&language=ko-KR&page='+currentPage, options)
		.then(response => response.json())
		.then(response => {
			listTemplate(response);
			pagination(currentPage, response['total_pages'], keyWord, params.get('searchNm'));
		})
		.catch(err => console.error(err));
};

//배우 찾기
function searchActor(currentPage, keyWord){
	const optionsA = {
		method: 'GET',
		headers: {
		accept: 'application/json',
		Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNTFjZjUxNjQ3OTYyOTFkNjMyOTQ1ZjNhMDMzZDI3ZSIsIm5iZiI6MTcyNjcyNTE0OC44MzY5MTEsInN1YiI6IjY2ZGE4OWJmZWUxZTE4ZDZlYTcwM2U1MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.jjuPM0Ny1YzKsV6S0omFfXyPpDAIz9RkBtP9QPfTiik'
		}
	};
	
	fetch('https://api.themoviedb.org/3/search/person?query='+keyWord+'&include_adult=false&language=ko-KR&page='+currentPage, optionsA)
		.then(response => response.json())
		.then(response => {
			//node clone
			
			var peopleList = response['results'];
			var actorMovieList = [];
			peopleList.forEach( function(v){
				actorMovieList = v['known_for'];
				console.log(actorMovieList, 'actorMovieList');
			});

			var baseSrc = 'https://image.tmdb.org/t/p/w300_and_h450_bestv2';

			var container = document.getElementById('movieListContainer');
			var template = document.getElementById('movieTemplate');
			
			container.innerHTML = '';

			actorMovieList.forEach( movie =>{
				if(movie['media_type'] === 'tv'){
					return;
				}else{
					const clone = document.importNode(template.content, true);
					
					let img = clone.querySelector('img');
					let font = clone.querySelector('#font');
					let release_date = clone.querySelector('#release_date');
					let overview = clone.querySelector('#overview');
					let selectIcon = clone.querySelector('#selectIcon');
					let gernes = clone.querySelector('#gernes');
	
					img.src = baseSrc + movie['backdrop_path'];
					img.alt = movie['title'];
					img.id = movie['id'];
					
					font.textContent = movie['title'];
					font.id = movie['id'];
	
					release_date.textContent = movie['release_date'];
					overview.textContent = movie['overview'];
	
					gernes.textContent = '영화';
	
					selectIcon.href = 'select/'+movie['id'];
	
					container.appendChild(clone);
				};
			});
			
			//페이지네이션
			pagination(currentPage, response['total_pages'], keyWord, params.get('searchNm'));
		})
		.catch(err => console.error(err));
	
};

const index = [];
function pagination(currentPage ,total_pages, keyWord, searchNm){
	//페이지네이션
	var pageList =  document.getElementById('pageList');
	var first =  document.getElementById('first'); 
	var before =  document.getElementById('before'); 
	var next =  document.getElementById('next');
	var last =  document.getElementById('last');
	
	var perGroup = 10;
	var start = Math.floor( (( (currentPage - 1) / perGroup ) ) + 0 ) * perGroup + 1 ;
	var lastNm = Math.floor( (( total_pages / perGroup ) ) + 0 ) * perGroup + 1 ;
	var nextNm = start + perGroup;
	var beforeNm = start - perGroup;

	pageList.innerHTML = '';
	
	first.innerHTML = '처음';
	before.innerHTML = '이전';
	next.innerHTML = '다음';
	last.innerHTML = '마지막';
	
	if(currentPage < perGroup){
		first.classList.add('disabled');
		before.classList.add('disabled');
	};
	
	//반복
	index.length = 0;
	for(var i = start; i< (start + perGroup) && i <= total_pages; i++){
        index.push(i); 
    };
    
    index.forEach( value => {
		if(value == currentPage){ //현재 페이지와 value 값이 같은 경우(현재 페이지를 표시)
			if(keyWord){ // keyWord가 존재하는 경우
				pageList.innerHTML += '<li class="page-item active"><a class="page-link" href="/movie/list?searchNm='+searchNm+'&keyWord='+keyWord+'&page='+value+'">' + value + '</a></li>';				
			}else pageList.innerHTML += '<li class="page-item active"><a class="page-link" href="/movie/list?page=' + value + '">' + value + '</a></li>';
        
        }else{ //현재 페이지와 value 값이 다른 경우
			if(keyWord){
				pageList.innerHTML += '<li class="page-item"><a class="page-link" href="/movie/list?searchNm='+searchNm+'&keyWord='+keyWord+'&page='+value+'">' + value + '</a></li>';
			}else pageList.innerHTML +='<li class="page-item"><a class="page-link" href="/movie/list?page=' + value + '">' + value + '</a></li>';     		
        }
    });
    
	if(currentPage > perGroup){
		if(keyWord){
            first.href = '/movie/list?searchNm='+searchNm+'&keyWord='+keyWord+'&page=1';
			before.href = '/movie/list?searchNm='+searchNm+'&keyWord='+keyWord+'&page='+ beforeNm;
		}else {
            before.href = '/movie/list?page=' + beforeNm;
        };
	};

	if( currentPage < lastNm){
		if(keyWord){
			if(lastNm <= perGroup){
				next.classList.add('disabled');
				last.classList.add('disabled');
			}else{
				next.href = '/movie/list?searchNm='+searchNm+'&keyWord='+keyWord+'&page='+ nextNm;
				last.href = '/movie/list?searchNm='+searchNm+'&keyWord='+keyWord+'&page='+ total_pages;			
			};
		}else{
            next.href = '/movie/list?page=' + nextNm;
			last.href = '/movie/list?page=' + total_pages;
        };
	};

	if(currentPage >= lastNm ){
		next.classList.add('disabled');
		last.classList.add('disabled');
	};
}

function personSelect(id){
	window.location.href = '/movie/actorSelect/'+id;
};

document.querySelector('#cleanBtn').addEventListener('click', () => window.location.href = '/movie/list'); 