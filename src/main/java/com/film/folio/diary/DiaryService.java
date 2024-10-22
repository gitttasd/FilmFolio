package com.film.folio.diary;

import java.util.List;
import java.util.Map;

import com.film.folio.comm.PageVo;
import com.film.folio.comm.SearchVo;
import com.film.folio.users.UsersVo;

public interface DiaryService {

	List<DiaryVo> list(SearchVo searchVo, UsersVo user);

	DiaryVo select(String diaryId);
	
	int add(DiaryVo dvo);

	int delet(String diaryId);

	int edit(DiaryVo dvo);

	int countAll(UsersVo user);
	
	List<DiaryVo> diaryOpenList(int id);
	
	int upPoint(String diaryId);

	int movieCountAll(int id);


}
