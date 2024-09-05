package com.film.folio.diaryRepl;

import java.util.List;

public interface DiaryReplService {

	List<DiaryReplVo> list(String diaryId);

	DiaryReplVo select(String diaryReplId);
	
	int add(DiaryReplVo drvo);

	int delet(String diaryReplId);

	int edit(DiaryReplVo drvo);


}
