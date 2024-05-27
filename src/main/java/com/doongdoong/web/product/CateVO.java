package com.doongdoong.web.product;

import lombok.Data;

/*
 *create table tbl_pcate(
    tier number(1) not null,
    cateName varchar2(30) not null,
    cateCode varchar2(30) not null,
    cateParent varchar2(30),
    productPrice number,
    primary key(cateCode),
    foreign key(cateParent) references tbl_pcate(cateCode)
);
*/
@Data
public class CateVO {
	
	//카테고리 등급
	private int tier;
	
	//카테고리 이름
	private String cateName;
	
	//사진 가격
	private int productPrice;
	
	//카테고리 넘버
	private String cateCode;
	
	//상위 카테고리
	private String cateParent;
	
}
