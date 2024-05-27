package com.doongdoong.web.order;

import lombok.Data;

@Data
public class OrderItemVO {

	//주문번호
	private String orderId;
	
	//상품번호
	private int product_id;
	
	//주문 수량
	private int amount;
	
	//기본키
	private int orderItem_id;
	
	//상품 한 개 가격
	private int productPrice;
	
	//카테고리 넘버
	private String cateCode;
	
	//총 가격(한개 가격 * 주문수량)
	private int totalPrice;
	
	//총 가격 정의
	public void initTotal() {
		this.totalPrice = this.productPrice*this.amount;
	}
}
