<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Doong Doong</title>
<meta charset="utf-8" />
<meta name="viewport" ontent="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/includes/dist/header/css/header.css" />
<!-- 아이콘 가져오는 링크 --> 
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>

<body class="homepage is-preload">
   <div id="page-wrapper">
      <!-- Header -->
      <section id="header">
         <div class="container">

            <!-- Logo -->
            <h1 id="logo">
               <a href="http://localhost:8181/mainPage">Doong Doong</a>
            </h1>
            <p>
               <strong>국내 최대 사진 인화 사이트</strong>
            </p>

            <!-- Nav -->
            <nav id="nav">
               <ul>
                  <li><a class="icon solid fa fa-camera-retro" href="/introduction"><span>Introduction</span></a>
                     <ul>
                        <li><a href="/introduction">소개</a></li>
                        <li><a href="/doongdoong-map">찾아오시는 길</a></li>
                     </ul>
                  </li>

                  <li><a class="icon solid fa-user" href="/myinfo/password-check"><span>User</span></a>
                     <ul>
                        <c:set var="authentication" value="${SecurityContextHolder.getContext().getAuthentication()}" />
                        
                        <sec:authorize access="hasRole('ROLE_MEMBER')">
                        
                           <li>
                              <a href="/myinfo/password-check" class="move">
                           <sec:authentication property="principal.memberVO.userName"/> 님</a>
                           </li>
                           <li>
                           <span>충전금액 : <sec:authentication property="principal.memberVO.money"/>원</span>
                           </li>
                           <li>
                              <a href="/cart/basket/<sec:authentication property="principal.username"/>">장바구니</a>
                           </li>
                           
                           <li id="logoutButton">
                              <a href="/customLogout">로그아웃</a
                           ></li>
                           
                        </sec:authorize>
                        
                        <c:if test="${empty pageContext.request.userPrincipal}">
                           <li id="loginButton"><a href="/">로그인</a></li>
                        </c:if>
                     </ul>
                  </li>
                  
                  <li><a class="icon solid fa fa-truck" href="/delevery"><span>Delivery</span></a>
                  	<ul>
                  		<li><a href="/delevery">배송 확인</a></li>
                  	</ul>
                  </li>

                  <!-- 고객 센터 -->
                  <li><a class="icon solid fa fa-question" href="/service/notice"><span>Customer Service</span></a>
                     <ul>
                        <li><a href="/service/notice">공지사항</a></li>
                        <li><a href="/service/question">자주 묻는 질문</a></li>
                        <li><a href="/service/event">이벤트</a></li>
                        <li><a href="/service/center">고객센터</a></li>
                     </ul>
                  </li>
               </ul>
               <form id="actionForm" action="/mainPage" method="get">
                  <!-- Form fields go here -->
               </form>
            </nav>

         </div>
      </section>
   </div>

<script src="/resources/mainpage/dist/js/jquery.min.js"></script>
<script src="/resources/mainpage/dist/js/jquery.dropotron.min.js"></script>
<script src="/resources/mainpage/dist/js/browser.min.js"></script>
<script src="/resources/mainpage/dist/js/breakpoints.min.js"></script>
<script src="/resources/mainpage/dist/js/util.js"></script>
<script src="/resources/mainpage/dist/js/main.js"></script>
<script src="/resources/includes/dist/header/js/header.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>   