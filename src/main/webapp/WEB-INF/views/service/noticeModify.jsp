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

        <form id="operForm" role="form" action="/service/noticeModify" method="post">
            <div class="form-group">
                <label>NO</label>
                <input type="text" class="form-control" name="nno" value="${notice.nno}" readonly="readonly">
            </div>
            <div class="form-group">
                <label>Title</label>
                <input type="text" class="form-control" name="title" value="${notice.title}">
            </div>
            <div class="form-group">
                <label>Content</label>
                <textarea rows="5" class="form-control" name="content">${notice.content}</textarea>
            </div>
            <div class="form-group">
                <label>Writer</label>
                <input type="text" class="form-control" name="writer" value="${notice.writer}" readonly="readonly">
            </div>
            <div class="form-group">
                <button id="modifyBtn" data-oper="modify" type="button" class="btn btn-primary">수정하기</button>
                <button id="deleteBtn" data-oper="remove" type="button" class="btn btn-danger">삭제하기</button>
                <button type="button" data-oper="notice" class="btn btn-info">목록</button>
            </div>
        </form>
    </div>

<script src="/resources/service/dist/notice/js/noticeModify.js"></script>
</body>
</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
