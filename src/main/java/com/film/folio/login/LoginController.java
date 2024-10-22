package com.film.folio.login;

import java.io.IOException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;
import com.film.folio.login.NaverLoginBo;
import com.film.folio.users.UsersService;
import com.film.folio.users.UsersVo;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonSyntaxException;
import com.google.gson.JsonElement;



@Controller
public class LoginController {

	private NaverLoginBo naverLoginBo ;
	private String apiResult = null;
	
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private void setNaverLoginBo(NaverLoginBo naverLoginBo) {
		this.naverLoginBo = naverLoginBo;
	}
	
	/* 네이버 로그인 첫 화면 요청 메소드 */
	@RequestMapping(value = "/login/naverlogin.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String loginNaver(Model model, HttpSession session) {
		
	    /*네이버 아이디로 인증 URL을 생성하기 위하여 naverLoginBo 클래스의 getAuthorizationUrl 메소드 호출*/
		String naverAuthUrl = naverLoginBo.getAuthorizationUrl(session);
		
		
		System.out.println("네이버"+naverAuthUrl);
		
		//네이버
		model.addAttribute("url",naverAuthUrl);
		
		//생성한 인증 URL을 view로 전달
		
		return "users/naverLogin";
	}
	
	/* 네이버 로그인 성공시 callback호출 메소드 */
	@RequestMapping(value = "/callback", method = {RequestMethod.GET, RequestMethod.POST})
	public String login(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException{
	    System.out.println("callback 입니다");
	    OAuth2AccessToken oauthToken = naverLoginBo.getAccessToken(session, code, state);

	    // 로그인 사용자 정보를 읽어옴
	    String apiResult = naverLoginBo.getUserProfile(oauthToken);
	    System.out.println(apiResult); //프로필 조회 최종 응답

	    // JSON 파싱
	    try {
	        JsonElement jsonElement = JsonParser.parseString(apiResult);
	        JsonObject jsonObject = jsonElement.getAsJsonObject();
	        JsonObject responseJson = jsonObject.getAsJsonObject("response");

	        String userId = responseJson.get("id").getAsString();
	        String userName = responseJson.get("name").getAsString();
	        
	        // DB에서 사용자 정보 조회
	        String loginType = "Naver";
	        String loginId=(loginType + "-" + userId);
	        UsersVo user = usersService.findById(loginId);
	        
	        if (user == null) {
	            // DB 저장 로직
	            UsersVo vo = new UsersVo();
	            vo.setLoginId(loginId);
	            vo.setName(userName);
	            usersService.insertJoin(vo); // 사용자 정보를 DB에 저장

	            // 세션에 사용자 정보 저장
	            session.setAttribute("loginUser", vo);

	        } else {
	            // 사용자가 이미 존재하면 로그인 처리
	            session.setAttribute("loginUser", user);
	            System.err.println("세션에 저장된 loginUser: " + user);
	        }

	        model.addAttribute("loginUser",user);
	        return "main";
	    } catch (JsonSyntaxException e) {
	        e.printStackTrace();
	        return "join/error";
	    }
	}
	
	/* 로그인 jsp 이동 요청 */ 
	@RequestMapping(path = "/login/login.do",method =RequestMethod.GET)
	public String loginform(Model model, HttpSession session ) {
		
		/*네이버 아이디로 인증 URL을 생성하기 위하여 naverLoginBo 클래스의 getAuthorizationUrl 메소드 호출*/
		// standard session(표준 세션)이 매개 변수로 전달
		String naverAuthUrl = naverLoginBo.getAuthorizationUrl(session);
		
		
		System.out.println("네이버"+naverAuthUrl);
		
		//네이버
		model.addAttribute("url",naverAuthUrl);
		
		//생성한 인증 URL을 view로 전달
		
		return "users/login";
	}
	
	/* 로그인 DB 요청 */
   @RequestMapping(path = "/login/login.do", method = RequestMethod.POST)
   public String login(UsersVo vo, HttpSession session) {

       // 일반 로그인 처리
       UsersVo uvo = usersService.findById(vo.getLoginId());
       if (uvo != null) {
           if (vo.getLoginId().equals(uvo.getLoginId()) && vo.getPassword().equals(uvo.getPassword())) {  // 로그인 ID 일치 확인
               session.setAttribute("loginUser", uvo);  // 세션에 로그인 사용자 저장
               return "redirect:/";  // 메인 페이지로 리다이렉트
           }
       } else {
           // 네이버 로그인 처리
           String kid = vo.getLoginType() + "-" + vo.getLoginId();
           uvo = usersService.findById(kid);  // 네이버 로그인 ID 조회

           if (uvo != null && kid.equals(uvo.getLoginId())) {  // 네이버 로그인 ID 확인
               session.setAttribute("loginUser", uvo);  // 세션에 로그인 사용자 저장
               return "redirect:/";  // 메인 페이지로 리다이렉트
           }
       }

       // 로그인 실패 시
       return "redirect:/login/login.do";
   }

	/* 로그아웃 요청 */ 
	@RequestMapping(path = "/login/logout.do" ,method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		/* session 초기화  */	
		session.invalidate(); 
		
		/* 메인페이지로 이동  */
		return "redirect:/";
	}
	
}
