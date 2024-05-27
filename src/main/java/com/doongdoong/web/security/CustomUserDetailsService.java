package com.doongdoong.web.security;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.doongdoong.web.member.MemberVO;
import com.doongdoong.web.mybatis.member.MemberMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
// @RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService{
	
	@Autowired
	private MemberMapper mapper;
	
	@Override	
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		log.info("------------------------------------------");
		log.info(username);
		log.info("------------------------------------------");
		
		MemberVO vo = mapper.read(username);
		
		log.info(vo);
		
		return vo == null ? null : new CustomUser(vo);
	}
}
