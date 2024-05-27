$(document).ready(function() {
    // 종합 정보 섹션 정보 삽입
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

    // 체크 여부에 따른 종합 정보 변화
    $(".individual_cart_checkbox").on("change", function() {
        setTotalInfo($(".cart_info_td"));
    });

    //체크 박스 전체 선택
    $(".all_check_input").on("click", function(){

        //체크박스 체크/해제
        if($(".all_check_input").prop("checked")){
            $(".individual_cart_checkbox").attr("checked", true);
        } else{
            $(".individual_cart_checkbox").attr("checked", false);
        }

        //총 주문 정보 세팅(배송비, 총 가격, 물품 수, 종류)
        setTotalInfo($(".cart_info_td"));
    });

    // 총 주문 정보 세팅(배송비, 총 가격, 물품 수, 종류)
    function setTotalInfo() {
        let totalPrice = 0; // 총 가격
        let totalCount = 0; // 총 갯수
        let totalKind = 0; // 총 종류
        let deliveryPrice = 0; // 배송비
        let finalTotalPrice = 0; // 최종 가격(총 가격 + 배송비)

        $(".cart_info_td").each(function(index, element) {
            if ($(element).find(".individual_cart_checkbox").is(":checked")) {
                // 총 가격
                totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
                
                // 총 갯수
                totalCount += parseInt($(element).find(".individual_amount_input").val());
                
                // 총 종류
                totalKind += 1;
            }
        });

        // 배송비 결정
        if (totalPrice >= 30000) {
            deliveryPrice = 0;
        } else if (totalPrice == 0) {
            deliveryPrice = 0;
        } else {
            deliveryPrice = 3000;
        }

        // 최종 가격
        finalTotalPrice = totalPrice + deliveryPrice;

        // 값 삽입
        // 총 가격
        $(".totalPrice_span").text(totalPrice.toLocaleString());

        // 총 갯수
        $(".totalCount_span").text(totalCount);

        // 총 종류
        $(".totalKind_span").text(totalKind);

        // 배송비
        $(".delivery_price").text(deliveryPrice.toLocaleString());

        // 최종 가격
        $(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
    }

    //수량버튼
    $(".plus_btn").on("click", function(){
        let quantity = $(this).parent("div").find("input").val();
        $(this).parent("div").find("input").val(++quantity);
    });
    $(".minus_btn").on("click", function(){
        let quantity = $(this).parent("div").find("input").val();
        if(quantity > 1){
            $(this).parent("div").find("input").val(--quantity);
        }
    })

    //수량 수정 버튼
    $(".quantity_modify_btn").on("click", function(){
        let cart_id = $(this).data("cart_id");
        let amount = $(this).parent("td").find("input").val();
        $(".update_cart_id").val(cart_id);
        $(".update_amount").val(amount);
        $(".quantity_update_form").submit();
    });

    // 장바구니 삭제 버튼
	$(".delete_btn").on("click", function(e){
    e.preventDefault();
    const cart_id = $(this).data("cart_id");
    const filePath = $(this).closest("tr").find(".image_wrap").data("path");
    const fileName = $(this).closest("tr").find(".image_wrap").data("filename");

    // 이미지 파일 삭제 요청
    $.ajax({
        url: '/photoPrint/deleteFile',
        data: {
            filePath: filePath,
            fileName: fileName
        },
        dataType: 'text',
        type: 'POST',
        success: function(result) {
            console.log(result);
            // 이미지 파일이 성공적으로 삭제된 경우, 장바구니 아이템 삭제
            $(".delete_cart_id").val(cart_id);
            $(".quantity_delete_form").submit();
        },
        error: function(result) {
            console.log(result);
            alert("이미지 파일을 삭제하지 못했습니다.");
        }
	    });
	});
	

    //바로구매 버튼
	$(".btn_buy").on("click", function(){
        let amount = $(".quantity_input").val();
        $(".order_form").find("input[name='orders[0].amount']").val(amount);
        $(".order_form").submit();
    })
	
	//주문페이지 이동
	$(".order_btn").on("click", function(){
        let form_contents = '';
        let orderNumber = 0;
        $(".cart_info_td").each(function(index, element){
                
            if($(element).find(".individual_cart_checkbox").is(":checked") === true){    //체크여부

                let product_id = $(element).find(".individual_product_id_input").val();
                let amount = $(element).find(".individual_amount_input").val();

                let product_id_input = "<input name='orders[" + orderNumber + "].product_id' type='hidden' value='" + product_id + "'>";
                form_contents += product_id_input;

                let amount_input = "<input name ='orders[" + orderNumber + "].amount' type='hidden' value='" + amount + "'>";
                form_contents += amount_input;

                orderNumber += 1;
            }
        });

        $(".order_form").html(form_contents);
        $(".order_form").submit();
    })
	
});