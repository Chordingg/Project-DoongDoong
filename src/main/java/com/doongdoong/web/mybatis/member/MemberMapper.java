package com.doongdoong.web.mybatis.member;

import org.apache.ibatis.annotations.Param;

import com.doongdoong.web.member.AuthVO;
import com.doongdoong.web.member.MemberVO;

public interface MemberMapper {
	
	public int insert(MemberVO memberVO);	// 회원 가입
	public void insertAuth(AuthVO auth);	// 회원 가입
	
	public int insertKakao(MemberVO memberVO); // 카카오 회원 가입
	
	public MemberVO read(String userid);	// 회원 조회
	
	public int idCheck(String userid);		//아이디 중복 검사
	
	public int update(MemberVO memberVO);	// 회원 정보 수정

	public int deleteMember(String userid);		// 회원 탈퇴
	public void deleteAuthMember(String userid);	
	public void deleteCartMember(String userid);
	//void deleteReviewMember(String userid);
	
	
	public String emailCheck(String email); // 카카오 로그인할 때 이메일 체크
	
	public String findUser(String phone); // 비밀번호 찾을 때 phone 써서 찾으려고

	public void updatePwd(@Param("userid") String userid, @Param("userpw")String userpw); //비밀번호 변경
	
	public void updateMember(MemberVO member);

	
	//주문자 주소 정보
	public MemberVO getMemberInfo(String userid);
	
	//로그인
	public MemberVO memberLogin(MemberVO memberVO);
	
}
