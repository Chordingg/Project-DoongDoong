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
		<h2>사진인화 상품후기</h2>
		<div class="inline-elements">
			<%-- <sec:authorize access="hasRole('ROLE_ADMIN')"> --%>
			<button id="insertBtn" type="button">수정하기</button>
			<%-- </sec:authorize> --%>
		</div>
		<br>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>리뷰</th>
					<th>제목</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="review" items="${review}">
					<tr class="odd gradeX">
						<td>${review.photo}</td>
						<td><a class="move" href="${review.rno}"
							style="text-decoration: none">${review.title}</a></td>
						<td><fmt:formatDate value="${review.regdate}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>