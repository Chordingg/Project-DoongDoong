package com.doongdoong.web.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.doongdoong.web.member.MemberVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/cart")
public class CartController {
   
   @Autowired
   private CartService cartService;
   
   @PostMapping(value = "/add", produces = MediaType.APPLICATION_JSON_VALUE)
   @ResponseBody
   public String addCartPOST(CartVO cart, HttpServletRequest request) {
      
      //카트 등록
      int result = cartService.addCart(cart);
      return result + "";
   }
   
   
   @GetMapping("/basket/{userid:.+}")
   public String cartPageGet(@PathVariable("userid") String userid, Model model) {
      log.info(userid);
      model.addAttribute("cartInfo", cartService.getCartList(userid));
      log.info(cartService.getCartList(userid));
      return "cart/basket";
   
   }
   
   //장바구니 수량 수정
   @PostMapping("/update")
   public String updateCartPOST(CartVO cart) {
      
      cartService.modifyCount(cart);
      
      return "redirect:/cart/basket/" + cart.getUserid();
   }
   
   @PostMapping("/delete")
   public String deleteCartPOST(CartVO cart) {
      
      cartService.deleteCart(cart.getCart_id());
      
      return "redirect:/cart/basket/" + cart.getUserid();
   }


}