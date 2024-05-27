//아이디(이메일) 중복 검사
$('.id_input').on("propertychange change keyup paste input", function(){

	   var userid = $('.id_input').val();
	   var data = {userid : userid}
	   
	    // 이메일 형식의 유효성 검사
	    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	    if (!emailRegex.test(userid)) {
	        $('.id_input_re_3').css("display","inline-block");
	        $('.id_input_re_1').css("display","none");
	        $('#emailAuth').prop('disabled', true); // 인증하기 버튼 비활성화
	        return; // 유효성 검사 실패 시 중복 검사 AJAX 호출하지 않음
	    }
	   
	   $.ajax({
	      type : "post",
	      url : "/memberIdChk",
	      data : data,
	      success : function(result){
	         if(result != 'fail'){
	            $('.id_input_re_1').css("display","inline-block");
	            $('.id_input_re_2').css("display","none");
	            $('.id_input_re_3').css("display","none");
	            // 중복 검사 결과가 성공이면 인증하기 버튼 활성화
                $('#emailAuth').prop('disabled', false);
                emailResult = true;
	         }else{
	            $('.id_input_re_2').css("display","inline-block");
	            $('.id_input_re_1').css("display","none");
	            $('.id_input_re_3').css("display","none");
	            // 중복 검사 결과가 실패이면 인증하기 버튼 비활성화
                $('#emailAuth').prop('disabled', true);
                emailResult = false;
	         }
	      }
	   }) 
	      
	})  
	
	// 이메일 입력란에 다시 입력을 시작하면 경고 메시지를 숨김
	$('.id_input').on("focus", function(){
	    $('.id_input_re_2').css("display","none");
	    $('.id_input_re_3').css("display","none");
	});
	
	// 인증 버튼을 비활성화
	document.getElementById("emailAuth").disabled = true;

	//인증하기 버튼을 눌렀을 때 동작
	$("#emailAuth").click(function() {
    	const userid = $("#userid").val(); //사용자가 입력한 이메일 값 얻어오기
    		
    	//Ajax로 전송
        $.ajax({
        	url : './EmailAuth',
        	data : {
        		userid : userid
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
				authcodeResult = true;
				
			}else{
		    	$("#emailAuthWarn").html('인증번호가 불일치 합니다. 다시 확인해주세요!');
		    	$("#emailAuthWarn").css('color', 'red');
		    	$("#submitButton").attr('disabled', true);
		    	authcodeResult = false;
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
    
    // 모든 입력 필드의 값이 변경될 때마다 유효성 검사 실행
	$('.id_input, #authCode, #username, #phone, #memberAddr1, #memberAddr2, #memberAddr3, #userpw').on('focusout', validateForm);
    
    // 인증 버튼을 비활성화
	document.getElementById("submitButton").disabled = true;
    
    // 모든 입력 필드가 유효한지 확인하는 함수
	function validateForm() {
    var userid = $('#userid').val().trim();
    var authCode = $('#authCode').val().trim();
    var username = $('#username').val().trim();
    var phone = $('#phone').val().trim();
    var memberAddr1 = $('#memberAddr1').val().trim();
    var memberAddr2 = $('#memberAddr2').val().trim();
    var memberAddr3 = $('#memberAddr3').val().trim();
    var userpw = $('#userpw').val().trim();
    
    // 유저네임의 길이 체크
    if (username == '' || username.length < 3 ) {
        $("#usernameWarn").html('이름은 3자 이상이여야 합니다.');
		$("#usernameWarn").css('color', 'red');
		$("#submitButton").attr('disabled', true);
		usernameResult = false;
	}else if(username.length > 20) {
        $("#usernameWarn").html('이름은 20자 미만이여야 합니다.');
		$("#usernameWarn").css('color', 'red');
		$("#submitButton").attr('disabled', true);
		usernameResult = false;
	}else{
        $("#usernameWarn").html('사용 가능한 이름 입니다.');
		$("#usernameWarn").css('color', 'green');
		usernameResult = true;
	        
    }
    

    // 전화번호 형식의 유효성 검사
	var phoneRegex = /^\d{10,11}$/; // '-'를 제외하고 10자리 또는 11자리 숫자만을 허용하는 정규식
	var phoneInput = $("#phone").val().replace(/-/g, ''); // 입력된 전화번호에서 '-'를 제거
	
	if (phoneInput == '' || !phoneRegex.test(phoneInput)) {
	    $("#phoneWarn").html('정확한 번호를 입력해야 합니다.');
	    $("#phoneWarn").css('color', 'red');
	    $("#submitButton").prop('disabled', true); // 버튼 비활성화
	    phoneResult = false;
	} else {
	    $("#phoneWarn").html('사용 가능한 번호입니다.');
	    $("#phoneWarn").css('color', 'green');
	    $("#submitButton").prop('disabled', false); // 버튼 활성화
	    phoneResult = true;
	}
	
	// 전화번호 입력창 자동 형식 적용
	$('#phone').on('input', function() {
	    var phone = $(this).val().replace(/[^0-9]/g, ''); // 숫자 이외의 문자는 제거
	    var len = phone.length;
	    var formattedPhone = '';
	
	    // '-'를 포함하여 입력된 전화번호의 길이에 따라서만 자동으로 형식이 적용됨
	    if (len < 4) {
	        formattedPhone = phone;
	    } else if (len < 8) {
	        formattedPhone = phone.substring(0, 3) + '-' + phone.substring(3);
	    } else if (len < 12) {
	        formattedPhone = phone.substring(0, 3) + '-' + phone.substring(3, 7) + '-' + phone.substring(7);
	    } else {
	        formattedPhone = phone.substring(0, 3) + '-' + phone.substring(3, 7) + '-' + phone.substring(7, 11);
	    }
	
	    $(this).val(formattedPhone);
	});


	

    

    // 패스워드의 길이 체크
    if (userpw == '' || userpw.length < 4 ) {
        $("#userpwWarn").html('비밀번호는 4자 이상이여야 합니다.');
		$("#userpwWarn").css('color', 'red');
		$("#submitButton").attr('disabled', true);
		userpwResult = false;
    }else if(userpw.length > 30) {
        $("#userpwWarn").html('비밀번호는 30자 미만이여야 합니다.');
		$("#userpwWarn").css('color', 'red');
		$("#submitButton").attr('disabled', true);
		userpwResult = false;
    }else{
    	$("#userpwWarn").html('사용 가능한 비밀번호 입니다.');
		$("#userpwWarn").css('color', 'green');
  		userpwResult = true;
    }
    
    
	// 모든 필드가 채워져 있고, 각 항목에 조건이 맞아야 버튼을 활성화
	if (
	    userid !== '' && emailResult == true &&
	    authCode !== '' && authcodeResult == true &&
	    username !== '' && usernameResult == true &&
	    phone !== '' && phoneResult == true && 
	    memberAddr1 !== '' && 
	    memberAddr2 !== '' && 
	    memberAddr3 !== '' && 
	    userpw !== '' && userpwResult == true 
	) {
	    $('#submitButton').prop('disabled', false);
	} else {
	    $('#submitButton').prop('disabled', true);
	}
}
