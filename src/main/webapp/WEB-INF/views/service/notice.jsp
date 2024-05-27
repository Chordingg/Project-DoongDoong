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
        <div class="inline-elements">
			이벤트 정보, 신상품 출시 등 둥둥의 여러 가지 소식을 만나보세요.
			 <sec:authorize access="hasRole('ROLE_ADMIN')">
                <button id="insertBtn" type="button">추가하기</button>
            </sec:authorize>
		</div>
        <br>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>NO</th>
                    <th>제목</th>
                    <th>날짜</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="notice" items="${notice}">
                    <tr class="odd gradeX">
                        <td>${notice.nno}</td>
                        <td>
                            <a class="move" href="${notice.nno}" style="text-decoration: none">${notice.title}</a>
                        </td>
                        <td><fmt:formatDate value="${notice.regdate}" pattern="yyyy-MM-dd"/> </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
<link rel="/resources/service/dist/notice/css/notice.css">
<script src="/resources/service/dist/notice/js/notice.js"></script>
</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>