package com.film.folio.diary;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DiaryDAO {

	List<DiaryVo> list();
	
	DiaryVo select(String diaryId);	

	int add(DiaryVo dvo);

	int delet(String diaryId);

	int edit(DiaryVo dvo);

	int countAll();

}
