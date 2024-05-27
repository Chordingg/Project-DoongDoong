package com.doongdoong.web.service;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/service/*")
public class ServiceController {
	
	private final NoticeService noticeService;
	
	@GetMapping("/notice")
	public void serviceNotice(Model model) {
		
		log.info("notice............");
		
		model.addAttribute("notice", noticeService.getList());
		
	}
	
	@GetMapping({"/noticeGet" , "/noticeModify"})
	public void serviceNoticeGet(@RequestParam("nno") Long nno, Model model) {
		
		log.info("noticeGet, Modify............");
		
		model.addAttribute("notice", noticeService.get(nno));
		
	}
	
	@GetMapping("/noticeInsert")
	@PreAuthorize("isAuthenticated()")
	public void serviceNoticeInsertGet(){
		
		log.info("noticeInsert............");
		
		
	}
	
	@PostMapping("/noticeInsert")
	@PreAuthorize("isAuthenticated()")
	public String serviceNoticeInsertPost(NoticeVO noticeVO, RedirectAttributes rttr) {
		log.info("noticeInsert......." + noticeVO);
		
		noticeService.insert(noticeVO);
		
		rttr.addFlashAttribute("result", noticeVO.getNno());
		
		return "redirect:/service/notice";   //views/service/notice.jsp
	}
	
	@PostMapping("/noticeModify")
	public String serviceNoticeModifyPost(NoticeVO noticeVO, RedirectAttributes rttr) {
		
		log.info("noticeModify POST............" + noticeVO);
		
		if(noticeService.modify(noticeVO)) {
			rttr.addFlashAttribute("result", "modify");
		}
		
		return "redirect:/service/notice";
	}
	
	@PreAuthorize("principal.username == #writer")
	@PostMapping("/noticeRemove")
	public String serviceNoticeRemove(@RequestParam("nno") Long nno, RedirectAttributes rttr,
									  @RequestParam("writer") String writer) {
		
		log.info("noticeRemove............");
		
		if(noticeService.remove(nno)) {
			rttr.addAttribute("result", "delete");
		}
		
		return "redirect:/service/notice";
	}
	
	
	
	@GetMapping("/question")
	public String serviceQuestion() {
		
		
		return "service/question";
	}
	
	@GetMapping("/event")
	public String serviceEvent() {
		
		
		return "service/event";
	}
	
	@GetMapping("/center")
	public String serviceCenter() {
		
		
		return "service/center";
	}

}
