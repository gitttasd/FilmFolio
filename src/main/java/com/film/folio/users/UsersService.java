package com.film.folio.users;

import java.util.List;

import com.film.folio.comm.PageVo;
import com.film.folio.comm.SearchVo;

public interface UsersService {

	List<UsersVo> findUsers(SearchVo searchVo);

	int addUsers(UsersVo vo);

	UsersVo findById(String loginId);
	
	int editUser(UsersVo vo);

	int delUser(String userId);

	boolean checkIdExists(String id);
	
	void insertJoin(UsersVo vo);

	int countAll(SearchVo searchVo);

	String findIdByNameAndEmail(String name, String email);

	List<UsersVo> findInfo(String loginId, String name, String email);

	void updatePw(String password, String email);

	String confirmPw(String password, String loginId);

	int changePw(String newPassword, String loginId);

	UsersVo findByIds(String loginId);
}
