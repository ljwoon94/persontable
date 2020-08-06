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

<head>

<style>
div#container_box ul li {
	border: 5px solid #eee;
	padding: 10px 20px;
	margin-bottom: 20px;
}

div#container_box .orderList span {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 90px;
	margin-right: 10px;
}

section#content ul li {
	border: 5px solid #eee;
	padding: 10px 20px;
	margin-bottom: 20px;
}

section#content .orderList span {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 90px;
	margin-right: 10px;
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
			<div class="col-lg-10 col-sm-10">
				<h2>관리자-주문목록관리</h2>
		</div>
		</div>
		</div>
		</div>
			<hr />


			<section id="container">
				<div id="container_box">
					<section id="content">
						<ul class="orderList">
							<c:forEach items="${orderList}" var="orderList">
								<li>
									<div>
										<p>
											<span>주문번호</span><a
												href="/cart/adminOrderView?n=${orderList.orderId}">${orderList.orderId}</a>
										</p>
										<p>
											<span>수령인</span>${orderList.orderRec}</p>
										<p>
											<span>주소</span>(${orderList.zip}) ${orderList.addr1}
											${orderList.addr2}
										</p>
										<p>
											<span>가격</span>
											<fmt:formatNumber pattern="###,###,###"
												value="${orderList.amount}" />
											원
										</p>
										<p>
											<span>상태</span>${orderList.delivery}</p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</section>
				</div>
			</section>

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