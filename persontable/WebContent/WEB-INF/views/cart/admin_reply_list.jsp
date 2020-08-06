<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<!-- Site Icons -->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="css/custom.css">

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
.centerd {
	margin-right: auto;
	margin-left: auto;
}

#page-wrapper {
	padding-left: 250px;
}

#sidebar-wrapper {
	position: fixed;
	width: 250px;
	height: 100%;
	margin-left: -250px;
	background-color: #ffffff;
	overflow-x: hidden;
	overflow-y: auto;
}

#page-content-wrapper {
	width: 100%;
	padding: 20px;
}
/* 사이드바 스타일 */
.sidebar-nav {
	width: 250px;
	padding: 0;
	list-style: none;
}

.sidebar-nav li {
	text-indent: 1.5em;
	line-height: 2.8em;
}

.sidebar-nav li a {
	display: block;
	text-decoration: none;
	color: #000000;
}

.sidebar-nav li a:hover {
	color: #000000;
	background: rgb(255, 255, 100, 0.2);
}

.sidebar-nav>.sidebar-brand {
	font-size: 1.3em;
	line-height: 3em;
}

.footer-main {
	color: #ffffff;
	margin-top: 300px;
	margin-left: 250px;
	background-color: #000;
}

.footer-top-box, .footer-link-contact {
	margin-top: 50px;
}
</style>

<title>1인 식탁</title>
</head>

<body>

	<%@include file="../header.jsp"%>


		<div class="container">
			<header class="">
				<h1>식재료관리목록</h1>
			</header>
			<hr />

			<div>
				<%@include file="nav.jsp"%>
			</div>

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
										<span>작성된 상품</span> <a href="/ingredient/view?n=${reply.gdsNum}">바로가기</a>
									</p>
								</div>
								<div class="replyContent">${reply.repCon}</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</section>
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