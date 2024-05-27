package com.doongdoong.web.mybatis.order;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.doongdoong.web.cart.CartVO;
import com.doongdoong.web.member.MemberTests;
import com.doongdoong.web.member.MemberVO;
import com.doongdoong.web.mybatis.cart.CartMapper;
import com.doongdoong.web.order.OrderItemVO;
import com.doongdoong.web.order.OrderVO;

import lombok.extern.log4j.Log4j;


@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					   "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class OrderMapperTest {

	@Autowired
	private OrderMapper ordermapper;
	
	@Autowired
	private CartMapper cartmapper;
	
	@Test
	public void getOrderInfoTest() {
		OrderItemVO orderInfo = ordermapper.getOrderInfo(17);
		System.out.println("result : " + orderInfo);
	}
	
	
	@Test
	public void enrollOrderTest() {
		OrderVO odv = new OrderVO();
		List<OrderItemVO> orders = new ArrayList();
		
		OrderItemVO order1 = new OrderItemVO();
		
		order1.setProduct_id(10);
		order1.setAmount(5);
		order1.setProductPrice(10000);
		order1.initTotal();
		
		odv.setOrders(orders);
		
		odv.setOrderId("test1");
		odv.setAddressee("test");
		odv.setUserid("jangse24@naver.com");
		odv.setMemberAddr1("test");
		odv.setMemberAddr2("test2");
		odv.setMemberAddr3("test3");
		odv.setDeliveryCost(3000);
		odv.getOrderPriceInfo();
		
		ordermapper.enrollOrder(odv);
		
	}
	
	// tbl_itemorder 테이블
	@Test
	public void enrollOrderItemTest() {
		OrderItemVO oiv = new OrderItemVO();
		
		
		oiv.setOrderId("test1");
		oiv.setProduct_id(17);
		oiv.setAmount(10);
		oiv.setProductPrice(500);
		oiv.setCateCode("112001");
		
		oiv.initTotal();
		
		ordermapper.enrollOrderItem(oiv);
	}
	
	@Test
	public void deductMoneyTest() {
		MemberVO member = new MemberVO();
		
		member.setUserid("jangse24@naver.com");
		member.setMoney(500000);
		ordermapper.deductMoney(member);
	}
	
	//장바구니 제거
	@Test
	public void deleteOrderCart() {
		String userid = "jangse24@naver.com";
		int product_id = 17;
		
		CartVO cart = new CartVO();
		cart.setUserid(userid);
		cart.setProduct_id(product_id);
		
		cartmapper.deleteOrderCart(cart);
	}

}
