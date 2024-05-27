package com.doongdoong.web.myinfo;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doongdoong.web.member.MemberService;
import com.doongdoong.web.member.MemberVO;
import com.doongdoong.web.security.CustomUser;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/myinfo/*")
public class MyInfoController {

	private final MemberService memberService;

	@GetMapping("/customer")
	public void myinfo(Model model) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) authentication.getPrincipal();
		String userid = user.getUsername();

		log.info("==============" + userid + "==============");
		log.info("================myinfo================");

		model.addAttribute("user", memberService.get(userid));

	}
	
	@GetMapping("/password-check")
    public String showPasswordCheckForm() {
		
        return "/myinfo/checkPwd";
    }

    @PostMapping("/password-check")
    public String checkPassword(@RequestParam String userid, @RequestParam String userpw, RedirectAttributes redirectAttributes) {
        boolean isPasswordCorrect = memberService.checkPassword(userid, userpw);
        if (!isPasswordCorrect) {
            redirectAttributes.addFlashAttribute("error", "비밀번호가 올바르지 않습니다.");
            return "redirect:/myinfo/password-check";
        }
        return "redirect:/myinfo/update-form?userid=" + userid;
    }
    
    @GetMapping("/update-form")
    public String showUpdateForm(@RequestParam String userid, Model model) {
        MemberVO user = memberService.get(userid);
        model.addAttribute("user", user);
        return "/myinfo/customer";
    }
	

	@PostMapping("/update")
	public String updateCustomerInfo(@RequestParam String userid, @RequestParam String userpw,
			@RequestParam String username, @RequestParam String phone, @RequestParam String memberAddr1,
			@RequestParam String memberAddr2, @RequestParam String memberAddr3, RedirectAttributes redirectAttributes) {
		memberService.updateCustomerInfo(userid, userpw, username, phone, memberAddr1, memberAddr2, memberAddr3);
		return "redirect:/mainPage";
	}
	
	@PostMapping("/delete")
	public String deleteCustomer(HttpServletRequest request, RedirectAttributes redirectAttributes) {

		// 현재 인증된 사용자 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		CustomUser customUser = (CustomUser) authentication.getPrincipal();
		MemberVO memberVO = customUser.getMemberVO();
		
		// 회원을 삭제합니다.
		memberService.delete(memberVO.getUserid());
		
		// 로그아웃 처리합니다.
		SecurityContextHolder.clearContext();
		
		return "redirect:/"; // 메인 페이지로 리다이렉트합니다.
	}
}
