package com.film.folio.movie;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.film.folio.comm.PageVo;
import com.film.folio.diary.DiaryService;
import com.film.folio.diary.DiaryVo;
import com.film.folio.users.UsersVo;

@Controller
@RequestMapping("/movie")
public class MovieController {
	
	@Autowired
	private DiaryService diaryService;
	
	@Autowired 
	private MovieService movieService;
	
	@GetMapping("/select/{id}")
	public String movieForm(@PathVariable int id, Model model, HttpSession session) {
		MovieVo movieVo = new MovieVo();
		movieVo.setId(id);
		model.addAttribute("movieVo", movieVo);
		
		List<DiaryVo> dvo = diaryService.diaryOpenList(id);
		model.addAttribute("diaryOpenList", dvo);
		
		UsersVo loginUser = (UsersVo) session.getAttribute("loginUser");
		model.addAttribute("loginUser",loginUser);
		
		int num = diaryService.movieCountAll(id);
		model.addAttribute("movieCountAll", num);
		
		return "movie/select";
	}
	
	@GetMapping("/actorSelect/{id}")
	public String actorForm(@PathVariable int id, Model model) {
		ActorVo actorVo = new ActorVo();
		actorVo.setId(id);
		model.addAttribute("actorVo", actorVo);
		return "movie/actor";
	}
	
	@GetMapping("/list")
	public String list(HttpSession session,ModelMap model) {
		
		UsersVo loginUser = (UsersVo) session.getAttribute("loginUser");
		
		model.addAttribute("loginUser",loginUser);
		
		return "movie/list";
	}
	
	@PostMapping("/select")
	@ResponseBody
	public String addForm(@RequestBody MovieVo movieData, HttpSession session) {
		session.setAttribute("movieData", movieData);
		return "success";
	}
	
	@GetMapping("/test") @ResponseBody
	public HttpResponse<String> test(HttpRequest request, HttpResponse<String> response ,Model model) throws IOException, InterruptedException {
		
		HttpResponse<String> movie = movieService.movieList(request);
		
		model.addAttribute("MovieVo", movie);
		System.err.println("끄약" + movie);
		return movie;
	}

}
