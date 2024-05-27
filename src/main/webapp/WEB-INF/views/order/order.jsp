
코드 복사
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/order/dist/css/order.css">
<!-- 다음주소 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>
<body>

	<div class="content_area">
		<div class="content_subject">
			<h2><span><strong>장바구니</strong></span></h2>
			<div class="content_main">
				<!-- 회원정보 -->
				<div class="member_info_div">
					<table class="table_text_align_center memberInfo_table">
						<tbody>
							<tr>
								<th style="width: 25%;">주문자</th>
								<td style="width: *"><sec:authentication property="principal.memberVO.userName"/> | <sec:authentication property="principal.username"/></td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<!-- 배송지 정보 -->
				
				<div class="addressInfo_div">
					<div class="addressInfo_button_div">
						<button class="address_btn address_btn_1" onclick="showAdress('1')" style="background-color: #3c3838;">기존 정보 주소록</button>
						<button class="address_btn address_btn_2" onclick="showAdress('2')">직접 입력</button>
					</div>
					<div class="addressInfo_input_div_wrap">
						<div class="addressInfo_input_div addressInfo_input_div_1" style="display: block">
							<table>
								<colgroup>
									<col width="25%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td>
											<sec:authentication property="principal.memberVO.userName"/>
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>
											${memberInfo.memberAddr1} ${memberInfo.memberAddr2}<br>${memberInfo.memberAddr3}
											<input class="selectAddress" value="T" type="hidden">
											<input class="addressee_input" value="${memberInfo.userName}" type="hidden">
											<input class="address1_input" type="hidden" value="${memberInfo.memberAddr1}">
											<input class="address2_input" type="hidden" value="${memberInfo.memberAddr2}">
											<input class="address3_input" type="hidden" value="${memberInfo.memberAddr3}">										
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="addressInfo_input_div addressInfo_input_div_2">
							<table>
								<colgroup>
									<col width="25%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td>
											<input class="addressee_input">
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>
											<input class="selectAddress" value="F" type="hidden">
											<input class="address1_input" readonly="readonly"> 
											<a class="address_search_btn" onclick="execution_daum_address()">주소 찾기</a><br>
											<input class="address2_input" readonly="readonly"><br>
											<input class="address3_input" readonly="readonly">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- 상품 정보 -->
				<div class="orderGoods_div">
					<!-- 상품 종류 -->
					<div class="goods_kind_div">
						주문상품 <span class="goods_kind_div_kind"></span>종 <span class="goods_kind_div_count"></span>개
					</div>
					<!-- 상품 테이블 -->
					<table class="goods_subject_table">
						<colgroup>
							<col width="40%">
							<col width="30%">
							<col width="30%">
						</colgroup>
						<tbody>
							<tr>
								<th>&nbsp;&nbsp;이미지</th>
								<th>상품 정보</th>
								<th>판매가</th>
							</tr>
						</tbody>
					</table>
					<table class="goods_table">
				    <colgroup>
				        <col width="40%">
				        <col width="30%">
				        <col width="30%">
				    </colgroup>
				    <tbody>
				        <c:forEach items="${orderList}" var="ol">
				            <tr>
				                <td>
				                    <div class="image_wrap" data-product_id="${ol.imageList[0].product_id}" data-path="${ol.imageList[0].uploadPath}" data-uuid="${ol.imageList[0].uuid}" data-filename="${ol.imageList[0].fileName}">
				                        <img style="width: 200px;">
				                    </div>
				                </td>
				                <td>${ol.cateName}</td>
				                <td class="goods_table_price_td">
				                    <fmt:formatNumber value="${ol.productPrice}" pattern="#,### 원" /> | 수량 ${ol.amount}개
				                    <br>총 <fmt:formatNumber value="${ol.totalPrice}" pattern="#,### 원" />
				                    <input type="hidden" class="individual_productPrice_input" value="${ol.productPrice}">
				                    <input type="hidden" class="individual_amount_input" value="${ol.amount}">
				                    <input type="hidden" class="individual_totalPrice_input" value="${ol.productPrice * ol.amount}">
				                    <input type="hidden" class="individual_product_id_input" value="${ol.product_id}">
				                    <input type="hidden" class="individual_cateCode_input" value="${ol.cateCode}">
				                </td>
				            </tr>
				        </c:forEach>
				    </tbody>
				</table>
				</div>
								
				<!-- 주문 종합 정보 -->
				<div class="total_info_div">
					<!-- 가격 종합 정보 -->
					<div class="total_info_price_div">
						<ul>
							<li>
								<span class="price_span_label">상품 금액</span>
								<span class="totalPrice_span">100000</span>원
							</li>
							<li>
								<span class="price_span_label">배송비</span>
								<span class="delivery_price_span">100000</span>원
							</li>
							<li class="price_total_li">
								<strong class="price_span_label total_price_label">최종 결제 금액</strong>
								<strong class="strong_red">
									<span class="total_price_red finalTotalPrice_span">1500000</span>원
								</strong>
							</li>
						</ul>
					</div>
					<!-- 버튼 영역 -->
					<div class="total_info_btn_div">
						<a class="order_btn"><button>결제하기</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 주문 요청 form  -->
	<form class="order_form" action="/order" method="post">
		<!-- 주문자 회원번호 -->
		<input name="userid" value="${memberInfo.userid}" type="hidden">
		<!-- 주소록 & 받는 이 -->
		<input name="addressee" type="hidden">
		<input name="memberAddr1" type="hidden">
		<input name="memberAddr2" type="hidden">
		<input name="memberAddr3" type="hidden">
	</form>
	
	<script src="/resources/order/dist/js/order.js"></script>
</body>
</html>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>