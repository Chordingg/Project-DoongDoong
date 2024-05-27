package com.doongdoong.web.order;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.doongdoong.web.cart.CartVO;
import com.doongdoong.web.member.MemberVO;
import com.doongdoong.web.mybatis.cart.CartMapper;
import com.doongdoong.web.mybatis.member.MemberMapper;
import com.doongdoong.web.mybatis.order.OrderMapper;
import com.doongdoong.web.mybatis.product.ProductMapper;
import com.doongdoong.web.product.AttachImageVO;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private CartMapper cartMapper;
	
	
	
	@Override
	public List<OrderPageItemVO> getProductInfo(List<OrderPageItemVO> orders) {

		List<OrderPageItemVO> result = new ArrayList<OrderPageItemVO>();
		
		for(OrderPageItemVO orv : orders) {
			OrderPageItemVO productInfo = orderMapper.getProductInfo(orv.getProduct_id());
			
			productInfo.setAmount(orv.getAmount());
			
			productInfo.initTotal();
			
			List<AttachImageVO> imageList = productMapper.getAttachList(productInfo.getProduct_id());
			
			productInfo.setImageList(imageList);
			
			
			result.add(productInfo);
		}
		return result;
		
	}

	@Override
	@Transactional
	public void Order(OrderVO orderVO) {
		//사용할 데이터 가져오기
			//회원정보
			MemberVO memberVO = memberMapper.getMemberInfo(orderVO.getUserid());
			//주문정보
			List<OrderItemVO> ords = new ArrayList<>();
			for(OrderItemVO oiv : orderVO.getOrders()) {
				OrderItemVO orderItem = orderMapper.getOrderInfo(oiv.getProduct_id());
				//수량 세팅
				orderItem.setAmount(oiv.getAmount());
				//카테고리 세팅
				orderItem.setCateCode(oiv.getCateCode());
				//기본정보 세팅
				orderItem.initTotal();
				//List객체 추가
				ords.add(orderItem);
			}
			
			//OrderVO 세팅
			orderVO.setOrders(ords);
			orderVO.getOrderPriceInfo();
			
			//DB주문, 주문상품, 배송정보 넣기
			
				//orderId만들기 및 OrderVO 객체 orderId에 저장
				Date date = new Date();
				SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
				String orderId = memberVO.getUserid() + format.format(date);
				orderVO.setOrderId(orderId);
				
				//DB넣기
				orderMapper.enrollOrder(orderVO);
				for(OrderItemVO oiv : orderVO.getOrders()) {
					oiv.setOrderId(orderId);
					orderMapper.enrollOrderItem(oiv);
					
				}
				
				
				//비용 포인트 변동 적용
				//비용 차감 & 변동 돈 member적용
				int calMoney = memberVO.getMoney();
				calMoney -= orderVO.getOrderFinalPrice();
				memberVO.setMoney(calMoney);
				
				//DB적용
				orderMapper.deductMoney(memberVO);
				
				//장바구니 제거
				for(OrderItemVO oiv : orderVO.getOrders()) {
					CartVO cart = new CartVO();
					cart.setUserid(orderVO.getUserid());
					cart.setProduct_id(oiv.getProduct_id());
					
					cartMapper.deleteOrderCart(cart);
				}
	}
	
	

	

}
