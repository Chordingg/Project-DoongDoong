<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<link rel="stylesheet" href="/resources/myinfo/dist/customer/css/customer.css">

<section id="features">
    <div class="container">
        <header>
            <h2><strong>회원 정보 수정</strong></h2>
        </header>
        <div class="row aln-center">
            <div class="col-12">
                <form id="updateForm" action="/myinfo/update" method="post" onsubmit="return updateMyinfo()">
                
                    <div class="form-group">
                        <label>아이디</label>
                        <input type="text" class="form-control" id="userid" name="userid" value='<sec:authentication property="principal.memberVO.userid"/>' readonly="readonly">
                    </div>
                    
                    <div class="form-group">
                        <label>이름</label>
                        <input type="text" class="form-control" id="username" name="username" value='<sec:authentication property="principal.memberVO.userName"/>'>
                    </div>
                    
                    <div class="form-group">
                        <label>전화번호</label>
                        <input type="text" class="form-control" id="phone" name="phone" value='<sec:authentication property="principal.memberVO.phone"/>'>
                    </div>
                    
                    <div class="form-group">
                        <label>주소</label>
                        <div class="form-group">
                            <input type="text" class="form-control" id="memberAddr1" name="memberAddr1" value='<sec:authentication property="principal.memberVO.memberAddr1"/>'>
                        </div>
                    </div>
					<div class="form-group">
						<div class="col-auto">
							<input class="form-control" type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
						</div>
					</div>

					<div class="form-group">
                        <div class="col">
                            <input type="text" class="form-control" id="memberAddr2" name="memberAddr2" value='<sec:authentication property="principal.memberVO.memberAddr2"/>'>
                            <input type="text" class="form-control" id="memberAddr3" name="memberAddr3" value='<sec:authentication property="principal.memberVO.memberAddr3"/>'>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label>새 비밀번호</label>
                        <input type="password" class="form-control" id="userpw" name="userpw" placeholder="비밀번호를 입력해주세요.">
                    </div>
                    
                    <div class="form-group">
                        <label>새 비밀번호 확인</label>
                        <input type="password" class="form-control" id="userpwConfirm" name="userpwConfirm" placeholder="비밀번호를 입력해주세요.">
                    </div>
                    
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    &nbsp; &nbsp; &nbsp;
                    <button type="button" id="deleteBtn" class="btn btn-primary">탈퇴하기</button>
                </form>
            </div>
        </div>
    </div>
</section>

<script src="/resources/myinfo/dist/customer/js/customer.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
