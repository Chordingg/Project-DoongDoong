<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<!-- Main -->
<section id="main">
	<div class="container">
		<!-- Content -->
		<div id="content" class="col-8 col-12-medium">

			<!-- Post -->
			<article class="box post">
				<header>
					<h2>
						<strong>일반 사진</strong> <br>
					</h2>
					<h3>세계 최고의 사진인화 퀄리티를 보장합니다.</h3>
				</header>
				 <div class="row">
                    <div class="col-md-3">
                        <!-- 반응형 컬럼, 중간 화면 이상에서 2개의 열로 배치됩니다. -->
                        <span class="image featured"> 
                        <img  src="/resources/product/photoPrint/dist/images/photo.jpg" alt="" /> <!-- 이미지 최대 너비를 설정합니다. -->
                        </span>
                    </div>
                </div>
              
				<h3>📷 폰 자신 인화</h3>
				<p>3 X 5 (8.9cmX12.7cm)부터</p>
				<p>A3 (30.5cmX42cm)까지</p>
				<p>12가지 사이즈 주문이 가능합니다.</p>
				
				<sec:authorize access="isAuthenticated()">
					<input type="hidden" id="cateCode" value="100000">
					<a href="/photoPrint/generalUpload"><button>사진 넣기</button></a>
				</sec:authorize>
			
			</article>
		</div>
	</div>
</section>
<script>
    function setCateCode() {
        // hidden input에 cateCode 값을 설정
        document.getElementById('cateCode').value = '100000';
    }
</script>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>