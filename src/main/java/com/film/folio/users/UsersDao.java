package com.film.folio.users;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UsersDao {

	List<UsersVo> findUsers();

	int addUsers(UsersVo vo);

	UsersVo findById(String loginId);

	int editUser(UsersVo vo);

	int delUser(String userId);

	boolean checkIdExists(String id);

	
	

}
