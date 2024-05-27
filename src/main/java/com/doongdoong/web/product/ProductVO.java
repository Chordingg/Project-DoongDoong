package com.doongdoong.web.product;

import java.sql.Date;
import java.util.List;

import lombok.Data;

/*create table tbl_product(
	    product_id NUMBER(10,0),
	    userid varchar2(50) not null,
	    cateCode varchar2(30) not null,
	    regDate date default sysdate,
	    updateDate date default sysdate
);
*/

@Data
public class ProductVO {
	//사진 id
	private int product_id;
	
	//상품을 등록한 고객의 아이디(이메일)
	private String userid;
	
	//카테고리 코드(1단계 : 사진인화, 2단계 : 일반사진(general) 3단계: 폴라로이드, 4*6.....)
	private String cateCode;
	
	//등록날짜
	private Date regDate;
	
	//수정날짜
	private Date updateDate;
	
	//이미지 정보
	private List<AttachImageVO> imageList;
	
	
}
