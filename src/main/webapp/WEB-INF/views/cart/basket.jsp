<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/cart/dist/css/cart.css">

</head>
<body>

	<div class="content_area">
		<div class="content_subject">
			<span>장바구니</span>
		</div>
		<!-- 장바구니 리스트 -->
		<div class="content_middle_section"></div>
		<!-- 장바구니 가격 합계 -->
		<!-- cartInfo -->
		<div class="content_totalCount_section">

			<!-- 체크박스 전체 여부 -->
			<div class="all_check_input_div">
				<input type="checkbox" class="all_check_input input_size_20"
					checked="checked"><span class="all_check_span">전체선택</span>
			</div>


			<table class="subject_table">
				<caption>표 제목 부분</caption>
				<tbody>
					<tr>
						<th class="td_width_1">선택</th>
						<th class="td_width_2">이미지</th>
						<th class="td_width_3">상품명</th>
						<th class="td_width_4">가격</th>
						<th class="td_width_4">수량</th>
						<th class="td_width_4">합계</th>
						<th class="td_width_4">삭제</th>
					</tr>
				</tbody>
			</table>
			<table class="cart_table">
				<caption>표 내용 부분</caption>
				<tbody>
					<c:forEach items="${cartInfo}" var="ci">
						<tr>
							<td class="td_width_1 cart_info_td">
								<input type="checkbox" class="individual_cart_checkbox input_size_20" checked="checked">
								<input type="hidden" class="individual_productPrice_input" value="${ci.productPrice}"> 
								<input type="hidden" class="individual_amount_input" value="${ci.amount}"> 
								<input type="hidden" class="individual_totalPrice_input" value="${ci.productPrice * ci.amount}">
								<input type="hidden" class="individual_product_id_input" value="${ci.product_id}">
							</td>
							
							<td class="td_width_2">
								<div class="image_wrap"
									data-product_id="${ci.imageList[0].product_id}"
									data-path="${ci.imageList[0].uploadPath}"
									data-uuid="${ci.imageList[0].uuid}"
									data-filename="${ci.imageList[0].fileName}">
									<img style="width: 150px">
								</div>
							</td>
							
							<td class="td_width_3">${ci.cateName}</td>
							
							<td class="td_width_4 price_td">가격 : 
								<fmt:formatNumber value="${ci.productPrice}" pattern="#,### 원" />
							</td>
							
							<td class="td_width_4 table_text_align_center" >
								<div class="table_text_align_center quantity_div" style="padding-bottom: 20px; padding-right: 0px ">
									<button class="quantity_btn plus_btn">+</button>
									<input type="text" value="${ci.amount}" class="quantity_input">
									<button class="quantity_btn minus_btn">-</button>
								</div> <a class="quantity_modify_btn" data-cart_Id="${ci.cart_id}">변경</a>
							</td>
							
							<td class="td_width_4 table_text_align_center">
								<fmt:formatNumber value="${ci.productPrice * ci.amount}" pattern="#,### 원" />
							</td>
							<td class="td_width_4 table_text_align_center">
								<button class="delete_btn" data-cart_id="${ci.cart_id}">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<table class="list_table">
			</table>
		</div>
		<!-- 가격 종합 -->
		<div class="content_total_section">
			<div class="total_wrap">
				<table>
					<tr>
						<td>
							<table>
								<tr>
									<td>총 상품 가격</td>
									<td><span class="totalPrice_span"></span> 원</td>
								</tr>
								<tr>
									<td>배송비</td>
									<td><span class="delivery_price"></span> 원</td>
								</tr>
								<tr>
									<td>총 주문 상품수</td>
									<td><span class="totalKind_span"></span> 종<span
										class="totalCount_span"></span>장</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<table>
					<tr>
						<td>
							<table>
								<tbody>
									<tr>
										<td><strong>총 결제 예상 금액</strong></td>
										<td><span class="finalTotalPrice_span"></span> 원</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>

	<!-- 구매 버튼 영역 -->
	<div class="content_btn_section">
		<a class="order_btn">주문하기</a>
	</div>


	<!-- 수량 조정 form -->
	<form action="/cart/update" method="post" class="quantity_update_form">
		<input type="hidden" name="cart_id" class="update_cart_id"> 
		<input type="hidden" name="amount" class="update_amount"> 
		<input type="hidden" name="userid" value='<sec:authentication property="principal.username"/>'>
	</form>

	<!-- 삭제 form -->
	<form action="/cart/delete" method="post" class="quantity_delete_form">
		<input type="hidden" name="cart_id" class="delete_cart_id"> 
		<input type="hidden" name="userid" value='<sec:authentication property="principal.username"/>'>
	</form>

	<!-- 주문 form -->
	<form action = "/order/<sec:authentication property="principal.username"/>" method="get" class="order_form">
		<input type="hidden" name="orders[0].product_id" value="${ci.product_id}">
		<input type="hidden" name="orders[0].amount" value="">
	</form>
	
	<script src="/resources/cart/dist/js/cart.js"></script>
</body>
</html>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>