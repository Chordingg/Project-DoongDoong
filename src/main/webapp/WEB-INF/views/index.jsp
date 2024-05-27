<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Doong-doong Main Page</title>
<link rel="icon" type="image/x-icon" href="/resources/index/dist/assets/favicon.ico" />

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Google fonts-->
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link href="https://fonts.googleapis.com/css2?family=Tinos:ital,wght@0,400;0,700;1,400;1,700&amp;display=swap" rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400;1,500;1,700&amp;display=swap"
	rel="stylesheet" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/index/dist/css/index.css" rel="stylesheet" />
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
				<h1 class="fst-italic lh-1 mb-4">
					<a href="http://localhost:8181/"
						style="text-decoration: none; color: white;">Doong Doong</a>
				</h1>
				<p class="mb-5">사진 인화 / 드론 배송 시스템</p>

				<form role="form" method="post" action="/login" id="loginForm"
					data-sb-form-api-token="API_TOKEN">
					<!-- Email address input-->
					<div class="panel-heading">
						<h3 class="panel-title">로그인</h3>
						<h5 style="color: red;">${error}</h5>
						<h5 style="color: green;">${logout}</h5>
						<h5 style="color: green;">${success}</h5>
					</div>

					<div class="row input-group-newsletter">
						<div class="col">
							<input class="form-control" id="userid" type="email"
								name="username" placeholder="이메일을 입력해주세요."
								aria-label="Enter email address..."
								data-sb-validations="required,email" value="${userid}"/>
						</div>
						<!-- Remember me checkbox -->
					</div>
					<br>

					<!-- password input-->
					<div class="row input-group-newsletter">
						<div class="col">
							<input class="form-control" id="userpw" type="password"
								placeholder="비밀번호를 입력해주세요." name="password"
								aria-label="Enter password..."
								data-sb-validations="required,password" />
						</div>
					</div>
					<br>

					<div class="row input-group-newsletter justify-content-between">
						<div class="col-auto"
							style="display: flex; justify-content: center; align-items: center;">
							<input class="btn btn-primary" id="loginButton" type="submit"
								value="Log In"
								style="width: 183px; height: 45px; padding: 0; margin: 0 auto;">
						</div>
						<div class="col-auto">
							<a
								href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=b4265e11437d91e39d35c5d26a8eb1fd&redirect_uri=http://localhost:8181/login/oauth&prompt=login">
								<img
								src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
								alt="카카오 로그인 버튼" style="width: 183px; height: 45px;" />
							</a>
						</div>
					</div>

					<div class="invalid-feedback mt-2"
						data-sb-feedback="email:required">An email is required.</div>
					<div class="invalid-feedback mt-2" data-sb-feedback="email:email">Email
						is not valid.</div>
					<!-- Submit success message-->
					<!---->
					<!-- This is what your users will see when the form-->
					<!-- has successfully submitted-->
					<br>

					<div class="d-none" id="submitSuccessMessage">
						<div class="text-center mb-3 mt-2">
							<div class="fw-bolder">존재하지않는 이메일 입니다.</div>
							다시 입력해주세요.<br />
						</div>
					</div>

					<div style="display: flex; gap: 20px;">
						<div>
							<a href="/mainPage" style="text-decoration: none;">홈페이지</a>
						</div>
						<div>
							<a href="/register" style="text-decoration: none;">회원가입</a>
						</div>
						<div class="col-auto d-flex align-items-center">
							<input class="form-check-input" type="checkbox" id="rememberMe"
								name="remember-me"
								style="transform: scale(0.8); width: 1.5rem; height: 1.5rem">
							<label class="form-check-label" for="rememberMe">Remember
								Me</label>
						</div>
					</div>

					<div style="display: flex; gap: 20px;">
						<div>
							<a href="/findUser" style="text-decoration: none;">아이디를
								잊으셨나요?</a>
						</div>
						<div>
							<a href="/findPwd" style="text-decoration: none;">비밀번호를
								잊으셨나요?</a>
						</div>
					</div>


					<!-- Submit error message-->
					<!-- This is what your users will see when there is-->
					<!-- an error submitting the form-->
					<div class="d-none" id="submitErrorMessage">
						<div class="text-center text-danger mb-3 mt-2">이메일 또는 비밀번호를
							확인하세요.</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Social Icons-->
	<!-- For more icon options, visit https://fontawesome.com/icons?d=gallery&p=2&s=brands-->
	<div class="social-icons">
		<div
			class="d-flex flex-row flex-lg-column justify-content-center align-items-center h-100 mt-3 mt-lg-0">
			<a class="btn btn-dark m-3"
				href="https://github.com/Chordingg/Doong_doong_Project"
				target="_blank"> <i class="fab fa-github"></i></a> <a
				class="btn btn-dark m-3" href="https://www.youtube.com/"
				target="_blank"> <i class="fab fa-youtube"></i></a> <a
				class="btn btn-dark m-3" href="https://www.instagram.com/"
				target="_blank"> <i class="fab fa-instagram"></i></a>
		</div>
	</div>
	
	 <!-- The Modal -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">찾은 아이디(이메일)</h4>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          처리되었습니다.
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
    <script type="text/javascript">
	$(document).ready(function(){
		let userid = '${userid}';
		checkModal(userid);
	    function checkModal(userid){
	        if(userid === ''){
	            return;
	        }
	        
	        if(userid.trim() !== ''){
	            $(".modal-body").html("찾은 아이디(이메일)은 " + '${userid}' + "입니다.")
	        }
	        
	        $("#myModal").modal("show");
	    };
	 // Close 버튼을 클릭했을 때 모달을 닫는 이벤트 핸들러 추가
	    $(".modal-footer .btn-danger").click(function() {
	        $("#myModal").modal("hide");
	    });
	});
  </script>

	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/resources/index/dist/js/index.js"></script>
</body>
</html>
