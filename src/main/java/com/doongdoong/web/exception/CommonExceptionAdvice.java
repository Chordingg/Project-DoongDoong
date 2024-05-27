package com.doongdoong.web.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import lombok.extern.log4j.Log4j;

@ControllerAdvice	// Controller 에서 발생한 예외처리
@Log4j
public class CommonExceptionAdvice {

	// Exception 클래스가 발생했을 때 처리할 메서드를 정의
	@ExceptionHandler(Exception.class)	
	// 발생한 예외, 예외 정보를 담기 위한 Model 객체 
	public String except(Exception ex, Model model) {
		log.error("exception ------" + ex.getMessage());
		model.addAttribute("exception", ex);
		
		log.error(model);
		return "error_page";
	}
}
