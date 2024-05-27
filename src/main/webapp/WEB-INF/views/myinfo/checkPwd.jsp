<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<link rel="/resources/myinfo/dist/customer/css/customer.css">

<!-- Features -->
<section id="features">
	<div class="container">
		<header>
			<h2>
				<strong>회원 정보 수정</strong>
			</h2>
		</header>
		<div class="row aln-center">
			<div class="col-12">
				<!-- 회원 정보 입력 폼 -->
				<form action="/myinfo/password-check" method="post">

					<!-- 회원 아이디 -->
					<div class="form-group">
						<label>개인정보를 안전하게 보호하기 위하여<br>둥둥 비밀번호를 한번 더 입력해 주세요.</label> 
						
						<input type="hidden" class="form-control" id="userid" name="userid" value='<sec:authentication property="principal.memberVO.userid"/>'>

						<input type="password" class="form-control" id="userpw" name="userpw">
					</div>

					<br>

					<!-- 수정 버튼 -->
					<button type="submit" class="btn btn-primary">확인</button>
				</form>
				<br>
				<div>
					<!-- 에러 메시지가 있을 경우에만 표시 -->
					<c:if test="${not empty error}">
						<div class="alert alert-danger" role="alert">${error}</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
