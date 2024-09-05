package com.film.folio.diary;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiaryServiceImpl implements DiaryService {
	
	@Autowired
	private DiaryDAO diaryDAO;
	
	public List<DiaryVo> list() {
		return diaryDAO.list();
	}

	public DiaryVo select(String diaryId) {
		return diaryDAO.select(diaryId);
	}
	
	public int add(DiaryVo dvo) {
		int num = diaryDAO.add(dvo);
		System.out.println(num+"개의 diary가 등록 되었습니다.");
		return num;
	}

	public int delet(String diaryId) {
		int num = diaryDAO.delet(diaryId);
		
		System.out.println(num + "개의 diary가 삭제 되었습니다.");
		return num;
	}

	@Override
	public int edit(DiaryVo dvo) {
		int num = diaryDAO.edit(dvo);
		System.out.println(num+"개의 diary가 변경 되었습니다.");
		return num;
	}

	@Override
	public int countAll() {
		return diaryDAO.countAll();
	}


}
