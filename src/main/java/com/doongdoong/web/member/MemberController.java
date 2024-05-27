package com.doongdoong.web.member;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService memberservice;
	
	private final SocialLoginService kakaoLoginService;
	
	private final MailSendService mailSendService;
	
	// 회원가입 페이지 이동
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGET() {
		
		log.info("===============================================");
		log.info("================회원가입 페이지 진입=================");
		log.info("===============================================");
		
	return "/member/register";

	}
	

	// 회원가입
	@PostMapping("/register")
	public String registerPOST(MemberVO memberVO, AuthVO auth, RedirectAttributes rttr) {
		
		memberservice.register(memberVO, auth);

		log.info("=======================================================");
		log.info("======================register 성공======================");
		log.info("=======================================================");
		
		 // 회원가입 성공 시
	    if (memberVO.getUserid() != null && !memberVO.getUserid().isEmpty()) {
	        rttr.addFlashAttribute("success", "회원가입에 성공했습니다.");
	    } else { // 회원가입 실패 시
	        rttr.addFlashAttribute("error", "회원가입에 실패했습니다.");
	    }
		
		return "redirect:/";	// views/  -> index
	}
	
	// 아이디 중복검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String userid) {

		int result = memberservice.idCheck(userid);

		if (result != 0) {
			return "fail";

		} else {
			return "success";
		}
	}
	

	// 이메일 인증
	@PostMapping("/EmailAuth")
	public ResponseEntity<String> emailAuth(String userid) {
		System.out.println("요청온 아이디(이메일) : " + userid);
		return new ResponseEntity<String>(mailSendService.joinEmail(userid), HttpStatus.OK);
	}		
		
	
	// 카카오 로그인을 할 때
	@GetMapping("/login/oauth")
	public String kakaoOauth(@RequestParam(required = false) String code, Model model, RedirectAttributes rttr,
			HttpSession session) throws Throwable {
		String url = "";

		String access_Token = kakaoLoginService.getAccessToken(code);

		HashMap<String, Object> userInfo = kakaoLoginService.getUserInfo(access_Token);

		String userEmail = (String) userInfo.get("email"); // 이메일
		String nickName = (String) userInfo.get("nickName"); // 닉네임
		int result = memberservice.emailCheck(userEmail);

		if (result != 0) {
			kakaoLoginService.setAuthentication(userEmail);
			session.setAttribute("token", access_Token);
			url = "redirect:/mainPage";
		} else {
			rttr.addAttribute("userEmail", userEmail);
			rttr.addAttribute("nickName", nickName);
			url = "redirect:/kakaoJoin";
		}
		return url;
	}
	
	
	   // 카카오 회원가입 페이지로 이동
    @GetMapping("/kakaoJoin")
    public String kakaoJoin(Model model, @ModelAttribute("userEmail") String userEmail,
          @ModelAttribute("nickName") String nickName) {
       log.info("kakaoJoin");
       model.addAttribute("userEmail", userEmail);
       model.addAttribute("nickName", nickName);
       return "/member/kakaoJoin";
    }
 
    
    
    // 카카오 로그인으로 간편 회원가입
    @PostMapping("/kakaoJoin")
    public String kakaoJoin(RedirectAttributes rttr, MemberVO memberVO, AuthVO auth) {
       int result = memberservice.registerKakao(memberVO, auth);
       
       if (result == 1) {
          rttr.addFlashAttribute("result", "success");
       } else {
          rttr.addFlashAttribute("result", "faild");
       }
       return "redirect:/mainPage";
    }
	
	//아이디찾기 페이지로 이동
	@GetMapping("/findUser")
	public String findUser() {
		return "/member/findUser";
	}
	
	//아이디찾기(핸드폰에 문자 보내기) 실행
	@GetMapping("/check/sendSMS")
	public @ResponseBody
	String sendSMS(String phone) {
		Random rand = new Random();
		String numStr = "";
		for(int i=0; i<6; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}
		
		memberservice.certifiedPhoneNmuber(phone, numStr);
		return numStr;
			
	}
	
	//아이디 찾아서 인덱스 페이지에 id(이메일) 창에 쏙 집어넣기위해
	@PostMapping("/findUser")
	public String findUser(Model model, String phone) {
		
		String userid = memberservice.findUser(phone);
		
		model.addAttribute("userid", userid);
		log.info(userid);
		return "index";
	}
	
	//비밀번호 찾기
	@GetMapping("/findPwd")
	public String findPwd() {
		return "/member/findPwd";
	}
	
	// 비밀번호 찾기에서 인증번호(이메일) 인증 눌렀을 경우
	@GetMapping("/findPwdCheck")
	public ResponseEntity<String> findPwdCheck(@RequestParam("userid") String userid) {
		log.info("Received userid: " + userid); // 디버깅용 로그
		int result = memberservice.idCheck(userid);
		log.info("ID Check result: " + result);

		if (result != 0) {
			MemberVO memberVO = memberservice.getUser(userid);
			if (memberVO.getUserpw() == null) {
				return new ResponseEntity<String>("kakaoUser", HttpStatus.OK);
			} else {
				String code = mailSendService.findPwdCheck(userid);
				log.info("Generated code: " + code); // 디버깅용 로그
				return new ResponseEntity<String>(code, HttpStatus.OK);
			}
		} else {
			return new ResponseEntity<String>("noUser", HttpStatus.OK);
		}
	}

	//인증번호 인증 후 비밀번호 변경 페이지로 이동
	@PostMapping("/findPwd")
	public String changePwd(Model model, @RequestParam String userid) {
		model.addAttribute("userid", userid);
		return "/member/changePwd";
	}
	
	//비밀번호 변경
	@PostMapping("/updatePwd")
	public String updatePwd(@RequestParam String userpw, @RequestParam String userid) {
		memberservice.updatePwd(userid, userpw);
		
		return "index";	// views/  -> index
	}
	
}
