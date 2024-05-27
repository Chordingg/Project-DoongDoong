$(document).ready(function() {

	console.log("JS TEST................")

	var nnoValue = "${notice.nno}";

    console.log("nnoValue................" + nnoValue);

	 let operForm = $("#operForm");

     $("button[data-oper='modify']").on("click", function(e) {
         operForm.submit();
     })

     $("button[data-oper='notice']").on("click", function(e) {
         operForm.find("#nno").remove();
         operForm.attr("action", "/service/notice")
         operForm.submit();
     })
});