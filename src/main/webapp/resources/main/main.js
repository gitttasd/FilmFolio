//영화 목록 불러오기
window.onload = function(){
	const options = {
		method: 'GET',
		headers: {
		accept: 'application/json',
		Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNTFjZjUxNjQ3OTYyOTFkNjMyOTQ1ZjNhMDMzZDI3ZSIsIm5iZiI6MTcyNTYxMTYwMy4zMTU4MjYsInN1YiI6IjY2ZGE4OWJmZWUxZTE4ZDZlYTcwM2U1MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2WrqA0XFWVDfqkIIbe7uToFvaL7_YpVRQBt5sltOg6c'
		}
	};
	
	fetch('https://api.themoviedb.org/3/movie/popular?include_adult=false&language=ko-KR&page=1', options)
	.then(response => response.json())
	.then(response => {
		console.log(response);
		
		var movieList = response['results'];
		console.log(movieList);
		
		const container = document.getElementById('movieListContainer');
		const template = document.getElementById('movieTemplate');
		
		for (let i = 0; i < 10; i++) {
			const clone = document.importNode(template.content, true);
			var templete = '';
			
			let img = clone.querySelector('img');
			let font = clone.querySelector('font');
			let selectBtn = clone.querySelector('a');
			
			let id = movieList[i].id;
			let title = movieList[i].title;
			let poster_path = movieList[i].poster_path;

			img.src = `https://image.tmdb.org/t/p/w300_and_h450_bestv2${poster_path}`;
			img.alt = title;
			img.id = id;

			font.textContent = title;
			font.id = id;
			
			selectBtn.href = '/movie/select/'+id;
			selectBtn.setAttribute('data-id', id);
			
			
			container.appendChild(clone);
		};
	})
	.catch(err => console.error(err));

};