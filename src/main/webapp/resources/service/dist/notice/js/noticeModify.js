$(document).ready(function() {
    // 수정하기 버튼 클릭 시
    $("#modifyBtn").click(function() {
        $("#operForm").attr("action", "/service/noticeModify");
        $("#operForm").submit();
    });

    // 삭제하기 버튼 클릭 시
    $("#deleteBtn").click(function() {
        if (confirm("정말로 삭제하시겠습니까?")) {
            $("#operForm").attr("action", "/service/noticeRemove");
            $("#operForm").submit();
        }
    });
    
    // 목록 버튼 클릭 시
    $("button[data-oper='notice']").on("click", function(){
        window.location.href = "/service/notice"; // 목록 페이지로 이동
    });
});
