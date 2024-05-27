package com.doongdoong.web.member;

import java.util.HashMap;

public interface SocialLoginService {
	   String getAccessToken(String code) throws Throwable;

	   HashMap<String, Object> getUserInfo(String access_Token) throws Throwable;

	   void setAuthentication(String email);
	}