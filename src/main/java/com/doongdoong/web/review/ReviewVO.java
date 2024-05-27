package com.doongdoong.web.review;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

/*
 * create table tbl_review (
    userid varchar2(50) not null,
    rno number(10,0),
    product_id varchar2(50) not null,
    title varchar2(200) not null,
    content varchar2(2000),
    score NUMBER(1,0) NOT NULL,
    photo BLOB,
    regdate date default sysdate,
    upadtedate date default sysdate
    ,constraint fk_review foreign key(userid) references tbl_member(userid)
);
*/
@Data
public class ReviewVO {
	
	private String userid;
	private Long rno;
	private String product_id;
	private String title;
	private String content;
	
	private int score;
	private byte[] photo;
	
	private Date regdate;
	private Date updateDate;

}
