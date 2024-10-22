package com.film.folio;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.film.folio.users.UsersVo;

@Controller
@RequestMapping("/")
public class MainController {
	
	@GetMapping("/")
	public String main(HttpSession session,ModelMap model) {
		
		UsersVo loginUser = (UsersVo) session.getAttribute("loginUser");
		
		model.addAttribute("loginUser",loginUser);
		
		return "main";
	}
}
