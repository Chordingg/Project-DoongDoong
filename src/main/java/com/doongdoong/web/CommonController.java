package com.doongdoong.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CommonController {
	

	@GetMapping("/accessError")
	public String accessDenied(Authentication auth, Model model) {
		
		log.info("==================================================");
		log.info(auth);
		log.info("==================================================");
		log.info("-------------------------------------");
		log.info(auth);
		
		model.addAttribute("msg", "접근 권한이 없습니다.");
		
		return "/member/accessError";
	}
	
	@GetMapping("/customLogout")
	public void logoutGET() {
		
		log.info("==================================================");
		log.info("==================custom logout===================");
		log.info("==================================================");
		
	}
	
	// 카카오로 로그인했을 때 따로 만든 카카오 로그아웃
	@GetMapping("/kakaoLogout")
	public void logoutGET(RedirectAttributes rttr, HttpServletRequest request, HttpServletResponse response,
			HttpSession session, SessionStatus status) throws Throwable {
		log.info("카카오 로그아웃");
		session.invalidate();
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}

	}
}
