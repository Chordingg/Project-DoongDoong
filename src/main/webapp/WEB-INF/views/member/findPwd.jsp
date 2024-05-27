<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Doong-doong 비밀번호 찾기</title>
    <link rel="icon" type="image/x-icon" href="/resources/index/dist/assets/favicon.ico" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Tinos:ital,wght@0,400;0,700;1,400;1,700&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400;1,500;1,700&amp;display=swap" rel="stylesheet" />
    <link href="/resources/index/dist/css/index.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
    <script src="/resources/member/dist/findPwd/js/findPwd.js" type="text/javascript"></script>
</head>
<body>
    <video class="bg-video" playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop">
        <source src="/resources/index/dist/assets/mp4/bg.mp4" type="video/mp4" />
    </video>
    <div class="masthead">
        <div class="masthead-content text-white">
            <div class="container-fluid px-4 px-lg-0">
                <h1 class="fst-italic lh-1 mb-4"><a href="http://localhost:8181/" style="text-decoration: none; color: white;">Doong - Doong</a></h1>
                <p class="mb-5">비밀번호 찾기</p>
                <form action="/findPwd" method="post" id="findPwd" data-sb-form-api-token="API_TOKEN">
                    <div class="row input-group-newsletter">
                        <div class="col">
                            <input class="id_input" placeholder="이메일을 입력해주세요." name="userid" id="userid" type="email" autofocus>
                        </div>
                        <div class="col-auto">
                            <button type="button" id="sendCodeBtn" class="btn btn-primary" autofocus>전송</button>
                        </div>
                    </div>
                    <br>
                    <div class="row input-group-newsletter">
                        <div class="col">
                            <input class="form-control" placeholder="인증 코드 6자리 입력" maxlength="6" name="findPwd" id="findPwdCode" type="text" autofocus> 
                        </div>
                        <div class="col-auto">
                            <button type="button" id="checkCodeBtn" class="btn btn-primary" autofocus>확인</button>
                        </div>
                    </div>
                    <br>
                </form>
            </div>
        </div>
    </div>
    <div class="social-icons">
        <div class="d-flex flex-row flex-lg-column justify-content-center align-items-center h-100 mt-3 mt-lg-0">
            <a class="btn btn-dark m-3" href="https://github.com/Chordingg/Doong_doong_Project" target="_blank"><i class="fab fa-github"></i></a>
            <a class="btn btn-dark m-3" href="https://www.youtube.com/" target="_blank"><i class="fab fa-youtube"></i></a> 
            <a class="btn btn-dark m-3" href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram"></i></a>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>