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
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>


</head>


<body>
	<%@include file="../header.jsp" %>
	<div id="page-wrapper">
	<%@include file="../sidebar.jsp" %>

	<!-- Start Cart  -->
	<div class="cart-box-main">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="title-all text-center">
						<h1>마이페이지</h1>
						<p></p>
					</div>
					<div class="table-main table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>번호</th>
									<th>레시피이미지</th>
									<th>재료</th>
									<th>구매날짜</th>
									<th>수량</th>
									<th>가격</th>
									<th>배송상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="number">
										<p>1</p>
									</td>
									<td class="thumbnail-img"><a href="#"> <img
											class="img-fluid" src="images/볶음밥.jpg" alt="" />
									</a></td>
									<td class="name-pr"><a href="#"> 볶음밥<br>밥100g 당근
											50g 버섯5g 식용유5m<br>설탕5g 간장5ml 양파10g <br>
											<p>4,000원</p>
									</a></td>
									<td class="price-pr">2020-12-11 <br> 12:25
									</td>
									<td class="quantity-box"><input type="number" size="4"
										value="1" min="0" step="1" class="c-input-text qty text"></td>
									<td class="total-pr">
										<p>1,400원</p>
									</td>
									<td class="remove-pr">
										<div style="background-color:">배송중</div>



									</td>
								</tr>
								<tr>
									<td class="number">
										<p>2</p>
									</td>
									<td class="thumbnail-img"><a href="#"> <img
											class="img-fluid" src="images/김치찌개.jpg" alt="" />
									</a></td>
									<td class="name-pr"><a href="#"> 김치찌개<br>밥100g
											김치50g 파5g 버섯5g 설탕 5g<br>간장5ml 양파10g 돼지고기100g <br>
											<p>4,000원</p>
									</a></td>
									<td class="price-pr">2020-12-11 <br> 12:25
									</td>
									<td class="quantity-box"><input type="number" size="4"
										value="1" min="0" step="1" class="c-input-text qty text"></td>
									<td class="total-pr">
										<p>1,400원</p>
									</td>
									<td class="remove-pr">배송완료</td>
								</tr>
								<tr>
									<td class="number">
										<p>3</p>
									</td>
									<td class="thumbnail-img"><a href="#"> <img
											class="img-fluid" src="images/김치찌개.jpg" alt="" />
									</a></td>
									<td class="name-pr"><a href="#"> 김치찌개<br>밥100g
											김치50g 파5g 버섯5g 설탕 5g<br>간장5ml 양파10g 돼지고기100g <br>
											<p>4,000원</p>
									</a></td>
									<td class="price-pr">2020-12-11 <br> 12:25
									</td>
									<td class="quantity-box"><input type="number" size="4"
										value="1" min="0" step="1" class="c-input-text qty text"></td>
									<td class="total-pr">
										<p>1,400원</p>
									</td>
									<td class="remove-pr">배송중</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="row my-5"></div>
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