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
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<head>

<style>

section#content ul li img {
	width: 250px;
	height: 250px;
}

section#content ul li::after {
	content: "";
	display: block;
	clear: both;
}

section#content div.thumb {
	float: left;
	width: 250px;
}

section#content div.ingInfo {
	float: right;
	width: calc(100% - 270px);
}

section#content div.ingInfo {
	line-height: 2;
}

section#content div.ingInfo span {
	display: inline-block;
	width: 100px;
	font-weight: bold;
	margin-right: 10px;
}

.allCheck {
	float: left;
	width: 200px;
}

.allCheck input {
	width: 16px;
	height: 16px;
}

.allCheck label {
	margin-left: 10px;
}


.checkBox {
	float: left;
	width: 50px;
}

.checkBox input {
	width: 16px;
	height: 16px;
}

.listResult {
	padding: 20px;
	background: #eee;
}

.listResult .sum {
	float: left;
	width: 45%;
	font-size: 22px;
}

.listResult .orderOpne {
	float: right;
	width: 45%;
	text-align: right;
}

.listResult .orderOpne button {
	font-size: 18px;
	padding: 5px 10px;
	border: 1px solid #999;
	background: #fff;
}

.listResult::after {
	content: "";
	display: block;
	clear: both;
}

.orderInfo {
	border: 5px solid #eee;
	padding: 20px;
	display: none;
}

.orderInfo .inputArea {
	margin: 10px 0;
}

.orderInfo .inputArea label {
	display: inline-block;
	width: 120px;
	margin-right: 10px;
}

#userAddr2, #userAddr3 {
	width: 250px;
}

.orderInfo .inputArea button {
	font-size: 20px;
	border: 2px solid #ccc;
	background: #fff;
	margin-right: 20px;
}
</style>
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
	</script>
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
				<h2>장바구니</h2>
		</div>
		</div>
		</div>
		</div>
			<hr />
			<section id="content">
				<ul>
					<li>
						<div class="allCheck">
							<input type="checkbox" name="allCheck" id="allCheck" /><label
								for="allCheck">모두 선택</label>
							<script>
								$("#allCheck").click(function() {
									var chk = $("#allCheck").prop("checked");
									if (chk) {
										$(".chBox").prop("checked", true);
									} else {
										$(".chBox").prop("checked", false);
									}
								});
							</script>
						</div>
						<div class="submit-button text-right">
						<div class="delBtn">
							<button type="button" class="selectDelete_btn btn hvr-hover">선택 삭제</button>
							<script>
								$(".selectDelete_btn")
										.click(
												function() {
													var confirm_val = confirm("정말 삭제하시겠습니까?");

													if (confirm_val) {
														var checkArr = new Array();

														$(
																"input[class='chBox']:checked")
																.each(
																		function() {
																			checkArr
																					.push($(
																							this)
																							.attr(
																									"data-cartNum"));
																		});

														$
																.ajax({
																	url : "/cart/deleteCart",
																	type : "post",
																	data : {
																		chbox : checkArr
																	},
																	success : function(
																			result) {
																		if (result == 1) {
																			location.href = "/cart/cartList";
																		} else {
																			alert("삭제 실패");
																		}
																	}
																});
													}
												});
							</script>
						</div>
						</div>

					</li>
					<c:set var="sum" value="0" />
					<c:forEach items="${cartList}" var="cartList">
					<div style = "border: 1px solid #808080;">
						<li>
							<div class="checkBox">
								<input type="checkbox" name="chBox" class="chBox"
									data-cartNum="${cartList.cartNum}" />
								<script>
									$(".chBox").click(function() {
										$("#allCheck").prop("checked", false);
									});
								</script>
							</div>
						<div class ="row">
							<div class="thumb">
								<img src="${cartList.ingThumbImg}" style="width:170px; height:170px;" />
							</div>
							<div class="ingInfo" style="margin-left:20px;">
								<p>
									<span>상품명</span>${cartList.ingName}<br /> <span>개당 가격</span>
									<fmt:formatNumber pattern="###,###,###"
										value="${cartList.ingPrice}" />
									원<br /> <span>구입 수량</span>${cartList.cartStock} 개<br /> <span>최종
										가격</span>
									<fmt:formatNumber pattern="###,###,###"
										value="${cartList.ingPrice * cartList.cartStock}" />
									원
								</p>
								<div class="submit-button text-right">
								<div class="delete">
									<button type="button" class="btn hvr-hover delete_${cartList.cartNum}_btn"
										data-cartNum="${cartList.cartNum}">삭제</button>
								</div>
									<script>
										$(".delete_${cartList.cartNum}_btn")
												.click(
														function() {
															var confirm_val = confirm("정말 삭제하시겠습니까?");

															if (confirm_val) {
																var checkArr = new Array();

																checkArr
																		.push($(
																				this)
																				.attr(
																						"data-cartNum"));

																$.ajax({url : "/cart/deleteCart",
																			type : "post",
																			data : {
																				chbox : checkArr
																			},
																			success : function(
																					result) {
																				if (result == 1) {
																					location.href = "/cart/cartList";
																				} else {
																					alert("삭제 실패");
																				}
																			}
																		});
															}
														});
									</script>
								</div>
							</div>
							</div>
						</li></div>
						<c:set var="sum"
							value="${sum + (cartList.ingPrice * cartList.cartStock)}" />
					</c:forEach>
				</ul>
				<div class="listResult">
					<div class="sum">
						총 합계 :
						<fmt:formatNumber pattern="###,###,###" value="${sum}" />
						원
					</div>
					<div class="orderOpne">
						<button type="button" class="orderOpne_btn btn hvr-hover">주문 정보 입력</button>
						<script>
							$(".orderOpne_btn").click(function() {
								$(".orderInfo").slideDown();
								$(".orderOpne_bnt").slideUp();
							});
						</script>
					</div>
				</div>

				<div class="orderInfo">
					<form role="form" method="post" autocomplete="off">

						<input type="hidden" name="amount" value="${sum}" />

						<div class="inputArea">
							<label for="">수령인</label> <input type="text" name="orderRec"
								id="orderRec" required="required" />
						</div>

						<div class="inputArea">
							<label for="orderPhone">수령인 연락처</label> <input type="text"
								name="orderPhone" id="orderPhone" required="required" />
						</div>

						<div class="inputArea">
									<label for="addr1">우편번호</label> 
								<input type="text" id="zip" name="zip" placeholder="우편번호">
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						</div>
						<div class="inputArea">
									<label for="addr1">1차 주소</label> 
									<input type="text" id="addr1" name="addr1" placeholder="주소"><br>
						</div>
						<div class="inputArea">
									<label for="addr1">2차 주소</label> 
									<input type="text" id="addr2" name="addr2" placeholder="상세주소">
									</div>

						<div class="submit-button text-center">
							<button type="submit" class="order_btn btn hvr-hover">주문</button>
							<button type="button" class="cancel_btn btn hvr-hover">취소</button>
							<script>
								$(".cancel_btn").click(function() {
									$(".orderInfo").slideUp();
									$(".orderOpne_bnt").slideDown();
								});
							</script>
						</div>

					</form>
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