package com.film.folio.users;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsersServiceImpl implements UsersService {

	@Autowired
	private UsersDao usersDao;
	
	@Override
	public List<UsersVo> findUsers() {
		return usersDao.findUsers();	
	}

	@Override
	public int addUsers(UsersVo vo) {
		return usersDao.addUsers(vo);
	}

	@Override
	public UsersVo findById(String loginId) {
		return usersDao.findById(loginId);
	}

	@Override
	public int editUser(UsersVo vo) {
		return usersDao.editUser(vo);
	}

	@Override
	public int delUser(String userId) {
		return usersDao.delUser(userId);
	}

	@Override
	public boolean checkIdExists(String id) {
		return usersDao.checkIdExists(id);
	}
	
	


	
	
	

}
