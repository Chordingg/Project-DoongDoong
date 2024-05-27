package com.doongdoong.web.main;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doongdoong.web.member.MemberService;
import com.doongdoong.web.member.MemberVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Controller
@RequiredArgsConstructor
public class MainPageController {
   
   private final MemberService memberService;

   @GetMapping("/mainPage" )
   public String mainPage(Model model, HttpSession session) {
      MemberVO memberVO = (MemberVO) session.getAttribute("userid");

      log.info("mainPage....................");
      
      if (memberVO != null) {
           model.addAttribute("user", memberVO);
       }
      
      log.info("=-=--=-=--=-==--=- : " + memberVO);
      
      return "/main/mainPage";
   }


   @GetMapping("/introduction")
   public String introduction() {

   return "/introduction/introduction";
   }
   
   @GetMapping("/doongdoong-map")
   public String doongdoongMap(){
      
   return "/introduction//doongdoong-map";
   }
}