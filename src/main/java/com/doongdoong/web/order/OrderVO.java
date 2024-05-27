package com.doongdoong.web.order;

import java.sql.Date;
import java.util.List;

import lombok.Data;

//create table tbl_order(
//	    orderId varchar2(50) primary key,
//	    addressee varchar2(50) not null,
//	    userid varchar2(50),
//	    memberAddr1 varchar2(100) not null,
//	    memberAddr2 varchar2(100) not null,
//	    memberAddr3 varchar2(100) not null,
//	    orderState varchar2(30) not null,
//	    deliveryCost number not null,
//	    orderDate date default sysdate,
//	    FOREIGN KEY (userid) REFERENCES tbl_member(userid)
//	);
//
//
//	create table tbl_orderItem(
//	    orderItemId number primary key,
//	    orderId varchar2(50),
//	    product_id number,
//	    amount number not null,
//	    productPrice number not null,
//	    cateCode varchar2(30) not null,
//	    FOREIGN KEY (orderId) REFERENCES tbl_order(orderId),
//	    FOREIGN KEY (product_id) REFERENCES tbl_product(product_id),
//	    FOREIGN KEY (cateCode) REFERENCES tbl_pcate(cateCode)
//	);

@Data
public class OrderVO {
	//주문번호
	private String orderId;
	//배송받는 이
	private String addressee;
	
	//주문 회원 아이디
	private String userid;
	
	//우편번호
	private String memberAddr1;
	//회원주소
	private String memberAddr2;
	//회원 상세주소
	private String memberAddr3;
	//주문상태
	private String orderState;
	//주문 상품
	private List<OrderItemVO> orders;
	//배송비
	private int deliveryCost;
	//주문날짜
	private Date orderDate;	

	//DB에 존재하지 않는 데이터
	//판매가
	private int orderPrice;
	
	//최종판매비용
	private int orderFinalPrice;
	
	//상품비용
	public void getOrderPriceInfo() {
		for(OrderItemVO order : orders) {
			orderPrice += order.getTotalPrice();
		}
		if(orderPrice >= 30000) {
			deliveryCost = 0;
		} else {
			deliveryCost = 3000;
		}
		//최종비용
		orderFinalPrice = orderPrice + deliveryCost;
	}
}
