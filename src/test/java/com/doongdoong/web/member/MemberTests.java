package com.doongdoong.web.member;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.doongdoong.web.mybatis.member.MemberMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					   "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class MemberTests {
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	private MemberMapper memberMapper;
	
	
	@Test
	public void testRead() {
		MemberVO vo = memberMapper.read("user2");
		log.info(vo);
	}
	
	@Test
	   public void memberIdChk() {
	      String userid = "admin";
	      String userid2 = "doongdoong8282@naver.com";
	      memberMapper.idCheck(userid);
	      memberMapper.idCheck(userid2);
	   }
}
