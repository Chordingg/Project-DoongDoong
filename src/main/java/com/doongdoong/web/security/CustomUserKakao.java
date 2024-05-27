package com.doongdoong.web.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import com.doongdoong.web.member.MemberVO;


import lombok.Getter;


@Getter
public class CustomUserKakao extends User{

   private static final long serialVersionUID = 1L;
   
   private MemberVO memberVO;
   
   public CustomUserKakao(String username, String password, 
         Collection<? extends GrantedAuthority> authorities) {
      super(username, password, authorities);
      
   }
   
   public CustomUserKakao(MemberVO vo) {
      super(vo.getUserid(), "", vo.getAuthList().stream()
    		  .map(auth -> new SimpleGrantedAuthority(auth.getAuth())).
            collect(Collectors.toList()));
      
      this.memberVO = vo;
   }
}