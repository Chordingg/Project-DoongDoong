package com.doongdoong.web.member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
create table tbl_member_auth (
     userid varchar2(50) not null,
     auth varchar2(50) not null,
     memberAddr1 varchar2(100) not null, 
     memberAddr2 varchar2(100) not null, 
     memberAddr3 varchar2(100) not null,
     constraint fk_member_auth foreign key(userid) references tbl_member(userid)
);
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AuthVO {
	
	private String userid;
	private String auth;
	
}
