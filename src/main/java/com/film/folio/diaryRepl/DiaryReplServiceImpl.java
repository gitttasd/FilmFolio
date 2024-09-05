package com.film.folio.diaryRepl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

public class DiaryReplServiceImpl implements DiaryReplService {
	
	@Autowired
	private DiaryReplDAO diaryReplDAO;
	
	public List<DiaryReplVo> list(String diaryId) {
		return diaryReplDAO.list(diaryId);
	}

	public DiaryReplVo select(String diaryReplId) {
		return diaryReplDAO.select(diaryReplId);
	}
	
	public int add(DiaryReplVo drvo) {
		int num = diaryReplDAO.add(drvo);
		System.out.println(num+"개의 댓글이 등록 되었습니다.");
		return num;
	}

	public int delet(String diaryReplId) {
		int num = diaryReplDAO.delet(diaryReplId);
		
		System.out.println(num + "개의 댓글이 삭제 되었습니다.");
		return num;
	}

	@Override
	public int edit(DiaryReplVo drvo) {
		int num = diaryReplDAO.edit(drvo);
		System.out.println(num+"개의 댓글이 변경 되었습니다.");
		return num;
	}


}
