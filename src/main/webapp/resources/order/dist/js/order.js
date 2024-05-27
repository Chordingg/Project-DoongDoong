
$(document).ready(function(){
    //주문 조합정보란 최신화
    setTotalInfo();
    
     //이미지 삽입
    $(".image_wrap").each(function(i, obj){
        const bobj = $(obj);

        if(bobj.data("product_id")){
            const uploadPath = bobj.data("path");
            const uuid = bobj.data("uuid");
            const fileName = bobj.data("filename");

            const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);

            $(this).find("img").attr('src', '/photoPrint/display?fileName=' + fileCallPath);

        }else{
            $(this).find("img").attr('src', '/resources/product/photoPrint/dist/images/noImage.png');
        }
    });
    
});


/* 주소입력란 버튼 동작(숨김, 등장) */
function showAdress(className){
	/* 컨텐츠 동작 */
		/* 모두 숨기기 */
		$(".addressInfo_input_div").css('display', 'none');
		/* 컨텐츠 보이기 */
		$(".addressInfo_input_div_" + className).css('display', 'block');		
	
	/* 버튼 색상 변경 */
		/* 모든 색상 동일 */
			$(".address_btn").css('backgroundColor', '#555');
		/* 지정 색상 변경 */
			$(".address_btn_"+className).css('backgroundColor', '#3c3838');	
	/* selectAddress T/F */
		/* 모든 selectAddress F만들기 */
			$(".addressInfo_input_div").each(function(i, obj){
				$(obj).find(".selectAddress").val("F");
			});
		/* 선택한 selectAdress T만들기 */
			$(".addressInfo_input_div_" + className).find(".selectAddress").val("T");


}

/* 다음 주소 연동 */
function execution_daum_address(){
 		console.log("동작");
	   new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
 
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                 	// 추가해야할 코드
                    // 주소변수 문자열과 참고항목 문자열 합치기
                      addr += extraAddr;
                
                } else {
                	addr += ' ';
                }
 
             	// 제거해야할 코드
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $(".address1_input").val(data.zonecode);
                $(".address2_input").val(addr);				
                // 커서를 상세주소 필드로 이동한다.
                $(".address3_input").attr("readonly", false);
                $(".address3_input").focus();	 
	            
	            
	        }
	    }).open();  	
	
}

  //총 주문 정보 세팅(배송비, 총 가격, 물품 수, 종류)
            function setTotalInfo(){

                let totalPrice = 0;
                let totalCount = 0;
                let totalKind = 0;
                let deliveryPrice = 0;
                let finalTotalPrice = 0;

                $(".goods_table_price_td").each(function(index, element){

                    //총가격
                    totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
                    //총 갯수
                    totalCount += parseInt($(element).find(".individual_amount_input").val());
                    //총 종류
                    totalKind += 1;
                });
     //배송비 결정
                if(totalPrice >= 30000){
                    deliveryPrice = 0;
                }else if(totalPrice == 0){
                    deliveryPrice = 0;
                }else{
                    deliveryPrice = 3000;
                }

                finalTotalPrice = totalPrice + deliveryPrice;
                
                     //값 삽입
                //총 가격
                $(".totalPrice_span").text(totalPrice.toLocaleString());
                //총 갯수
                $(".goods_kind_div_count").text(totalCount);
                //총 종류
                $(".goods_kind_div_kind").text(totalKind);
                //배송비
                $(".delivery_price_span").text(deliveryPrice.toLocaleString());
                //최종가격(총 가격 + 배송비)
                $(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
                
}


   //주문 요청
            $(".order_btn").on("click", function(){
                //주소 정보 & 받는 이
                $(".addressInfo_input_div").each(function(i, obj){
                    if($(obj).find(".selectAddress").val() === 'T'){
                        $("input[name='addressee']").val($(obj).find(".addressee_input").val());
                        $("input[name='memberAddr1']").val($(obj).find(".address1_input").val());
                        $("input[name='memberAddr2']").val($(obj).find(".address2_input").val());
                        $("input[name='memberAddr3']").val($(obj).find(".address3_input").val());
                    }
                });

            let form_contents = '';
				$(".goods_table_price_td").each(function(index, element){
				    let product_id = $(element).find(".individual_product_id_input").val();
				    let amount = $(element).find(".individual_amount_input").val();
				    let productPrice = $(element).find(".individual_productPrice_input").val();
				    let totalPrice = $(element).find(".individual_totalPrice_input").val();
					let cateCode = $(element).find(".individual_cateCode_input").val();
					
				    // Hidden input 요소 생성
				    form_contents += "<input name='orders[" + index + "].product_id' type='hidden' value='" + product_id + "'>";
				    form_contents += "<input name='orders[" + index + "].amount' type='hidden' value='" + amount + "'>";
				    form_contents += "<input name='orders[" + index + "].productPrice' type='hidden' value='" + productPrice + "'>";
				    form_contents += "<input name='orders[" + index + "].totalPrice' type='hidden' value='" + totalPrice + "'>";
					form_contents += "<input name='orders[" + index + "].cateCode' type='hidden' value='" + cateCode + "'>";
				});
				
				  // 배송비, 주문 가격, 최종 결제 가격 추가
				    form_contents += "<input name='deliveryCost' type='hidden' value='" + parseInt($(".delivery_price_span").text().replace(/,/g, "")) + "'>";
				    form_contents += "<input name='orderPrice' type='hidden' value='" + parseInt($(".totalPrice_span").text().replace(/,/g, "")) + "'>";
				    form_contents += "<input name='orderFinalPrice' type='hidden' value='" + parseInt($(".finalTotalPrice_span").text().replace(/,/g, "")) + "'>";
				// 생성한 input 요소들을 order_form에 추가
				$(".order_form").append(form_contents);
				
				// 서버로 폼 전송
				$(".order_form").submit();
				
            
            });

