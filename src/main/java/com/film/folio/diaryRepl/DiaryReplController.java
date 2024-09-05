package com.film.folio.diaryRepl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/diaryRepl")
public class DiaryReplController {
	
	private final String path = "diaryRepl";
	
	@Autowired
	private DiaryReplService diaryReplService;
	
	@GetMapping("/list/{diaryId}")
	@ResponseBody
	public List<DiaryReplVo> list(@PathVariable String diaryId) {
		
		List<DiaryReplVo> list = diaryReplService.list(diaryId); 
		
		return list;
	}
	
	@GetMapping("/add")
	public String addform() {
		return path+"/add";
	}
	
	@PostMapping("/add")
	public String add(DiaryReplVo drvo) {
		diaryReplService.add(drvo);
		return "redirect:list";
	}
	
	@GetMapping("/delete/{diaryReplId}")
	public String delet(@PathVariable String diaryReplId) {
		diaryReplService.delet(diaryReplId);
		return "redirect:../list";
	}
	
	@GetMapping("/update/{diaryReplId}")
	public String upform(@PathVariable String diaryReplId, Model model) {
		DiaryReplVo drvo = diaryReplService.select(diaryReplId);
		
		model.addAttribute("diaryReplVo",drvo);
		return path+"/update";
	}
	
	@PostMapping("/update/{diaryReplId}")
	public String edit(@PathVariable String diaryReplId, DiaryReplVo drvo) {
		drvo.setDiaryReplId(diaryReplId);
		diaryReplService.edit(drvo);
		return "redirect:../update/{diaryReplId}";
	}
}
