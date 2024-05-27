package com.doongdoong.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(String error, String logout, Model model) {
		
		 if(error != null) { 
			  model.addAttribute("error", "아이디 / 비밀번호가 틀립니다.");
		  }
		  
		  if(logout != null) { 
			  model.addAttribute("logout", "정상적으로 로그아웃 되었습니다."); 
		  }
		  
		  // index.jsp로 포워딩
		  return "index";
	}
}
