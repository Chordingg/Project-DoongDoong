document.getElementById("updateForm").addEventListener("submit", function(event) {
        var newPassword = document.getElementById("userpw").value;
        var confirmPassword = document.getElementById("userpwConfirm").value;

        if (newPassword.length < 4) {
            alert("새 비밀번호는 4자리 이상이어야 합니다.");
            event.preventDefault();
            return false;
        }

        if (newPassword !== confirmPassword) {
            alert("새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다.");
            event.preventDefault();
            return false;
        }

        return true;
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

    $(function(){
        $('#deleteBtn').click(function(e){
            e.preventDefault(); // 기본 동작 막기
    
            if(confirm("정말로 탈퇴하시겠습니까?")) {
                $.ajax({
                    url: '/myinfo/delete',
                    type: 'POST',
                    success: function(response){
                        alert('회원 탈퇴가 완료되었습니다.');
                        window.location.href = '/';
                    },
                    error: function() {
                        alert('회원 탈퇴에 실패했습니다.');
                    }
                });
            }
        });
    });
    
    