<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>Freshshop - Ecommerce Bootstrap 4 HTML Template</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="/images/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon" href="/images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="/css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="/css/custom.css">

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function cancel() {
		location.href = "/";
	}

	$(document).ready(function() {

		$("#submit").on("click", function() {
			if ($("#userPasswd").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#userPasswd").focus();
				return false;
			}
			$.ajax({
				url : "/member/passChk",
				type : "POST",
				dataType : "json",
				data : $("#delForm").serializeArray(),
				success : function(data) {
					if (data == 0) {
						alert("패스워드가 틀렸습니다.");
						return;
					} else {
						if (confirm("회원탈퇴하시겠습니까?")) {
							$("#delForm").submit();
						}

					}
				}
			})

		});

	})
</script>
<body>
	<%@include file="../header.jsp" %>
	<div id="page-wrapper">
	<%@include file="../sidebar.jsp" %>
	<div class="contact-box-main">

		<div class="container">

			<div class="row">
				<div class="col-lg-8 col-sm-12">
					<div class="contact-form-right">
						<h2>회원탈퇴</h2>
						<section id="loginFormArea">
							<form action="/member/memberDelete" method="post" id="delForm">
								<div class="row">
									<div class="col-md-12">
										이름
										<div class="form-group">
											<input type="text" class="form-control" id="userName" name="userName"
												value="${member.userName }" readonly>
											<div class="help-block with-errors"></div>
										</div>
									</div>
									<div class="col-md-12">
										아이디
										<div class="form-group">
											<input type="text" class="form-control" id="userId" name="userId"
												value="${member.userId }" readonly />
											<div class="help-block with-errors"></div>
										</div>
									</div>

									<div class="col-md-12">
										비밀번호
										<div class="form-group">
											<input type="password" class="form-control" id="userPasswd"
												name="userPasswd" placeholder="password">
											<div class="help-block with-errors"></div>
										</div>
									</div>

								</div>
							</form>


  						<div class="submit-button text-center">
							<button type="submit" class="btn hvr-hover" id="submit">회원탈퇴</button>
							<button type="submit" class="btn hvr-hover" onclick="cancel();" id="cancel">취소</button>
						</div>

						</section>
					</div>
				</div>
			</div>
		</div>
	</div>
			<%@include file="../footer.jsp" %>
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