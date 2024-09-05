package com.film.folio.diary;

import java.util.List;

public interface DiaryService {

	List<DiaryVo> list();

	DiaryVo select(String diaryId);
	
	int add(DiaryVo dvo);

	int delet(String diaryId);

	int edit(DiaryVo dvo);

	int countAll();


}
