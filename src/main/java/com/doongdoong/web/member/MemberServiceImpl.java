package com.doongdoong.web.member;



import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.doongdoong.web.mybatis.member.MemberMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Log4j
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

	private final MemberMapper membermapper;
	
	private final PasswordEncoder passwordEncoder;
	

	   @Override
	   public int register(MemberVO memberVO, AuthVO auth) {
	      
	      memberVO.setUserpw(passwordEncoder.encode(memberVO.getUserpw()));
	      int result = membermapper.insert(memberVO);
	      membermapper.insertAuth(auth);
	      
	      return result;
	   }
	
	   @Override
		public int registerKakao(MemberVO memberVO, AuthVO auth) {
		   int result = membermapper.insertKakao(memberVO);
		      membermapper.insertAuth(auth);
		      
		   return result;
		}
	   

	@Override
	public MemberVO get(String userid) {
		return membermapper.read(userid);
	}

	@Override
	public int idCheck(String userid) {
		return membermapper.idCheck(userid);
	}
	
	@Override
	public boolean modify(MemberVO memberVO) {
		
		return membermapper.update(memberVO) == 1;
	}

	@Transactional
	public boolean delete(String userid) {
		
		// 연관된 데이터 삭제
		membermapper.deleteCartMember(userid);
		membermapper.deleteAuthMember(userid);
		
		// 최종적으로 회원 정보 삭제
		return membermapper.deleteMember(userid) == 1;
	}

	@Override
	public int emailCheck(String email) {
		int result = 0;
		String userEmail = membermapper.emailCheck(email);
		if (userEmail != null) {
			result = 1;
		} else {
			result = 0;
		}
		return result;
	}

	@Override
	public void certifiedPhoneNmuber(String phone, String numStr) {
		  String api_key = "NCSXFC2JDBKUKGKP";
	        String api_secret = "C7KIOFCNXMPMFNY77CY0FHG8DLUYF9AM";
	        Message coolsms = new Message(api_key, api_secret);

	        // 4 params(to, from, type, text) are mandatory. must be filled
	        HashMap<String, String> params = new HashMap<String, String>();
	        params.put("to", phone);    // 수신전화번호
	        params.put("from", "010-7579-8611");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	        params.put("type", "SMS");
	        params.put("text", "둥둥 휴대폰인증 테스트 메시지 : 인증번호는" + "["+numStr+"]" + "입니다.");
	        params.put("app_version", "test app 1.2"); // application name and version

	        try {
	            JSONObject obj = (JSONObject) coolsms.send(params);
	            System.out.println(obj.toString());
	        } catch (CoolsmsException e) {
	            System.out.println(e.getMessage());
	            System.out.println(e.getCode());
	        }

	    }


	@Override
	public String findUser(String phone) {
		
		return membermapper.findUser(phone);
	}

	@Override
	public MemberVO getUser(String userId) {
		return membermapper.read(userId);
	}

	@Override
	public void updatePwd(String userid, String userpw) {
		
		membermapper.updatePwd(userid, userpw);
		String userPwd = passwordEncoder.encode(userpw);
		membermapper.updatePwd(userid,userPwd);
	}
	
	

	@Override
	public boolean checkPassword(String userid, String userpw) {
		MemberVO member = membermapper.read(userid);
		if (member != null) {
			return passwordEncoder.matches(userpw, member.getUserpw());
		}
		return false;
	}

	 @Override
	    public void updateCustomerInfo(String userid, String userpw, String username, String phone, String memberAddr1, String memberAddr2, String memberAddr3) {
	        MemberVO member = membermapper.read(userid);
	        if (member != null) {
	        	member.setUserpw(passwordEncoder.encode(userpw));
	            member.setUserName(username);
	            member.setPhone(phone);
	            member.setMemberAddr1(memberAddr1);
	            member.setMemberAddr2(memberAddr2);
	            member.setMemberAddr3(memberAddr3);
	            membermapper.updateMember(member);
	        }
	    }

	@Override
	public MemberVO getMemberInfo(String userid) {
		return membermapper.getMemberInfo(userid);
	}

	@Override
	public MemberVO memberLogin(MemberVO memberVO) {
		return membermapper.memberLogin(memberVO);
	}

	
}

