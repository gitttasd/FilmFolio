package com.film.folio.movie;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.List;

public interface MovieService {

	HttpResponse<String> movieList(HttpRequest request) throws IOException, InterruptedException;


}
