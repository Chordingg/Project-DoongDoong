$(document).ready(function() {
	
	$("#insertBtn").on("click",function(){
 		self.location = "/service/noticeInsert";
 	})

	let actionForm = $("#actionForm");

	$(".move").on("click",function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='nno' value='"+ $(this).attr("href")+ "'>")
		actionForm.attr("action","/service/noticeGet");
		actionForm.submit();
	})
});