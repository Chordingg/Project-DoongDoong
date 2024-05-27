<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<link rel="stylesheet"
	href="/resources/product/photoPrint/dist/css/generalUpload.css">
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

				<div class="photo_content_main">
					<form action="/photoPrint/generalUploadPost" method="post"
						id="enrollForm">
						<div class="form_section">
							<div class="form_section_title">
								<label>상품 이미지</label>
							</div>
							<div class="form_section_content">
								<input type="file" multiple id="fileItem" name='uploadFile'
									style="height: 50px;">
								<div id="uploadResult"></div>
							</div>
							<div class="form_section_content">
								<input type="hidden" name="userid"
									value='<sec:authentication property="principal.username"/>' />
							</div>

							<div class="cate_wrap">
								<span>사진종류</span> 
								<select class="cate1" disabled="disabled">
									<option selected value="100000">일반사진</option>
								</select>
							</div>
							<div class="cate_wrap">
								<span>사이즈</span> 
								<select class="cate2">
									<option selected value="none">선택</option>
								</select>
							</div>
							<div class="cate_wrap">
								<span>가격</span> 
								<select class="cate3" name="cateCode">
									<option selected value="none">선택</option>
								</select>
							</div>


						</div>
					</form>
				</div>

				<div class="btn_section">
					<button id="cancelBtn" class="btn">취 소</button>
					<button id="enrollBtn" class="btn enroll_btn">등 록</button>
				</div>
			</article>
		</div>
	</div>
</section>

<script>	
$(document).ready(function() {
	   // 카테고리
	   let cateList = JSON.parse('${cateList}');

	   let cate1Array = new Array();
	   let cate2Array = new Array();
	   let cate3Array = new Array();

	   let cate1Obj = new Object();
	   let cate2Obj = new Object();
	   let cate3Obj = new Object();

	   let cateSelect1 = $(".cate1");
	   let cateSelect2 = $(".cate2");
	   let cateSelect3 = $(".cate3");

	   /* 카테고리 배열 초기화 메서드 */
	   function makeCateArray(obj, array, cateList, tier) {
	      for (let i = 0; i < cateList.length; i++) {
	         if (cateList[i].tier === tier) {
	            obj = new Object();

	            obj.cateName = cateList[i].cateName;
	            obj.cateCode = cateList[i].cateCode;
	            obj.cateParent = cateList[i].cateParent;
	            
	       		// 여기서 productPrice 속성 설정
	            obj.productPrice = cateList[i].productPrice;

	            array.push(obj);
	         }
	      }
	   }

	   /* 배열 초기화 */
	   makeCateArray(cate1Obj, cate1Array, cateList, 1);
	   makeCateArray(cate2Obj, cate2Array, cateList, 2);
	   makeCateArray(cate3Obj, cate3Array, cateList, 3);

	   console.log(cate1Array);
	   console.log(cate2Array);
	   console.log(cate3Array);

	   let selectVal1 = cateSelect1.find("option:selected").val();

	   for (let i = 0; i < cate2Array.length; i++) {
	      if (selectVal1 === cate2Array[i].cateParent) {
	         cateSelect2.append("<option value='" + cate2Array[i].cateCode + "'>" + cate2Array[i].cateName + "</option>");
	      }
	   }

	   /* 소분류 <option>태그 */
	   $(cateSelect2).on("change", function() {
	       let selectVal2 = $(this).find("option:selected").val();
	       
	       cateSelect3.children().remove();

	       for (let i = 0; i < cate3Array.length; i++) {
	           if (selectVal2 === cate3Array[i].cateParent) {
	               cateSelect3.append("<option value='" + cate3Array[i].cateCode + "'>" + cate3Array[i].productPrice + "</option>");
	           }
	       }
	       
	       // 자동으로 첫 번째 옵션 선택하기
	       cateSelect3.val(cateSelect3.find("option:first").val());
	   });

	   // 사진등록
	   let enrollForm = $("#enrollForm")

	   // 취소버튼
	   $("#cancelBtn").click(function() {
	      location.href = "/photoPrint/general"
	   });

	   $("#enrollBtn").on("click", function(e) {
	      e.preventDefault();

	      enrollForm.submit();
	   });

	   // 이미지 업로드
	   $("input[type='file']").on("change", function(e) {
	      // 이미지 존재시 삭제
	      if ($(".imgDeleteBtn").length > 0) {
	         deleteFile();
	      }

	      let formData = new FormData();
	      let fileInput = $('input[name="uploadFile"]');
	      let fileList = fileInput[0].files;
	      let fileObj = fileList[0];

	      formData.append("uploadFile", fileObj);

	      $.ajax({
	         url: '/photoPrint/uploadAjaxAction',
	         processData: false,
	         contentType: false,
	         data: formData,
	         type: 'POST',
	         dataType: 'json',
	         success: function(result) {
	            console.log(result);
	            showUploadImage(result);
	         },
	         error: function(result) {
	            alert("이미지 파일이 아닙니다.");
	         }
	      });
	   });

	   // 이미지 출력
	   function showUploadImage(uploadResultArr) {
	      if (!uploadResultArr || uploadResultArr.length == 0) {
	         return
	      }

	      let uploadResult = $("#uploadResult");
	      let obj = uploadResultArr[0];
	      let str = "";
	      let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);

	      str += "<div id='result_card'>";
	      str += "<img src='/photoPrint/display?fileName=" + fileCallPath + "' style='width: 200px; height: auto;'>";
	      str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
	      str += "<input type='hidden' name='imageList[0].fileName' value='" + obj.fileName + "'>";
	      str += "<input type='hidden' name='imageList[0].uuid' value='" + obj.uuid + "'>";
	      str += "<input type='hidden' name='imageList[0].uploadPath' value='" + obj.uploadPath + "'>";
	      str += "</div>";

	      uploadResult.append(str);
	   }

	   // 이미지 삭제 버튼 동작
	   $("#uploadResult").on("click", ".imgDeleteBtn", function(e) {
	      deleteFile();
	   });

	   // 파일 삭제 메서드
	   function deleteFile() {
	      let targetFile = $(".imgDeleteBtn").data("file");
	      let targetDiv = $("#result_card");

	      $.ajax({
	         url: '/photoPrint/deleteFile',
	         data: {
	            fileName: targetFile
	         },
	         dataType: 'text',
	         type: 'POST',
	         success: function(result) {
	            console.log(result);
	            targetDiv.remove();
	            $("input[type='file']").val("");
	         },
	         error: function(result) {
	            console.log(result);
	            alert("파일을 삭제하지 못하였습니다.");
	         }
	      });
	   }

	});
	</script>


<%@ include file="/WEB-INF/views/includes/footer.jsp"%>