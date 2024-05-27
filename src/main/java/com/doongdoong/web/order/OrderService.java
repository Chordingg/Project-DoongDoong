package com.doongdoong.web.order;

import java.util.List;

public interface OrderService {

	//주문정보
	public List<OrderPageItemVO> getProductInfo(List<OrderPageItemVO> orders);

	//주문
	public void Order(OrderVO orderVO);
	
	

}
