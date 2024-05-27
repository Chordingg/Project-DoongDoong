package com.doongdoong.web.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@GetMapping("/mainPageAdmin")
	public String mainPageAdmin() {
		
		return "admin/mainPageAdmin";
	}
	
	

}
