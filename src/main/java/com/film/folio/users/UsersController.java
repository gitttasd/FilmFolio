package com.film.folio.users;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String add(UsersVo vo, Model model) {
		model.addAttribute("UsersVo",new UsersVo());
		return "users/add";
	}
	
	@RequestMapping(path = "/users/add.do", method = RequestMethod.POST)
	public String add1(@Valid @ModelAttribute("UsersVo") UsersVo vo, BindingResult result) {
		
		if(result.hasErrors()){
			return "users/add";
		}
		
		
		int addUser = usersService.addUsers(vo);
		
		System.out.println(addUser +"명이 추가 되었습니다");
		
		return "home";
	}
	
	@RequestMapping(path = "/users/edit.do", method = RequestMethod.GET)
	public String edit(@RequestParam("loginId") String loginId,Model model) {
		
		UsersVo edit = usersService.findById(loginId);
		
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
	;
	@RequestMapping(path = "/users/login.do",method = RequestMethod.GET)
	public String loginform() {
		return "users/login";
	}
	
	@RequestMapping(path = "/users/login.do",method = RequestMethod.POST)
	public String login(UsersVo vo,HttpSession session) {
		
		UsersVo uvo = usersService.findById(vo.getLoginId());
		
		if(uvo!=null && vo.getLoginId().equals(uvo.getLoginId())) {
			session.setAttribute("loginUser", uvo);
			
			return "redirect:/diary/list"; 
			
		}else {
			return "redirect:/users/login.do"; 
		}
		
	}
	
	@RequestMapping(path = "/users/checkId.do",method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Boolean> checkId(@RequestParam("loginId") String id){
		boolean exists = usersService.checkIdExists(id);
		Map<String, Boolean> response = new HashMap<>();
		response.put("exists", exists);
		return response;
	}
}
