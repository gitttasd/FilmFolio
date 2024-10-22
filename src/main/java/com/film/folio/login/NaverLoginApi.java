package com.film.folio.login;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverLoginApi extends DefaultApi20 {
	
	  //싱글턴 패턴
	  protected NaverLoginApi(){
	    }

	  	//정적 내부 클래스(static 키워드를 사용하여 외부클래스 내부에서 정의된 클래스)
	  	//외부 클래스 인스턴스가 생성이 되지 않더라도 인스턴스를 생성할 수 있음
	  	//private로 선언이 되어있기 때문에 InstanceHolder 외에는 NaverLoginApi의 객체를 생성할 수 X
	  
	  private static class InstanceHolder{
	        private static final NaverLoginApi INSTANCE = new NaverLoginApi();
	    }

	  	
	  	// NaverLoginApi 정적 매서드
	  	// 외부에서 호출
	  	//static이기 때문에 NaverLoginApi의 객체가 없어도 매서드 호출 가능
	    public static NaverLoginApi instance(){
	        return InstanceHolder.INSTANCE; //InstanceHolder의 필드에 접근
	    }
	
	@Override
	public String getAccessTokenEndpoint() {
		return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		return "https://nid.naver.com/oauth2.0/authorize";
	}

}
