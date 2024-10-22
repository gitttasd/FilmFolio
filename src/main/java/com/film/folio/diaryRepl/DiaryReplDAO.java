package com.film.folio.diaryRepl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.film.folio.users.UsersVo;

@Mapper
public interface DiaryReplDAO {

	List<DiaryReplVo> list(String diaryId);
	
	DiaryReplVo select(String diaryReplId);	

	int add(DiaryReplVo drvo);

	int delet(String diaryReplId);

	int edit(DiaryReplVo drvo);
	
	int countAll(String diaryId);

	
}
