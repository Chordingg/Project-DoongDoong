package com.doongdoong.web.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import com.doongdoong.web.member.MemberVO;

import lombok.Getter;


@Getter
public class CustomUser extends User{

   private static final long serialVersionUID = 1L;
   
   private MemberVO memberVO;	//  회원 + 권한 정보 = principal.memberVO
   
   public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
      super(username, password, authorities);
      
   }
   
   // VO 객체 : 회원정보 + 권한정보(authList)를 가짐
   public CustomUser(MemberVO vo) {
	  // 부모클래스 User이다.
      super(vo.getUserid(), vo.getUserpw(), vo.getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
      
      this.memberVO = vo;
   }
   
   public MemberVO getMemberVO() {
	   return memberVO;
   }
   
   
}