package com.doongdoong.web.service;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/*
create table tbl_notice (
    nno number(10,0),
    title varchar2(200) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    upadtedate date default sysdate
);
*/

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class NoticeVO {
	private Long nno;
	private String title;
	private String content;
	private String writer;
	
	private Date regdate;
	private Date updateDate;
}
