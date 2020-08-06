<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
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
				<%@include file="nav.jsp"%>
			<div class="col-lg-10 col-sm-12">
			<div class="container">
				<section id="container">
					<form name="readForm" role="form" method="post">
						<input type="hidden" id="ingredient_id" name="ingNum"
							value="${ingredient.ingNum}" /> <input type="hidden" id="page"
							name="page" value="${scri.page}"> <input type="hidden"
							id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
						<input type="hidden" id="searchType" name="searchType"
							value="${scri.searchType}"> <input type="hidden"
							id="keyword" name="keyword" value="${scri.keyword}">
					</form>

					<form role="form" method="post" autocomplete="off">

			
				<div class="row">
                <div class="col-xl-7 col-lg-7 col-md-8">
                    <div id="carousel-example-1" class="single-product-slider carousel slide" data-ride="carousel">
                        <div class="carousel-inner" role="listbox">
                            <img class="d-block w-100"  src="${ingredient.ingThumbImg}" class="thumbImg" />
                        </div>
                    </div>
                </div>

                    <div class="single-product-details">
                    <input type="hidden" name="n" value="${ingredient.ingNum}" />
                        <h2>${ingredient.ingCateCode}-${ingredient.ingName}</h2>
                        
                        <h5><fmt:formatNumber
									value="${ingredient.ingPrice}" pattern="###,###,###" />원</h5>
                        <p class="available-stock">stock : <span> ${ingredient.ingStock}개 <br>weight : ${ingredient.ingWeight}g/ml</span><p>

                    </div>
                    
                </div>

               <div class="col-xl-12">
                <h4><br>Description</h4>
						<p>${ingredient.ingDes}</p>
				</div>
                </div>

						
						<div class="submit-button text-center" style="margint-top:100px">
							<button type="button" id="modify_Btn" class="btn hvr-hover">수정</button>
							<button type="button" id="delete_Btn" class="btn hvr-hover">삭제</button>
						</div>

							<script>
								var formObj = $("form[role='form']");

								$("#modify_Btn").click(
										function() {
											formObj.attr("action",
													"/ingredient/ingModify");
											formObj.attr("method", "get")
											formObj.submit();
										});

								$("#delete_Btn").click(
										function() {

											var con = confirm("정말로 삭제하시겠습니까?");

											if (con) {
												formObj.attr("action",
														"/ingredient/delete");
												formObj.submit();
											}
										});
							</script>
					</form>
				</section>
			</div>
			</div>
		<%@include file="../footer.jsp"%>
		</div>



</body>
</html>