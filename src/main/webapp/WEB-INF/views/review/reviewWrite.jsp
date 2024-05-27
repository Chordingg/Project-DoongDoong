<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/review/dist/css/review.css" />
<script src="/resources/review/dist/js/review.js"></script>
</head>
<body>
	<h2>리뷰작성 폼</h2>
	<div class="star_rating">
		<span class="star on" value="1"> </span> 
		<span class="star" value="2"></span> 
		<span class="star" value="3"> </span> 
		<span class="star" value="4"></span> 
		<span class="star" value="5"> </span>
	</div>
	<textarea class="star_box" placeholder="리뷰 내용을 작성해주세요."></textarea>
	<input type="submit" class="btn02" value="리뷰 등록" />
</body>
</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>