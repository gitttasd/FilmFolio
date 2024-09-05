package com.film.folio.diaryRepl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DiaryReplDAO {

	List<DiaryReplVo> list(String diaryId);
	
	DiaryReplVo select(String diaryReplId);	

	int add(DiaryReplVo drvo);

	int delet(String diaryReplId);

	int edit(DiaryReplVo drvo);

	
}
