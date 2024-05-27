package com.doongdoong.web.member;

public interface MemberService {

	public int register(MemberVO memberVO, AuthVO authVO); // 회원 가입

	public int registerKakao(MemberVO memberVO, AuthVO authVO); // 회원 가입
	
	public MemberVO get(String userid); // 회원 조회

	public int idCheck(String userid); // 아이디 중복 검사

	public boolean modify(MemberVO memberVO); // 회원 정보 수정

	public boolean delete(String userid); // 회원 탈퇴
	
	public int emailCheck(String email);
	
	public void certifiedPhoneNmuber(String phone, String numStr); //본인인증(문자)

	public String findUser(String phone); //비밀번호 찾기 할 때 사용하는 service(핸드폰번호로 찾기)

	public MemberVO getUser(String userId);  //아이디 찾기 해서 가져오는 userId

	public void updatePwd(String userid, String userpw); //비밀번호 변경
	
	public boolean checkPassword(String userid, String userpw);
	
	public void updateCustomerInfo(String userid, String userpw, String userName, String phone, String memberAddr1, String memberAddr2, String memberAddr3);
	
	
	//주문자 정보
	public MemberVO getMemberInfo(String userid);
	
	//로그인
	public MemberVO memberLogin(MemberVO memberVO);
}
