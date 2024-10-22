package com.film.folio.users;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.film.folio.comm.PageVo;
import com.film.folio.comm.SearchVo;

@Mapper
public interface UsersDao {

	List<UsersVo> findUsers(SearchVo searchVo);

	int addUsers(UsersVo vo);

	UsersVo findById(String loginId);
	
	int editUser(UsersVo vo);

	int delUser(String userId);

	boolean checkIdExists(String id);
	
	void insertJoin(UsersVo vo);

	int countAll(SearchVo searchVo);

	String findIdByNameAndEmail(@Param("name")String name,@Param("email") String email);

	List<UsersVo> findInfo(@Param("loginId")String loginId,@Param("name") String name,@Param("email")String email);

	void updatePw(@Param("password")String password, @Param("email")String email);

	String confirmPw(@Param("password") String password,@Param("loginId") String loginId);

	int changePw(@Param("newPassword") String newPassword,@Param("loginId") String loginId);

	UsersVo findByIds(String loginId);



	
	

}
