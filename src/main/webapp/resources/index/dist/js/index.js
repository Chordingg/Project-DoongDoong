$(document).ready(function() {

    // 폼이 제출될 때
    $('#contactForm').submit(function(event) {
        // 폼이 제출되는 것을 막음
        event.preventDefault();

        // 입력된 이메일과 비밀번호
        var userid = $('#userid').val().trim();
        var userpw = $('#userpw').val().trim();

        // 서버로 전송할 데이터
        var formData = {
            userid: userid,
            userpw: userpw
        };

        // 서버로 로그인 요청을 보냄
        $.ajax({
            type: 'POST',
            url: '/login', // 로그인 처리를 담당하는 서버의 URL
            data: formData,
            success: function(response) {
                // 로그인이 성공한 경우
                if (response === 'success') {
                    window.location.href = '/mainPage'; // 로그인 후 이동할 페이지의 URL
                } else {
                    // 로그인이 실패한 경우, 에러 메시지 표시
                    $('#submitErrorMessage').removeClass('d-none');
                }
            },
            error: function(xhr, status, error) {
                console.error(xhr.responseText); // 오류 메시지 출력
            }
        });
    });
    
    // 로그인 버튼을 비활성화
	document.getElementById("loginButton").disabled = true;
	
    // 입력 필드의 값이 변경될 때마다 로그인 버튼 활성화 또는 비활성화
    $('#userid, #userpw').on('keyup', function() {
        var userid = $('#userid').val().trim();
        var userpw = $('#userpw').val().trim();

        // 이메일과 비밀번호가 모두 입력되었는지 확인
        if (userid !== '' && userpw !== '' && userpw.length >= 4) {
            $('#loginButton').prop('disabled', false); // 로그인 버튼 활성화
        } else {
            $('#loginButton').prop('disabled', true); // 로그인 버튼 비활성화
        }
    });
});
