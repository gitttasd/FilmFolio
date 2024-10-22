document.addEventListener("DOMContentLoaded", function() {
	    const dropdownButton = document.querySelector(".dropdown-toggle");
	    
	    // disabled 속성이 있을 경우 제거
	    if (dropdownButton.classList.contains("disabled")) {
	        dropdownButton.classList.remove("disabled");
	    }
	});

var id = document.querySelector('#movieId').value;

window.onload = function(){
	const options = {
		method: 'GET',
		headers: {
		accept: 'application/json',
		Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNTFjZjUxNjQ3OTYyOTFkNjMyOTQ1ZjNhMDMzZDI3ZSIsIm5iZiI6MTcyNTkzNDgzNC4wNDYyMDgsInN1YiI6IjY2ZGE4OWJmZWUxZTE4ZDZlYTcwM2U1MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ORKWCXhUUEoRQrjIzYCVlIX4p_pPhqdDB2epgI6VoMg'
	}
};

fetch('https://api.themoviedb.org/3/movie/'+ id +'?language=ko-KR', options)
	.then(response => response.json())
	.then(response => {
		document.querySelector('#title').innerHTML = response['title'];
		document.querySelector('img').src = 'https://image.tmdb.org/t/p/w300_and_h450_bestv2'+response['poster_path'];
		document.querySelector('img').alt = response['title'];
		
		var genreList = response['genres'];
		var genreBtn =  document.querySelector('#genre');
		genreList.forEach(genre =>{
			let newBtn = document.createElement('li');
			newBtn.classList.add('mb-1', 'text-body-secondary', 'me-2');
			newBtn.textContent = genre['name'];
			
			genreBtn.append(newBtn);
		});
		
		document.querySelector('#release_date').innerHTML = response['release_date'] +' 개봉';
		document.querySelector('#overview').textContent = response['overview'];

		document.querySelector('#diaryWr').onclick = function(){
			const movieData = {
				id : response['id'],
				title: response['title'],
				poster_path: response['poster_path'],
				vote_average: response['vote_average'],
				genres: response['genres'],
				release_date: response['release_date'],
				overview: response['overview']
			};
			console.log(movieData);

			fetch('/movie/select', {
				method: 'POST',
				headers: {
				'Content-Type': 'application/json'
				},
				body: JSON.stringify(movieData)
			})
			.then(res => res.text())
			.then(data => {
				if(data === 'success'){
					console.log('Movie data successfully sent to server:', data);
					window.location.href = '/diary/add';
				}else{
					console.error('error', data);
				}
			})
			.catch(err => console.error('Error submitting movie data:', err));
		};
	})
	.catch(err => console.error(err));
};

//좋아요 수 증가
document.querySelectorAll('#goodBtn').forEach(button => {
    button.onclick = function(ev) {
 
        let diaryId = ev.target.closest('button').getAttribute('data-idInp'); 
        console.log(diaryId);
        
        fetch('/diary/uppoint/' + diaryId, {
            method: 'GET',
            headers: { 'Content-Type': 'application/json' }
        })
        .then(res => res.text())
        .then(data => { 
            if(data === 'success'){
                alert('추천완료!');
                window.location.reload();
            }
        })
        .catch(err => console.error('Error submitting movie data:', err));
    };
});