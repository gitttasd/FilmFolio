package com.film.folio.diary;

import java.net.URI;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.film.folio.comm.PageVo;
import com.film.folio.comm.SearchVo;
import com.film.folio.movie.MovieVo;
import com.film.folio.users.UsersVo;

@Controller
@RequestMapping("/diary")
public class DiaryController {
	private final String path = "diary";
	
	@Autowired
	private DiaryService diaryService;
	
	//diary list
	@GetMapping("/list")
	public String list(@ModelAttribute("searchVo") SearchVo searchVo,@SessionAttribute("loginUser") UsersVo user, Model model) { 
		List<DiaryVo> list = diaryService.list(searchVo, user);
		int total = diaryService.countAll(user);
		model.addAttribute("list", list);
		model.addAttribute("diaryTotal", total);
		
		return path+"/list";
	}
	
	@GetMapping("/add")
	public String addForm(HttpSession session, DiaryVo diaryVo, Model model) {
		model.addAttribute("movieVo", session.getAttribute("movieData"));
		model.addAttribute("diaryVo", diaryVo);
		
		return path+"/add";
	}
	
	@PostMapping("/add")
	public String add(@Valid DiaryVo diaryVo, BindingResult bind, HttpSession session) {
		
		if(bind.hasErrors()) {
			return path+"/add";
		}
		diaryService.add(diaryVo);
		session.removeAttribute("movieData");
		
		return "redirect:list";		
	}
	
	/**
	 * @param diaryId
	 * @return
	 */
	@GetMapping("/delete/{diaryId}")
	public String delet(@PathVariable String diaryId) {
		diaryService.delet(diaryId);
		return "redirect:../list";
	}
	
	@GetMapping("/select/{diaryId}")
	public String upform(@PathVariable String diaryId, Model model) {
		DiaryVo diaryVo = diaryService.select(diaryId);
		model.addAttribute("diaryVo",diaryVo);
		
		return path+"/select";
	}
	
	@GetMapping("/update/{diaryId}")
	public String editForm(@PathVariable String diaryId, DiaryVo diaryVo, Model model) {
		diaryVo = diaryService.select(diaryId);
		model.addAttribute("diaryVo",diaryVo);
		
		return path+"/add";
	}
	
	@PostMapping("/update/{diaryId}")
	public String edit(DiaryVo diaryVo) {
		diaryService.edit(diaryVo);
		return "redirect:../list";
	}
	
	@ResponseBody
	@GetMapping("/uppoint/{diaryId}")
	public String upPoint(@PathVariable String diaryId) {
		diaryService.upPoint(diaryId);
		return "success";
	}
}
