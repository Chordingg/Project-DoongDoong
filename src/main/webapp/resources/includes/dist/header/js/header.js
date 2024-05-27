$(document).ready(function(){

let actionForm = $("#actionForm");

$(".move").on("click",function(e){	
		e.preventDefault();
		actionForm.append("<input type='hidden' name='userid' value='"+ $(this).attr("href") + "'>")
		actionForm.attr("action", "/myinfo/password-check");
		actionForm.submit();
	})
	
});