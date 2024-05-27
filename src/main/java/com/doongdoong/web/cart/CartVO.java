package com.doongdoong.web.cart;

import java.util.List;

import com.doongdoong.web.product.AttachImageVO;

import lombok.Data;

@Data
public class CartVO {
      
      private int cart_id;
      private String userid;
      private int product_id;
      private int amount;
      
      
      //사진 가격
      private int productPrice;
      
      //카테고리 넘버
      private String cateCode; 
      
      //상품 이름(사진종류)
      private String cateName;
      
      //상품 이미지
      private List<AttachImageVO> imageList;

}