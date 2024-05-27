$(document).ready(function() {
    // 이메일로 보낸 인증코드와 대조를 위한 변수
    var code = "";

    // 비밀번호 찾기를 했을 때 아이디(이메일) 입력 시
    function findUser() {
        var userid = $('#userid').val();

        // input에 userid의 값이 있을 경우
        if (userid != "") {
            $.ajax({
                type: 'GET',
                url: '/findPwdCheck', // 이 URL이 올바른지 확인
                data: { userid: userid },
                dataType: 'text',

                // 데이터를 성공적으로 받고 예외처리
                success: function(data) {
                    console.log("Response data: ", data); // 응답 데이터 확인

                    if (data === "noUser") {
                        alert("가입된 이메일이 없습니다. 회원가입 페이지로 이동하겠습니다.");
                        location.href = '/register';
                    } else if (data === "kakaoUser") {
                        alert("카카오회원은 비밀번호 찾기를 이용할 수 없습니다. 카카오회원으로 로그인해주세요.");
                        location.href = '/';
                    } else {
                        $('#findPwd').stop().show();
                        console.log("Received code: ", data);
                        code = data;
                        alert("인증번호가 전송되었습니다.");
                    }
                },

                error: function(xhr, status, error) {
                    console.log("AJAX error: ", status, error);
                }
            });
        } else {
            alert("이메일을 입력해주세요.");
        }
    }

    // 이메일 인증 번호 체크 -> 맞으면 true / 틀리면 false
    function findPwdCheck() {
        var inputCode = $('#findPwdCode').val();

        if (inputCode != "") {
            if (inputCode === code) {
                alert("인증번호가 일치합니다. 비밀번호 변경 페이지로 이동합니다.");
                $("#findPwd").submit();
            } else {
                alert("인증번호가 불일치합니다. 다시 확인해주세요.");
            }
        } else {
            alert("인증번호를 입력해주세요.");
        }
    }

    // 이벤트 리스너 추가
    $('#sendCodeBtn').on('click', findUser);
    $('#checkCodeBtn').on('click', findPwdCheck);
});