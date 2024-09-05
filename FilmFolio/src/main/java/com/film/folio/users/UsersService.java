package com.film.folio.users;

import java.util.List;

public interface UsersService {

	List<UsersVo> findUsers();

	int addUsers(UsersVo vo);

	UsersVo findById(String UserId);

	int editUser(UsersVo vo);

	int delUser(String userId);

}
