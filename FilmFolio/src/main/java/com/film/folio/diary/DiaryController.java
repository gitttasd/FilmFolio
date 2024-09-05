package com.film.folio.diary;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/diary")
public class DiaryController {
	
	private final String path = "diary";
	
	@Autowired
	private DiaryService diaryService;
	
	//diary list
	@GetMapping("/list")
	public String list(Model model) {
		
		List<DiaryVo> list = diaryService.list();
		int all = diaryService.countAll();
		
		model.addAttribute("countAll", all);
		model.addAttribute("list", list);
		
		return path+"/list";
	}
	
	@GetMapping("/add")
	public String addform(DiaryVo diaryVo) {
		//session에서 로그인 정보를 가져와야함
		return path+"/add";
	}
	
	@PostMapping("/add")
	public String add(@Valid DiaryVo diaryVo, BindingResult bind) {
		
		if(bind.hasErrors()) {
			return path+"/add";
		}
		
		diaryService.add(diaryVo);
		
		return "redirect:list";		
	}
	
	@GetMapping("/delete/{diaryId}")
	public String delet(@PathVariable String diaryId) {
		diaryService.delet(diaryId);
		return "redirect:../list";
	}
	
	@GetMapping("/update/{diaryId}")
	public String upform(@PathVariable String diaryId, Model model) {
		DiaryVo diaryVo = diaryService.select(diaryId);
		
		model.addAttribute("diaryVo",diaryVo);
		return path+"/update";
	}
	
	@PostMapping("/update/{diaryId}")
	public String edit(@PathVariable String diaryId, DiaryVo diaryVo) {
		diaryVo.setDiaryId(diaryId);
		diaryService.edit(diaryVo);
		return "redirect:../update/{diaryId}";
	}
}
