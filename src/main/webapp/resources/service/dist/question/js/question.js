$(document).ready(function(){
    // 모든 답변을 숨김 처리
    $(".answer").hide();
    
    // 질문을 클릭하면 해당 답변이 보이도록 설정
    $(".question").click(function(){
        // 클릭된 질문의 id를 가져옴
        var questionId = $(this).attr("id");
        // 클릭된 질문의 id에 해당하는 답변을 보이거나 숨김 처리
        $("#" + questionId.replace("question", "answer")).toggle();
    });
});
