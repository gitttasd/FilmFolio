package com.film.folio.diaryRepl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.film.folio.comm.SearchVo;

@Controller
@RequestMapping("/diaryRepl")
public class DiaryReplController {
	
	@Autowired
	private DiaryReplService diaryReplService;
	
	@GetMapping("/list/{diaryId}") @ResponseBody
	public List<DiaryReplVo> list(@PathVariable String diaryId)  {
		List<DiaryReplVo> list = diaryReplService.list(diaryId);
		System.err.println(list);
		return list;
	}
	
	@GetMapping("/select/{diaryReplId}") @ResponseBody
	public DiaryReplVo select(@PathVariable String diaryReplId) {	
		DiaryReplVo replVo = diaryReplService.select(diaryReplId); 
		return replVo;
	}
	
	@GetMapping("/delete/{diaryReplId}") @ResponseBody
	public int delet(@PathVariable String diaryReplId, String diaryId) {
		int num = diaryReplService.delet(diaryReplId);
		System.out.println(num+"개의 댓글이 삭제되었습니다.");
		return num;
	}
	
	@PostMapping("/add/{diaryId}") @ResponseBody
	public int add(@RequestBody DiaryReplVo drvo, @PathVariable String diaryId){
		drvo.setDiaryId(diaryId);
		int num = diaryReplService.add(drvo);
		System.out.println(num+"개의 댓글이 등록되었습니다");
		return num;
	}
	
	@PostMapping("/update/{diaryReplId}") @ResponseBody
	public int edit(@PathVariable String diaryReplId, @RequestBody DiaryReplVo drvo) {
		drvo.setDiaryReplId(diaryReplId);
		int num = diaryReplService.edit(drvo);
		System.out.println(num+"개의 댓글이 변경되었습니다.");
		return num;
	}
}
