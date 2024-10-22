window.onload = function(){
	var options = {
		method: 'GET',
		headers: {
		accept: 'application/json',
		Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNTFjZjUxNjQ3OTYyOTFkNjMyOTQ1ZjNhMDMzZDI3ZSIsIm5iZiI6MTcyNTkzNDgzNC4wNDYyMDgsInN1YiI6IjY2ZGE4OWJmZWUxZTE4ZDZlYTcwM2U1MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ORKWCXhUUEoRQrjIzYCVlIX4p_pPhqdDB2epgI6VoMg'
		}
	};

	let movieImgList = document.querySelectorAll('#movieImg');
	movieImgList.forEach(function(v){
		let id = v.getAttribute('data-id');
		
		fetch('https://api.themoviedb.org/3/movie/'+ id +'?language=ko-KR', options)
		.then(response => response.json())
		.then(response => {
			v.alt = response['title'];
			v.src = 'https://image.tmdb.org/t/p/w300_and_h450_bestv2'+response['poster_path'];
		})
		.catch(err => console.error(err));
	});
};

document.querySelectorAll('#delBtn').forEach(v => {
	v.onclick = function(ev){
		let diaryTitle = ev.target.getAttribute('data-name');
		if (!confirm( '제목: '+diaryTitle+' 을 삭제하시겠습니까?')){
			return false;
		};
	};
});

document.querySelectorAll('#editBtn').forEach(v => {
	v.onclick = function(ev){
		let diaryTitle = ev.target.getAttribute('data-name');
		if (!confirm( '제목: '+diaryTitle+' 을 변경하시겠습니까?')){
			return false;
		};
	};
});

function goPage(pageNo) {
    document.querySelector('[name="currentPageNo"]').value = pageNo;
    document.getElementById('searchForm').submit(); // 폼 제출
};
