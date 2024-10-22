package com.film.folio.diary;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.film.folio.comm.PageVo;
import com.film.folio.comm.SearchVo;
import com.film.folio.users.UsersVo;

@Mapper
public interface DiaryDAO {

	List<DiaryVo> list(Map<String, Object> map);
	
	DiaryVo select(String diaryId);	

	int add(DiaryVo dvo);

	int delet(String diaryId);

	int edit(DiaryVo dvo);

	int countAll(UsersVo user);
	
	List<DiaryVo> diaryOpenList(String id);
	
	int upPoint(DiaryVo diaryVo);

	int selectPoint(String diaryId);

	int movieCountAll(int id);

}
