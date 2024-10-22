package com.film.folio.login;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
public class NaverLoginBo {

	/* 인증 요청문을 구성하는 파라미터 */
	private final static String CLIENT_ID = "oqbBkUbbsNLxTW38Kbyj";
	private final static String CLIENT_SECRET ="aahKuAXPKW";
	private final static String REDIRECT_URI ="http://localhost:2098/callback";
	private final static String SESSION_STATE = "oauth_state";
	
	/* 프로필 조회 API URL */
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	
	/* 네이버 아이디로 인증  URL 생성  Method */
	public String getAuthorizationUrl(HttpSession session) {
		
		/* 세션 유효성 검증을 위하여 난수를 생성 */
		String state = generateRandomString();
		/* 생성한 난수 값을 session에 저장 */
		setSession(session,state);
		
	/* Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네이버 아이디 인증 URL 생성 */
		 OAuth20Service oauthService = new ServiceBuilder()
				 .apiKey(CLIENT_ID)
				 .apiSecret(CLIENT_SECRET)
				 .callback(REDIRECT_URI)
				 .state(state)// 앞서 생성한 난수 값을 인증 URL 생성시 사용함
				 .build(NaverLoginApi.instance()); //NaverLoginApi의 객체 전달
		 
		//네이버 로그인 인증을 위한 URL을 생성
		// 로그인 인증 후 REDIRECT_URI로 이동  
		 return oauthService.getAuthorizationUrl(); 
	}
	
	/* 네이버아이디로 Callback 처리 및 AccessToken 획득 Method */
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state)throws IOException{
		
		/* callback으로 전달받은 세션검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
		String sessionState = getSession(session);
		
		// session에 담긴 state와 파라미터로 전달 받은 state가 같은지를 확인
		if(StringUtils.pathEquals(sessionState,state)) {
			
			OAuth20Service oauthService = new ServiceBuilder()
					 .apiKey(CLIENT_ID)
					 .apiSecret(CLIENT_SECRET)
					 .callback(REDIRECT_URI)
					 .state(state)
					 .build(NaverLoginApi.instance());
			
			  /* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
            return accessToken;
		}
		return null;
	}
	/* 세션 유효성 검증을 위한 난수 생성기 */
    private String generateRandomString() {
        return UUID.randomUUID().toString();
    }

    /* http session에 데이터 저장 */
    private void setSession(HttpSession session,String state){
        session.setAttribute(SESSION_STATE, state);     
    }

    /* http session에서 데이터 가져오기 */ 
    private String getSession(HttpSession session){
        return (String) session.getAttribute(SESSION_STATE);
    }
    /* Access Token을 이용하여 네이버 사용자 프로필 API를 호출 */
    public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException{

    	// Scribe 라이브러리를 사용하여 OAuth20Service 객체를 생성
        OAuth20Service oauthService =new ServiceBuilder()
                .apiKey(CLIENT_ID)
                .apiSecret(CLIENT_SECRET)
                .callback(REDIRECT_URI).build(NaverLoginApi.instance());
        
        // 네이버 사용자 프로필 API URL로 GET 요청을 생성
        OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
        // Access Token을 사용하여 요청을 서명
        oauthService.signRequest(oauthToken, request);
        // 요청을 전송하고 응답
        Response response = request.send();
        // 응답 본문을 문자열로 반환
        return response.getBody();
    }

	
}
