<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>Doong-doong 비밀번호 변경</title>
<link rel="icon" type="image/x-icon" href="/resources/index/dist/assets/favicon.ico" />

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
   
<!-- Google fonts-->
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link href="https://fonts.googleapis.com/css2?family=Tinos:ital,wght@0,400;0,700;1,400;1,700&amp;display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400;1,500;1,700&amp;display=swap" rel="stylesheet" />
   
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/index/dist/css/index.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>

</head>
<body>

   <!-- Background Video-->
   <video class="bg-video" playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop">
      <source src="/resources/index/dist/assets/mp4/bg.mp4" type="video/mp4" />
   </video>
   
   <!-- Masthead-->
   <div class="masthead">
      <div class="masthead-content text-white">
         <div class="container-fluid px-4 px-lg-0">
            <h1 class="fst-italic lh-1 mb-4"><a href="http://localhost:8181/" style="text-decoration: none; color: white;">Doong - Doong</a></h1>
            
            <p class="mb-5">비밀번호 변경</p>
				<form action="/updatePwd" method="post" id="updatePwd" data-sb-form-api-token="API_TOKEN">
					<input type="hidden" name="userid" value="${userid}" />
					<!-- Email address input-->
					<div class="row input-group-newsletter">
						<div class="col">
							<span style="width:70px">새 비밀번호</span>
							<input class="id_input" placeholder="비밀번호를 입력해주세요." name="userpw" id="userpw" type="password" autofocus>
						</div>
						
					</div>
					<br>

					<div class="row input-group-newsletter">
						<div class="col">
							<span style="width:70px">새 비밀번호 확인</span>
							<input class="id_input" placeholder="비밀번호를 한번 더 입력해주세요." name="userpwCheck" id="userpwCheck" type="password" autofocus>
						</div>
					</div>
					<br>
						<div class="col-auto">
							<button type="button" value="확인" onclick="pwDoubleCheck()" class="btn btn-primary" autofocus>
							비밀번호변경
							</button>
						</div>
					<br>

				</form>
			</div>
      </div>
   </div>
   <!-- Social Icons-->
   <!-- For more icon options, visit https://fontawesome.com/icons?d=gallery&p=2&s=brands-->
   <div class="social-icons">
      <div class="d-flex flex-row flex-lg-column justify-content-center align-items-center h-100 mt-3 mt-lg-0">
         <a class="btn btn-dark m-3" href="https://github.com/Chordingg/Doong_doong_Project" target="_blank">
         <i class="fab fa-github"></i></a>
         <a class="btn btn-dark m-3" href="https://www.youtube.com/" target="_blank">
         <i class="fab fa-youtube"></i></a> 
         <a class="btn btn-dark m-3" href="https://www.instagram.com/" target="_blank">
         <i class="fab fa-instagram"></i></a>
      </div>
   </div>
   
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<!-- <script src="/resources/first/bootstrap/js/register.js"></script>
 --><!-- 주소 찾기 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- JavaScript 코드 -->
<script type="text/javascript">

function pwDoubleCheck(){
	var userpw = $('#userpw').val();
	var doublepw = $('#userpwCheck').val();
	
	if(userpw == doublepw){
		alert("비밀번호가 일치합니다.");
		$('#updatePwd').submit();
	}else{
		alert("비밀번호가 일치하지 않습니다.");
		return;
	}
}

</script>

</body>
</html>

