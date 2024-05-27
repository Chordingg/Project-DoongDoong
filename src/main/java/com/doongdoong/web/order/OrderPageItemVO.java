package com.doongdoong.web.order;

import java.util.List;

import com.doongdoong.web.product.AttachImageVO;

import lombok.Data;

@Data
public class OrderPageItemVO {

	//뷰로부터 전달받을 값
	private int product_id;	
	private int amount;
	
	//DB로부터 꺼내올 값
	private String cateCode;
	
	private String cateName;
	
	private int productPrice;

	//만들어 낼 값
    private int totalPrice;
    
    public void initTotal() {
    	this.totalPrice = this.productPrice*this.amount;
    }
    
    //상품 이미지
    private List<AttachImageVO> imageList;
}
