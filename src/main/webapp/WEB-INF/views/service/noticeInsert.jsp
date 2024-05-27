<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<!-- /.panel-heading -->
		<div class="panel-body">
			<form role="form" action="/service/noticeInsert" method="post">
				<div class="form-group">
					<label>제목</label> <input class="form-control" name="title">
				</div>

				<div class="form-group">
					<label>내용</label>
					<textarea rows="3" class="form-control" name="content"></textarea>
				</div>

				<div class="form-group">
					<label>작성자</label><input class="form-control" name="writer" readonly="readonly"
						value="doongdoong8282@naver.com">
				</div>
				<br>
				<button type="submit" >Submit Button</button>
				<button type="reset" >Reset Button</button>
				<button type="button" onclick="history.back()">목록</button>
			</form>
		</div>
	</div>
</body>
<script src="/resources/service/dist/notice/js/notice.js"></script>
</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>