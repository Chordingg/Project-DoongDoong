package com.doongdoong.web.member;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/*
 	  create table tbl_member(
      userid varchar2(50) not null primary key,
      userpw varchar2(100) not null,
      userName varchar2(100) not null,
      membername varchar2(100) not null,
      phone varchar2(50) not null,
      regdate date default sysdate, 
      updatedate date default sysdate,
      enabled char(1) default '1');
*/

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MemberVO {
	
	private String userid, userpw, userName;
	
	private String memberAddr1, memberAddr2, memberAddr3;
	
	private String phone;
	
	private int money;
	
	private boolean enabled;
	
	private Date regDate, updateDate;
	
	private List<AuthVO> authList;
	
}
