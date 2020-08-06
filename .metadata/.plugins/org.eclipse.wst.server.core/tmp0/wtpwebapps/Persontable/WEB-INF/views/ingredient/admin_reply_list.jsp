<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

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
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script>
	$(function() {
		$('#searchBtn').click(
				function() {
					self.location = "list" + '${pageMaker.makeQuery(1)}'
							+ "&searchType="
							+ $("select option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val());
				});
	});
</script>
<head>

<style>
#container_box ul li {
	margin-bottom: 20px;
	border: 10px solid #eee;
}

.replyInfo {
	background: #eee;
	padding: 10px;
	font-size: 18px;
}

.replyInfo span {
	font-size: 20px;
	font-weight: bold;
	margin-right: 20px;
}

.replyContent {
	padding: 10px;
}

.replyControll {
	text-align: right;
	padding: 10px;
}

.replyControll button {
	border: 2px solid #999;
	background: #fff;
}
</style>

<title>1인 식탁</title>
</head>

<body>
	<%@include file="../header.jsp"%>
	<div id="page-wrapper">
		<%@include file="../sidebar.jsp"%>
		<div class="container">
			<div class="all-title-box">
				<div class="row">
					<div class="col-lg-6">
						<div class="col-lg-5 col-sm-5">
							<h2>관리자-식재료</h2>
						</div>
					</div>
				</div>
			</div>
			<hr />
			<section id="container">
				<div id="container_box">
					<ul>
						<c:forEach items="${reply}" var="reply">
							<li>
								<div class="replyInfo">
									<p>
										<span>작성자</span>${reply.userName} (${reply.userId})
									</p>
									<p>
										<span>작성된 상품</span> <a
											href="/ingredient/sellIngView?n=${reply.ingNum}">바로가기</a>

									</p>
								</div>
								<div class="replyContent">${reply.repCon}</div>
								<div class="replyControll">
									<form role="form" method="post">
										<input type="hidden" name="repNum" value="${reply.repNum}" />
										<button type="submit" class="delete_${reply.repNum}_btn">삭제</button>
									</form>
								</div>
							</li>

						</c:forEach>

					</ul>


				</div>
			</section>
		</div>
	</div>


	<%@include file="../footer.jsp"%>


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