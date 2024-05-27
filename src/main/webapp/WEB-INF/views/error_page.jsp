<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="jumbotron">
    <h1><c:out value="${exception.getMessage()}"></c:out></h1>
    <p class="lead">You do not have access. Please check your access and try again.</p>
    <a class="btn btn-lg btn-primary" href="/mainPage" role="button">홈페이지로 돌아가기 &raquo;</a>
  </div>
</body>
</html>