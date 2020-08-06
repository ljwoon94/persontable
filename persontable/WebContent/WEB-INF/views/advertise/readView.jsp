<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	
</script>
<title>게시판</title>
</head>

<script>
	$(document).ready(function() {
		var formObj = $("form[name='form']");

		$(".update_btn").click(function() {
			formObj.attr("action", "/advertise/updateView");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$(".delete_btn").click(function() {
			var con = confirm("정말로 삭제하시겠습니까?");
			if (con) {
				formObj.attr("action", "/advertise/delete");
				formObj.attr("method", "post");
				formObj.submit();
			}
		});
	})
</script>


<body>
	<%@include file="../header.jsp"%>
	<div id="page-wrapper">
		<%@include file="../sidebar.jsp"%>
		<div class="container">
			<div class="all-title-box">
				<div class="row">
					<div class="col-lg-6">
						<div class="col-lg-5 col-sm-5">
							<h2>관리자-광고</h2>
						</div>
					</div>
				</div>
			</div>
			<%@include file="nav.jsp"%>
		</div>
		<div class="container">
			<form name="form" role="form">
				<input type="hidden" id="advertise_id" name="adNum"
					value="${advertise.adNum}" /> <input type="hidden" id="page"
					name="page" value="${scri.page}"> <input type="hidden"
					id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
				<input type="hidden" id="searchType" name="searchType"
					value="${scri.searchType}"> <input type="hidden"
					id="keyword" name="keyword" value="${scri.keyword}"> <input
					type="hidden" name="adNum" value="${advertise.adNum}" id="adNum" />

				<div class="row">
					<div class="col-xl-7 col-lg-7 col-md-8">
						<div id="carousel-example-1"
							class="single-product-slider carousel slide" data-ride="carousel">
							<div class="carousel-inner" role="listbox">
								<img class="d-block w-100" src="${advertise.adThumbImg}"
									class="thumbImg" />
							</div>
						</div>
					</div>

					<div class="single-product-details">
						<input type="hidden" name="n" value="${advertise.adNum}" />
						<h2>${advertise.adName}</h2>

						<h5>
							<fmt:formatNumber value="${advertise.regdate}"
								pattern="###,###,###" />
						</h5>
					</div>
					<div class="col-xl-12">
						<h4>
							<br>Description
						</h4>
						<p>${advertise.adDes}</p>
					</div>
					</div>

					<div class="submit-button text-center" style="margin-top: 200px;">
						<button type="button" class="update_btn btn hvr-hover">수정</button>
						<button type="button" class="delete_btn btn hvr-hover">삭제</button>
						<div class="clearfix"></div>
					</div>
			</form>
		</div>
		<%@include file="../footer.jsp"%>
	</div>
</body>
</html>