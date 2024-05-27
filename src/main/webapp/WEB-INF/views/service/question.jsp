<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="/resources/service/dist/question/js/question.js"></script>
<link href="/resources/service/dist/question/css/question.css" rel="stylesheet" />

<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Insert title here</title>
</head>
<body>

	<div class="container mt-3">
		<h2>질문을 클릭하시면 답변을 보실 수 있습니다.</h2>
		<br>
		<p id="question1" class="question">
			<i class="fa fa-question-circle-o" style="font-size: 18px"><strong>
					회원가입은 어떻게 하나요?</strong></i>
		</p>
		
		<div id="answer1" class="answer">
			<i class="fa fa-hand-o-right" > 사이트 우측 상단에
				회원가입 버튼을 누르시고 이메일 주소 입력 후, 이메일로 인증번호를 받아 입력하셔야 합니다.<br> 인증 후에
				나머지 정보 입력하면 가입 완료됩니다.
			</i>
		</div>
		<hr>
	</div>

	<div class="container mt-3">
		<p id="question2" class="question">
			<i class="fa fa-question-circle-o" style="font-size: 18px"><strong>
					회원정보는 어떻게 변경하나요?</strong></i>
		</p>
		<div id="answer2" class="answer">
			<i class="fa fa-hand-o-right" >로그인 후, 우측
				탭의 마이페이지-> 회원정보-> 자세히 보기를 클릭하여 원하시는 정보를 변경해 주세요.</i>
		</div>
		<hr>
	</div>

	<div class="container mt-3">
		<p id="question3" class="question">
			<i class="fa fa-question-circle-o" style="font-size: 18px"><strong>
					비밀번호를 잊어버렸어요. 어떻게 하나요?</strong></i>
		</p>
		<div id="answer3" class="answer">
			<i class="fa fa-hand-o-right" >로그인 페이지 >
				비밀번호 재설정 버튼 클릭 > 비밀번호 재설정 페이지에서 아이디(이메일주소), 이름 입력 하시면<br> 해당
				이메일로 비밀번호 재설정 링크를 보내드립니다.
			</i>
		</div>
		<hr>
	</div>

	<div class="container mt-3">
		<p id="question4" class="question">
			<i class="fa fa-question-circle-o" style="font-size: 18px"><strong>
					탈퇴 하려면 어떻게 해야 하나요?</strong></i>
		</p>
		<div id="answer4" class="answer">
			<i class="fa fa-hand-o-right" >로그인하신 후,
				마이페이지->회원탈퇴를 통해서 본인 확인을 위해 한 번 더 로그인을 하시면 직접 회원 탈퇴가 가능합니다.<br>
				선입금/zzixx포인트/찍스 클라우드에 이미지가 남아있는지 여부를 반드시 확인해 주시기 바라며, 탈퇴 후에 100일간은
				동일 아이디로 재가입이 불가한 점 참고하여 주시기 바랍니다.
			</i>
		</div>
		<hr>
	</div>

	<div class="container mt-3">
		<p id="question5" class="question">
			<i class="fa fa-question-circle-o" style="font-size: 18px"><strong>
					회원 가입하지 않고, 비회원으로도 주문이 가능한가요?</strong></i>
		</p>
		<div id="answer5" class="answer">
			<i class="fa fa-hand-o-right" > 비회원으로도 주문이
				가능하며, 비회원 주문내역은 주문내역보기를 통해 수취인/주문조회코드를 입력하시면 내역 조회가 가능합니다.</i>
		</div>
		<hr>
	</div>

	<div class="container mt-3">
		<p id="question6" class="question">
			<i class="fa fa-question-circle-o" style="font-size: 18px"><strong>
					사진인화에서 가장 많이 인화하는 사이즈가 궁금해요.</strong></i>
		</p>
		<div id="answer6" class="answer">
			<i class="fa fa-hand-o-right" >
				3x5사이즈(8.9x12.7cm)/D4사이즈(10.2x13.5cm)/4x6사이즈(10.2x15.1cm)가 일반적인
				사이즈이며, 정확한 규격(cm단위)를 확인하여 선택해 주시기 바랍니다.<br> 컴팩트 디지털카메라는
				D4사이즈(4:3비율), DSLR은 4x6사이즈(2:3비율)를 비율상 권장하고 있으나, 일부 디지털 카메라 및 핸드폰
				카메라는 이와 다른 비율의 해상도가 지원될 수 있으니,<br> 반드시 주문 시 미리보기를 통해 인화되는 모양을
				확인하시기 바랍니다.
			</i>
		</div>
		<hr>
	</div>

	<div class="container mt-3">
		<p id="question7" class="question">
			<i class="fa fa-question-circle-o" style="font-size: 18px"><strong>
					사용하는 인화지는 어떤 건가요?</strong></i>
		</p>
		<div id="answer7" class="answer">
			<i class="fa fa-hand-o-right" > Doong
				Doong에서는 최고 품질의 사진을 최적의 색재현을 위해 최고급 인화지 QPDP(Quality Paper Digital
				Pro)를 사용하고 있습니다.</i>
		</div>
		<hr>
	</div>

	<div class="container mt-3">
		<p id="question8" class="question">
			<i class="fa fa-question-circle-o" style="font-size: 18px"><strong>
					핸드폰으로 촬영한 이미지도 인화 가능한가요?</strong></i>
		</p>
		<div id="answer8" class="answer">
			<i class="fa fa-hand-o-right" > 스마트폰을
				사용하시는 경우에는 앱스토어 및 플레이스토어에서 zzixx 사진인화 앱을 다운 받아서 바로 주문이 가능합니다. 스마트폰이
				아닌 일반 핸드폰 카메라로 촬영한 이미지도 PC로 옮긴 후, 홈페이지 상단[사진인화]를 통해 인화 주문이 가능합니다. 단,
				핸드폰 카메라로 촬영하신 이미지는 해상도가 낮아 인화시 화질이 저하되는 경우도 있으니, 주문시 장바구니 창에서 안내되는
				권장/비권장(O/X) 여부를 참고하여 권장되는 규격으로 주문하시길 권해드립니다.</i>
		</div>
		<hr>
	</div>

	<div class="container mt-3">
		<p id="question9" class="question">
			<i class="fa fa-question-circle-o" style="font-size: 18px"><strong>
					사진 보정도 해 주시나요?</strong></i>
		</p>
		<div id="answer9" class="answer">
			<i class="fa fa-hand-o-right" > zzixx에서는
				정확하게 캘리브레이션된 인화 시스템에 의해 자동 공정에 따라 고객님께서 보내주신 원본 이미지 그대로만 인화 작업을 하여
				드리고 있으며, 별도의 보정 작업은 이루어지지 않으니, 이미지 수정/편집 등은 주문 전 이미지 편집 프로그램을 통해 직접
				작업하신 후, 주문해 주시기 바랍니다. </i>
		</div>
		<hr>
	</div>

	<div class="container mt-3">
		<p id="question10" class="question">
			<i class="fa fa-question-circle-o" style="font-size: 18px"><strong>
					트루포토북 제작기간은 얼마나 소요되나요?.</strong></i>
		</p>
		<div id="answer10" class="answer">
			<i class="fa fa-hand-o-right" > 트루포토북의 경우,
				주문일로부터 주말/휴일을 제외하고 약 +2일 정도의 제작 기간이 소요되고 있으며, 주문량 및 작업 현황 등에 따라
				제작기간이 다소 추가될 수 있습니다. </i>
		</div>
		<hr>
	</div>
	<hr>


</body>
</html>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>