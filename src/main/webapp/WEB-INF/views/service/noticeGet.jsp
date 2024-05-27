<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    .form-control {
        width: 100%;
        max-width: 100%;
        margin-bottom: 10px;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>공지사항</h2>
        <p>이벤트 정보, 신상품 출시 등 둥둥의 여러 가지 소식을 만나보세요.</p>

        <div class="form-group">
            <label>제목</label>
            <input type="text" class="form-control" value="${notice.title}" readonly="readonly">
        </div>
        <div class="form-group">
            <label>작성자</label>
            <input type="text" class="form-control" value="${notice.writer}" readonly="readonly">
        </div>
        <div class="form-group">
            <label>등록일</label>
            <input type="text" class="form-control" value="<fmt:formatDate value='${notice.regdate}' pattern='yyyy-MM-dd' />" readonly="readonly">
        </div>
        <div class="form-group">
            <label>내용</label>
            <textarea class="form-control" rows="5" readonly="readonly">${notice.content}</textarea>
        </div>

        <div class="panel-body">
            <sec:authentication property="principal" var="pinfo" />

            <sec:authorize access="isAuthenticated()">
                <c:if test="${pinfo.username eq notice.writer}">
                    <button id="modifyBtn" data-oper='modify' type="button" class="btn btn-primary">수정하기</button>
                </c:if>
            </sec:authorize>

            <button type="button" data-oper='notice' class="btn btn-info">목록</button>
            <form id="operForm" action="/service/noticeModify" method="get">
                <input type="hidden" id="nno" name="nno" value="${notice.nno}">
            </form>
        </div>
    </div>

<script src="/resources/service/dist/notice/js/noticeGet.js"></script>
</body>
</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
