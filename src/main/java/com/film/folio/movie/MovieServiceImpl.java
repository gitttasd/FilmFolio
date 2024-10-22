package com.film.folio.movie;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import org.springframework.stereotype.Service;

@Service
public class MovieServiceImpl implements MovieService {

	@Override
	public HttpResponse<String> movieList(HttpRequest request) throws IOException, InterruptedException {
		request = HttpRequest.newBuilder()
			    .uri(URI.create("https://api.themoviedb.org/3/movie/popular?language=ko-KR&page=1"))
			    .header("accept", "application/json")
			    .header("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNTFjZjUxNjQ3OTYyOTFkNjMyOTQ1ZjNhMDMzZDI3ZSIsIm5iZiI6MTcyODYxMzU4My41NTA1NzcsInN1YiI6IjY2ZGE4OWJmZWUxZTE4ZDZlYTcwM2U1MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.H4wEUDcgkZQsBCNzjggTXGFmhiH51N4xDhavDddEQbY")
			    .method("GET", HttpRequest.BodyPublishers.noBody())
			    .build();
		
		HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
		System.err.println(response.body());
		
		return response;
	}
	
	
}
