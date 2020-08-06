<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>Freshshop - Ecommerce Bootstrap 4 HTML Template</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="/images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="/css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="/css/custom.css">

<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}

				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zip').value = data.zonecode;
				document.getElementById("addr1").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("addr2").focus();
			}
		}).open();
	}
	$(document)
			.ready(
					function() {
						var formObj = $("form[name='readForm']");

						$(".cancel_btn")
								.on(
										"click",
										function() {
											event.preventDefault();
											location.href = "/memberManage/readView?userId=${read.userId}"
													+ "&page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}"
													+ "&keyword=${scri.keyword}";
										})
						$(".delete_btn").on("click", function() {
							formObj.attr("action", "/memberManage/delete");
							formObj.attr("method", "post");
							formObj.submit();
						})
						$(".cancel_btn").on("click", function() {
							history.back();
						})
					})
</script>
</head>

<body>
	<%@include file="../header.jsp"%>
	<div id="page-wrapper">
		<%@include file="../sidebar.jsp"%>
		<div class="container">
			<div class="all-title-box">
				<div class="row">
					<div class="col-lg-12">
						<div class="col-lg-6 col-sm-6">
							<h2>관리자-회원관리</h2>
						</div>
					</div>
				</div>
			</div>
			<%@include file="nav.jsp"%>
		</div>
		<div class="contact-box-main">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-sm-12">
						<div class="contact-form-right" style="border: 1px solid;">
							<h2>회원정보조회</h2>
							<br>

							<form name="readForm" action="/memberManage/read" method="post">
								<div class="row">
								<input type="hidden" id="userId" name="userId"
						value="${read.userId}" /> <input type="hidden" id="page"
						name="page" value="${scri.page}"> <input type="hidden"
						id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
					<input type="hidden" id="searchType" name="searchType"
						value="${scri.searchType}"> <input type="hidden"
						id="keyword" name="keyword" value="${scri.keyword}">

									<div class="col-md-12">
										<h3>아이디</h3>
										<div class="form-group" style="border: 1px solid;">
											<p>${read.userId }</p>
										</div>
									</div>
									<div class="col-md-12">
										<h3>이름</h3>
										<div class="form-group" style="border: 1px solid;">
											<p>${read.userName }</p>
										</div>
									</div>

									<div class="col-md-12">
										<div class="form-group">
											<h3>휴대폰번호</h3>
											<div class="form-group" style="border: 1px solid;">
												<p>${read.phoneNumber }</p>
											</div>
										</div>
									</div>

									<div class="col-md-12">
										<h3>회원주소</h3>
										<div class="form-group" style="border: 1px solid;">
											<p>${read.zip }</p>
											<p>${read.addr1 }</p>
											<p>${read.addr2 }</p>
										</div>
									</div>
									<div class="col-md-12">
										<h3>생년월일</h3>
										<div class="form-group" style="border: 1px solid;">
											<p>${read.birthday }</p>
											<div class="help-block with-errors"></div>
										</div>
									</div>

									<div class="col-md-12">
										<h3>가입일자</h3>
										<div class="form-group" style="border: 1px solid;">
											<p>
												<fmt:formatDate value="${read.registDate}"
													pattern="yyyy-MM-dd" />
											</p>

											<div class="help-block with-errors"></div>
										</div>
									</div>

									<div class="col-md-12">
										<h3>이메일</h3>
										<div class="form-group " style="border: 1px solid;">
											<p>${read.email }</p>

										</div>
										<div class="submit-button text-center">
											<button class="delete_btn btn hvr-hover" id="submit"
												type="submit" style="margin-right: 10px">삭제</button>
											<button class="cancel_btn btn hvr-hover" id="submit"
												type="submit" style="margin-left: 10px">취소</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div id="msgSubmit" class="h3 text-center hidden"></div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>

		<%@include file="../footer.jsp"%>
	</div>


	<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

	<!-- ALL JS FILES -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- ALL PLUGINS -->
	<script src="js/jquery.superslides.min.js"></script>
	<script src="js/bootstrap-select.js"></script>
	<script src="js/inewsticker.js"></script>
	<script src="js/bootsnav.js."></script>
	<script src="js/images-loded.min.js"></script>
	<script src="js/isotope.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/baguetteBox.min.js"></script>
	<script src="js/form-validator.min.js"></script>
	<script src="js/contact-form-script.js"></script>
	<script src="js/custom.js"></script>

</body>

</html>