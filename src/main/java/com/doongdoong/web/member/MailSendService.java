package com.doongdoong.web.member;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Component
@Log4j
public class MailSendService {

	@Autowired
	JavaMailSenderImpl mailSender;
	
	private int authNumber;
	
	public void makeRandomNumber() {
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
				Random random = new Random();
				int checkNum = random.nextInt(888888) + 111111;
				authNumber = checkNum;
	}
	
	public String joinEmail(String userid) {
		makeRandomNumber();
		// 이메일 보낼 양식
				String setFrom = "doongdoong8282@naver.com"; // 2단계 인증 x, 메일 설정에서 POP/IMAP 사용 설정에서 POP/SMTP 사용함으로 설정o
				String toMail = userid;
				String title = "회원가입 인증 이메일 입니다.";
				String content = "인증 코드는 " + authNumber + " 입니다." + "<br>" + "해당 인증 코드를 인증 코드 확인란에 기입하여 주세요.";

				try {
					MimeMessage message = mailSender.createMimeMessage(); // Spring에서 제공하는 mail API
					MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
					helper.setFrom(setFrom);
					helper.setTo(toMail);
					helper.setSubject(title);
					helper.setText(content, true);
					mailSender.send(message);
				} catch (Exception e) {
					e.printStackTrace();
				}

				log.info("랜덤숫자 : " + authNumber);
				return Integer.toString(authNumber);
	}

	public String findPwdCheck(String userid) {
		makeRandomNumber();
		String setFrom = "doongdoong8282@naver.com"; // 2단계 인증 x, 메일 설정에서 POP/IMAP 사용 설정에서 POP/SMTP 사용함으로 설정o
		String toMail = userid;
		String title = "비밀번호 찾기 이메일 입니다.";
		String content = "인증 코드는 " + authNumber + " 입니다." + "<br>" + "해당 인증 코드를 인증 코드 확인란에 기입하여 주세요.";

		try {
			MimeMessage message = mailSender.createMimeMessage(); // Spring에서 제공하는 mail API
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}

		log.info("랜덤숫자 : " + authNumber);
		return Integer.toString(authNumber);
}
	
}
	
	

