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
		<h2>공지사항</h2>
		<p>이벤트 정보, 신상품 출시 등 둥둥의 여러 가지 소식을 만나보세요.</p>

	</div>

	<div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>${notice.title}</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${notice.writer}</td>
					<td><fmt:formatDate value="${notice.regdate}"
							pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr class="odd gradeX">
					<td colspan="2">${notice.content}</td>
				</tr>
			</tbody>

			<tbody>
			<tr>
				<td>
					<button id="modifyBtn" type="button">수정하기</button>
					<button id="deleteBtn" type="button">삭제하기</button>
					<button type="button" onclick="history.back()">목록</button>
				</td>
			</tr>
			</tbody>
		</table>
	</div>
	

</body>
<script src="/resources/service/dist/notice/js/noticeGet.js"></script>
</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>