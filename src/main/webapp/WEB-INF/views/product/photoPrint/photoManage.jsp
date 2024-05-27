<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/product/photoPrint/dist/css/photoManage.css" rel="stylesheet" />
<title>Insert title here</title>
</head>
<body>

   <div class="container">
      <h1>사진관리</h1>

      <div class="form_section">
         <div class="form_section_title">
            <label>상품 이미지</label>
         </div>
         <div class="form_section_content">
            <div id="uploadResult"></div>
         </div>
      </div>

      <input type="hidden" name="userid" value='<sec:authentication property="principal.username"/>' />

      <div class="button">
         <div class="button_quantity">
            주문수량 <input type="text" class="quantity_input" value="1"> 
            <span>
               <button class="plus_btn">+</button>
               <button class="minus_btn">-</button>
            </span>
         </div>
         <div class="button_set">
            <a class="btn_cart">장바구니 담기</a> 
            <a href="/cart/basket/<sec:authentication property="principal.username"/>">장바구니 바로가기</a>
            <a class="btn_buy">바로구매</a>
         </div>
      </div>
   </div>


   <script>
   $(document).ready(function(){
      let eResult = '<c:out value="${enroll_result}"/>';
   
      checkResult(eResult);
     
     /* 이미지 정보 호출 */
       
      let product_id = '<c:out value="${enroll_result}"/>';
      let uploadResult = $("#uploadResult");         
      
      $.getJSON("/photoPrint/getAttachList", {product_id : product_id}, function(arr){
         
         if(arr.length == 0){
            
            let str = "";
            str += "<div id='result_card'>";
            str += "<img src='/resources/product/photoPrint/dist/images/noImage.png' >";
            str += "</div>";
            
            uploadResult.html(str);
            
            return;
         }
         
         let str = "";
         let obj = arr[0];            
         
         let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
         str += "<div id='result_card'";
         str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
         str += ">";
         str += "<img src='/photoPrint/display?fileName=" + fileCallPath +"' style='width: 200px; height: auto;'>";
         str += "</div>";   
         
         uploadResult.html(str);
      });
      
   
   //수량 버튼 조작
   
      let quantity = $(".quantity_input").val();
   
      $(".plus_btn").on("click",function(){
         $(".quantity_input").val(++quantity);
      });
      
      $(".minus_btn").on("click", function(){
         if(quantity>1){
            $(".quantity_input").val(--quantity);
         }
      });

   
      //서버로 전송할 데이터
      const form = {
            userid : $('input[name=userid]').val(),
            product_id : '${enroll_result}',
            amount : '',
            cateCode : '${cateCode}'
      }
   
      //장바구니 추가 버튼
      $(".btn_cart").on("click", function(e){
         form.amount = $(".quantity_input").val();
         $.ajax({
            url: '/cart/add',
            type: 'POST',
            data: form,
            success: function(result){
               cartAlert(result);
            }
         })
      });
      
      function checkResult(result){
             if(result === ''){
                return;
             }
             alert("사진'" + eResult + "'을 등록하였습니다.");
          }
         
            function cartAlert(result){
               if(result == '0'){
                  alert("장바구니에 추가를 하지 못했습니다.");
               } else if(result == '1'){
                  alert("장바구니에 추가되었습니다.");
               } else if(result == '2'){
                  alert("장바구니에 이미 추가되어져 있습니다.");
               } 
                else if(result == '5'){
                   alert("로그인이 필요합니다.");
                }
        }
   
   });
   
</script>
</body>
</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>