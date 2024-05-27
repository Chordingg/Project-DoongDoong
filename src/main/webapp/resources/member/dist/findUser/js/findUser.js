$(function(){
    let checkNum;
    
    // 전송 버튼 클릭 이벤트 처리
    $('#send').click(function(e){
        e.preventDefault(); // 기본 동작 막기

        const phone = $('#phone').val();
        
         // 전화번호가 비어 있는지 및 유효성 검사
        if (phone === '' || !isValidPhoneNumber(phone)) {
            alert('정확한 전화번호를 입력해주세요.');
            return; // 전송 중단
        }
        
        $.ajax({
            url: '/check/sendSMS',
            type: 'GET',
            data: {"phone" : phone},
            success: function(data){
                checkNum = data;
                alert("인증번호 발송하였습니다.");
            }
        });
    }); 

    // 확인 버튼 클릭 이벤트 처리
    $('#enterBtn').click(function(){
        const numStr = $('#numStr').val();
        
        if(checkNum === numStr){
            alert('인증 성공하였습니다. ');
              $('#submitButton').show(); // 아이디 찾기 버튼 보이기
        }else{
            alert('인증 실패하였습니다. 다시 입력해주세요.');
        }
    });
    
    // 전화번호 형식의 유효성 검사
    function isValidPhoneNumber(phone) {
        var phoneRegex = /^\d{3}-\d{3,4}-\d{4}$/; // '010-1234-5678'와 같은 형식의 전화번호 정규식
        return phoneRegex.test(phone);
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
    
    $('#submitButton').hide();
});