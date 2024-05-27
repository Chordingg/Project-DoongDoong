package com.doongdoong.web.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/photoBook")
public class PhotoBookController {
	
	@GetMapping("/square")
	public String PhotoBookSquare() {
		
		return "product/photoBook/square";
	}
	
	@GetMapping("/vertical")
	public String PhotoBookVertical() {
		
		return "product/photoBook/vertical";
	}
	
	@GetMapping("/horizontal")
	public String PhotoBookHorizontal() {
		
		return "product/photoBook/horizontal";
	}

}
