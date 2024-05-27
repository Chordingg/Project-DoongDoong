//아이디(이메일) 중복 검사
$('.id_input').on("propertychange change keyup paste input", function(){

	   var userid = $('.id_input').val();
	   var data = {userid : userid}
	   
	   $.ajax({
	      type : "post",
	      url : "/memberIdChk",
	      data : data,
	      success : function(result){
	         if(result != 'fail'){
	            $('.id_input_re_1').css("display","inline-block");
	            $('.id_input_re_2').css("display","none");
	         }else{
	            $('.id_input_re_2').css("display","inline-block");
	            $('.id_input_re_1').css("display","none");
	         }
	      }
	   }) 
	      
	})  

	//인증하기 버튼을 눌렀을 때 동작
	$("#emailAuth").click(function() {
    	const email = $("#email").val(); //사용자가 입력한 이메일 값 얻어오기
    		
    	//Ajax로 전송
        $.ajax({
        	url : './EmailAuth',
        	data : {
        		userid : email
        	},
        	type : 'POST',
        	dataType : 'json',
        	success : function(result) {
        		console.log("result : " + result);
        		$("#authCode").attr("disabled", false);
        		code = result;
        		alert("인증 코드가 입력하신 이메일로 전송 되었습니다.");
       		}
        }); //End Ajax
    });
	
		//인증 코드 비교
		$("#authCode").on("focusout", function() {
			const inputCode = $("#authCode").val(); //인증번호 입력 칸에 작성한 내용 가져오기
			
			console.log("입력코드 : " + inputCode);
			console.log("인증코드 : " + code);
				
			if(Number(inputCode) === code){
		    	$("#emailAuthWarn").html('인증번호가 일치합니다.');
		    	$("#emailAuthWarn").css('color', 'green');
				$('#emailAuth').attr('disabled', true);
				$('#email').attr('readonly', true);
				$("#submitButton").attr('disabled', false);
			}else{
		    	$("#emailAuthWarn").html('인증번호가 불일치 합니다. 다시 확인해주세요!');
		    	$("#emailAuthWarn").css('color', 'red');
		    	$("#submitButton").attr('disabled', true);
			}
		});
        
        
         function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    addr += extraAddr;
                
                } else {
                    addr += ' ';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
				$("[name=memberAddr1]").val(data.zonecode); // 필드 이름 수정
         	    $("[name=memberAddr2]").val(addr); // 필드 이름 수정     
         	    
                // 커서를 상세주소 필드로 이동한다.
         	    $("[name=memberAddr3]").attr("readonly",false);
                $("[name=memberAddr3]").focus();
                
            }
        }).open();
    }
    
   
    

