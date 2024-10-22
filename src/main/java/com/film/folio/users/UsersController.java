package com.film.folio.users;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.film.folio.comm.PageVo;
import com.film.folio.comm.SearchVo;
import com.film.folio.login.NaverLoginBo;
import com.film.folio.mail.MailService;

@Controller
public class UsersController {
	private NaverLoginBo naverLoginBo ;
	private String apiResult = null;

	
	@Autowired
	private void setNaverLoginBo(NaverLoginBo naverLoginBo) {
		this.naverLoginBo = naverLoginBo;
	}
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private MailService mailService;

	/* 회원 리스트 요청*/
	@RequestMapping(path = "/users/list.do", method = RequestMethod.GET)
	public String list(Model model, SearchVo searchVo){
		
		searchVo.setTotalRecordCount(usersService.countAll(searchVo));
		
		List<UsersVo> find = usersService.findUsers(searchVo);
		
		model.addAttribute("find",find);
		
		return "users/list";
	}
	
	/* 약관동의 */
	@RequestMapping(path = "/join/siteUseAgree.do", method = RequestMethod.GET)
	public String siteUseAgree() {
		return "join/siteUseAgree";
	}
	
	
	/* 회원 유형 선택 */
	@RequestMapping(path ="/join/memberRegist.do",method = {RequestMethod.GET, RequestMethod.POST})
	public String memberType(Model model, HttpSession session)  {
		   /*네이버 아이디로 인증 URL을 생성하기 위하여 naverLoginBo 클래스의 getAuthorizationUrl 메소드 호출*/
				String naverAuthUrl = naverLoginBo.getAuthorizationUrl(session);
				
				
				System.out.println("네이버"+naverAuthUrl);
				
				//네이버
				model.addAttribute("url",naverAuthUrl);
		
				return "join/memberType";
	}
	

	/* 일반회원 가입페이지 이동 요청*/
	@RequestMapping(path = "/users/add.do", method = RequestMethod.GET)
	public String add(UsersVo vo, Model model) {
		model.addAttribute("UsersVo",new UsersVo());
		return "users/add";
	}
	
	/* 일반회원 가입 요청 */
	@RequestMapping(path = "/users/add.do", method = RequestMethod.POST)
	public String add1(@Valid @ModelAttribute("UsersVo") UsersVo vo, BindingResult result) {
		
		if(result.hasErrors()){
			return "users/add";
		}
		
		int addUser = usersService.addUsers(vo);
		
		System.out.println(addUser +"명이 추가 되었습니다");
		
		return "join/complete";
	}
	
	
	/* 카카오 회원 가입 요청*/
	@RequestMapping(path ="/join/insertMember.do", method = RequestMethod.POST)
	public String insertMember(@RequestParam("loginType") String loginType,
	                           @RequestParam("loginId") String loginId,
	                           @RequestParam("name") String name,
	                           ModelMap model) {
	    
		System.err.println("Received loginType: " + loginType);
		System.err.println("Received loginId: " + loginId);
		
		UsersVo vo = new UsersVo();
	    vo.setLoginId(loginType+"-"+loginId);
	    vo.setName(name);
	 
	    UsersVo uvo = usersService.findById(vo.getLoginId());
	    System.err.println("DB조회 결과:" +uvo);
	   
	    if(uvo != null) {
	    	model.addAttribute("overlapMessage","기존 가입 고객입니다.");
	    	return "/users/login";     	
	    }else {
	    	usersService.insertJoin(vo);
	    	model.addAttribute("completeMessage","회원가입이 정상적으로 완료되었습니다..");
	        return "join/complete";	
	    }
	}
	
	
	/* 회원 마이 페이지 이동 요청 */
	@RequestMapping(path = "/users/edit.do", method = RequestMethod.GET)
	public String edit(HttpSession session, Model model) {
		
		UsersVo loginId = (UsersVo)session.getAttribute("loginUser") ; 
		
		UsersVo edit = usersService.findByIds(loginId.getLoginId());
		
		model.addAttribute("edit",edit);
		
		return "users/edit";
	}
	
