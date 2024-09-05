package com.film.folio.users;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UsersController {
	
	@Autowired
	private UsersService usersService;

	@RequestMapping(path = "/users/list.do", method = RequestMethod.GET)
	public String list(Model model){
		
		List<UsersVo> find = usersService.findUsers();
		
		model.addAttribute("find",find);
		
		return "users/list";
	}

	@RequestMapping(path = "/users/add.do", method = RequestMethod.GET)
	public String add() {
		return "users/add";
	}
	
	@RequestMapping(path = "/users/add.do", method = RequestMethod.POST)
	public String add1(UsersVo vo) {
		
		int addUser = usersService.addUsers(vo);
		
		System.out.println(addUser +"명이 추가 되었습니다");
		
		return "home";
	}
	
	@RequestMapping(path = "/users/edit.do", method = RequestMethod.GET)
	public String edit(@RequestParam("UserId") String UserId,Model model) {
		
		UsersVo edit = usersService.findById(UserId);
		
		model.addAttribute("edit",edit);
		
		return "users/edit";
	}
	
	@RequestMapping(path = "/users/edit.do", method = RequestMethod.POST)
		public String edit1(UsersVo vo) {
		
		int edit1 = usersService.editUser(vo);
		
		return "redirect:/users/list.do";
		
	}
	
	@RequestMapping(path = "/users/del.do", method = RequestMethod.GET)
	public String del(@RequestParam("UserId")String UserId) {
	
	int del = usersService.delUser(UserId);
	
	return "redirect:/users/list.do";
	
}
	
	
	
}
