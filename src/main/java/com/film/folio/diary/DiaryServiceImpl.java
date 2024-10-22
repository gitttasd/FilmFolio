package com.film.folio.diary;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.film.folio.comm.SearchVo;
import com.film.folio.users.UsersVo;

@Service
public class DiaryServiceImpl implements DiaryService {
	
	@Autowired
	private DiaryDAO diaryDAO;
	
	public List<DiaryVo> list(SearchVo searchVo, UsersVo user) {
		Map<String, Object> map = new HashMap<String, Object>();
		int total = diaryDAO.countAll(user);
		
		map.put("loginId", user.getLoginId());
		if(searchVo.getSearchKey() == null || searchVo.getSearchKey().equals("")) {
			map.put("searchKey", null);			
		}else {
			map.put("searchKey", searchVo.getSearchKey());						
		}
		map.put("searchValue", searchVo.getSearchValue());
		map.put("totalRecordCount", total);
		map.put("firstRecordIndex", searchVo.getFirstRecordIndex());
		map.put("lastRecordIndex", searchVo.getLastRecordIndex());
		
		return diaryDAO.list(map);
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
	public int countAll(UsersVo user) {
		return diaryDAO.countAll(user);
	}

	@Override
	public List<DiaryVo> diaryOpenList(int id) {
		String movieId = Integer.toString(id);
		return diaryDAO.diaryOpenList(movieId);
	}

	@Override
	public int upPoint(String diaryId) {
		int num = diaryDAO.selectPoint(diaryId);
		num += 1;
		DiaryVo dvo = new DiaryVo();
		dvo.setPoint(num);
		dvo.setDiaryId(diaryId);
		return diaryDAO.upPoint(dvo);
	}
	
	@Override
	public int movieCountAll(int id) {
		return diaryDAO.movieCountAll(id);
	}



}
