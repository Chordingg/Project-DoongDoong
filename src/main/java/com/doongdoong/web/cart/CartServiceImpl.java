package com.doongdoong.web.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doongdoong.web.mybatis.cart.CartMapper;
import com.doongdoong.web.mybatis.product.ProductMapper;
import com.doongdoong.web.product.AttachImageVO;

@Service
public class CartServiceImpl implements CartService{

   @Autowired
   private CartMapper cartMapper;
   
   @Autowired
   private ProductMapper productMapper;
   
   @Override
   public int addCart(CartVO cart) {

      //장바구니 데이터 체크
      CartVO cartCheck = cartMapper.checkCart(cart);
      
      if(cartCheck != null) {
         return 2;
      }
      
      //장바구니 등록 & 에러 시 0 반환
      try {
         return cartMapper.addCart(cart);
      } catch (Exception e) {
         return 0;
      }
      
   }

   @Override
   public List<CartVO> getCartList(String userid) {

      List<CartVO> cart = cartMapper.getCart(userid);
      
      for(CartVO dto : cart) {
         int product_id = dto.getProduct_id();
         
         List<AttachImageVO> imageList = productMapper.getAttachList(product_id);
         
         dto.setImageList(imageList);
      }
      
      return cart;
   }
   
   @Override
   public int modifyCount(CartVO cart) {

      return cartMapper.modifyCount(cart);
   }
   
   @Override
   public int deleteCart(int cart_id) {
      return cartMapper.deleteCart(cart_id);
   }


}