	/* 회원 정보 수정 DB 전달 */
	@RequestMapping(path = "/users/edit.do", method = RequestMethod.POST)
		public String edit1(UsersVo vo) {
		
		int edit1 = usersService.editUser(vo);
		
		return "redirect:/users/list.do";
		
	}
	
	/* 회원삭제 요청 */
	@RequestMapping(path = "/users/del.do", method = RequestMethod.GET)
	public String del(@RequestParam("UserId")String UserId, HttpSession session) {
	
	int del = usersService.delUser(UserId);
	
	if(del > 0) {
		session.invalidate(); // 세션을 완전히 무효화
		return "redirect:/";
	}else {
		return "redirect:/users/login.do";
	}
	
	
	}
	
	/* 일반회원 중복확인 요청 */
	@RequestMapping(path = "/users/checkId.do",method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Boolean> checkId(@RequestParam("loginId") String id){
		boolean exists = usersService.checkIdExists(id);
		Map<String, Boolean> response = new HashMap<>();
		response.put("exists", exists);
		return response;
	}
	
	/* 아이디 찾기 */
	   @RequestMapping(path = "/users/findId.do", method = RequestMethod.POST)
	    @ResponseBody // JSON 형식으로 응답을 반환하겠다고 명시
	    public Map<String, Object> findId(@RequestParam("name") String name,
	                                       @RequestParam("email") String email) {
	        Map<String, Object> response = new HashMap<>();
	        String foundId = usersService.findIdByNameAndEmail(name, email);
	        
	        if (foundId != null) {
	            response.put("success", true);
	            response.put("id", foundId);
	        } else {
	            response.put("success", false);
	        }

	        return response; // Map을 반환하면 JSON 형태로 변환되어 클라이언트로 전송됨
	    }
	
	   //임시
	  @RequestMapping(path = "/users/findPw.do", method = RequestMethod.GET)
	  	public String findPw() {
		  return "users/password";
	  }
	  
	  /* 비밀번호 질문 찾기 */ 
     @ResponseBody
	 @RequestMapping(path = "/users/findPw.do", method = RequestMethod.POST) 
     public List<UsersVo> findPw1(@RequestParam("loginId") String loginId,
				  	  @RequestParam("name") String name,
		              @RequestParam("email") String email) {
		  
		  List<UsersVo> list = usersService.findInfo(loginId,name,email);
		  
		  
		  return list; 
		  
		}
		 
     /* 비밀번호 찾기 */
     @ResponseBody
     @RequestMapping(path = "/users/finalPw.do", method = RequestMethod.POST)
     public void finalPw(@RequestParam("email") String email, UsersVo vo) {
    	 vo.setEmail(email);
    	 
    	 String newPassword = UUID.randomUUID().toString().substring(0, 5);
    	 vo.setPassword(newPassword);
    	 usersService.updatePw(vo.getPassword(),email);
    	 
    	 String recipient = vo.getEmail();
    	 String subject = "FilmFoilo 임시 비밀번호 발송";
    	 String body = "임시 비밀번호는"+vo.getPassword()+"입니다.";
    	 
    	 mailService.sendMail(recipient, subject, body);
    }  
     
     /* 비밀번호 변경 */
     @ResponseBody
     @RequestMapping(path = "/users/changePassword.do", method = RequestMethod.POST)
     public int changePw(@RequestBody UsersVo vo
    		 			,HttpSession session) {
    	 
    	 UsersVo loginUser = (UsersVo)session.getAttribute("loginUser");
    	 
    	 String loginId = loginUser.getLoginId();  
    	 
    	 /*기존 비밀번호를 확인*/
    	 String pw = usersService.confirmPw(vo.getPassword(),loginId);
    	 System.out.println("입력된 비밀번호: " + vo.getPassword());
    	 System.out.println("확인된 로그인 아이디: " + pw);
    	 System.out.println("확인된 세션 아이디: " + loginUser.getLoginId());
    	 
    	 /*비밀번호 변경*/
    	 if(pw.equals(loginUser.getLoginId())) {
    		 int newPw = usersService.changePw(vo.getNewPassword(),loginId);
    		 return newPw;
    	 }else
    	 
    	 return 0;
     }
     	
     
}

