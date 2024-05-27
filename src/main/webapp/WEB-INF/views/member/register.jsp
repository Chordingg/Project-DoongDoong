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

<!-- Google fonts-->
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link href="https://fonts.googleapis.com/css2?family=Tinos:ital,wght@0,400;0,700;1,400;1,700&amp;display=swap" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400;1,500;1,700&amp;display=swap" rel="stylesheet" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/member/dist/register/css/styles.css" rel="stylesheet" />
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
				<h1 class="fst-italic lh-1 mb-4">
					<a href="http://localhost:8181/" style="text-decoration: none; color: white;">Doong - Doong</a>
				</h1>

				<p class="mb-5">회원가입</p>
				<form action="register" method="post" id="contactForm" data-sb-form-api-token="API_TOKEN">

					<!-- Email address input-->
					<div class="row input-group-newsletter">
						<div class="col">
							<input class="id_input" placeholder="이메일을 입력해주세요." name="userid" id="userid" type="email" autofocus>
						</div>
						<span class="id_input_re_1">사용 가능한 이메일입니다.</span> 
						<span class="id_input_re_2">이메일이 이미 존재합니다.</span> 
						<span class="id_input_re_3">이메일 형식이 아닙니다.</span>
					</div>
					<br>

					<div class="row input-group-newsletter">
						<div class="col">
							<input class="form-control" placeholder="인증 코드 6자리" maxlength="6" disabled="disabled" name="authCode" id="authCode" type="text" autofocus> 
							<span id="emailAuthWarn"></span>
						</div>
						<div class="col-auto">
							<input type="button" value="인증하기" class="btn btn-primary" id="emailAuth" autofocus>
						</div>
					</div>
					<br>
					<div class="row input-group-newsletter">
						<div class="col">
							<input class="form-control" id="username" name="userName" type="text" placeholder="이름을 입력해주세요." data-sb-validations="required,userName" /> 
							<span id="usernameWarn"></span>
						</div>
					</div>
					<br>

					<div class="row input-group-newsletter">
						<div class="col">
							<input class="form-control" id="phone" type="text" name="phone" placeholder="휴대폰번호를 입력해주세요." data-sb-validations="required,phone" /> 
							<span id="phoneWarn"></span>
						</div>
					</div>
					<br>

					<div class="row input-group-newsletter">
						<div class="col">
							<input class="form-control" type="text" id="memberAddr1" name="memberAddr1" placeholder="우편번호">
						</div>
						<div class="col-auto">
							<input class="form-control" type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
						</div>
					</div>

					<div class="row input-group-newsletter">
						<div class="col">
							<input class="form-control" type="text" id="memberAddr2" name="memberAddr2" placeholder="주소"><br> 
							<input class="form-control" type="text" id="memberAddr3" name="memberAddr3" placeholder="상세주소">
						</div>
					</div>
					<br>

					<!-- password input-->
					<div class="row input-group-newsletter">
						<div class="col">
							<input class="form-control" name="userpw" id="userpw" type="password" placeholder="비밀번호를 입력해주세요." data-sb-validations="required,userpw" required/> 
							<span id="userpwWarn"></span>
						</div>

						<div class="col-auto">
							<button class="btn btn-primary" id="submitButton" type="submit">회원가입</button>
						</div>

					</div>

					<br>
					<div style="display: flex; gap: 20px;">
						<div>
							<a href="/mainPage" style="text-decoration: none">홈페이지</a>
						</div>
						<div>
							<a href="/" style="text-decoration: none">로그인화면</a>
						</div>
					</div>



				</form>
			</div>
		</div>
	</div>
	<!-- Social Icons-->
	<!-- For more icon options, visit https://fontawesome.com/icons?d=gallery&p=2&s=brands-->
	<div class="social-icons">
		<div class="d-flex flex-row flex-lg-column justify-content-center align-items-center h-100 mt-3 mt-lg-0">
			<a class="btn btn-dark m-3" href="https://github.com/Chordingg/Doong_doong_Project" target="_blank"> 
				<i class="fab fa-github"></i>
			</a> 
			<a class="btn btn-dark m-3" href="https://www.youtube.com/" target="_blank"> 
				<i class="fab fa-youtube"></i>
			</a> 
			<a class="btn btn-dark m-3" href="https://www.instagram.com/" target="_blank"> 
				<i class="fab fa-instagram"></i>
			</a>
		</div>
	</div>

	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- JavaScript 코드 -->
	<script src="/resources/member/dist/register/js/register.js"></script>
	<!-- 주소 찾기 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>

