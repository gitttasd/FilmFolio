package com.film.folio.users;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.film.folio.comm.PageVo;
import com.film.folio.comm.SearchVo;

@Service
public class UsersServiceImpl implements UsersService {

	@Autowired
	private UsersDao usersDao;
	
	@Override
	public List<UsersVo> findUsers(SearchVo searchVo) {
		return usersDao.findUsers(searchVo);	
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
	
	@Override
	public void insertJoin(UsersVo vo) {
		usersDao.insertJoin(vo);
		
	}

	@Override
	public int countAll(SearchVo searchVo) {
		return usersDao.countAll(searchVo);
	}

	@Override
	public String findIdByNameAndEmail(String name, String email) {
		return usersDao.findIdByNameAndEmail(name,email);
	}

	@Override
	public List<UsersVo> findInfo(String loginId, String name, String email) {
		return usersDao.findInfo(loginId,name,email);
	}

	@Override
	public void updatePw(String password, String email) {
		 usersDao.updatePw(password,email);
		
	}

	@Override
	public String confirmPw(String password, String loginId) {
		return usersDao.confirmPw(password,loginId);
	}

	@Override
	public int changePw(String newPassword, String loginId) {
		return usersDao.changePw(newPassword,loginId);
	}

	@Override
	public UsersVo findByIds(String loginId) {
		return usersDao.findByIds(loginId);
	}
	
	


	
	
	

}
