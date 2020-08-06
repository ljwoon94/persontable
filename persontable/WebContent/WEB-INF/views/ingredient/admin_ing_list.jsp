<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
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
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script>
	$(function() {
		$('#searchBtn').click(
				function() {
					self.location = "admin_ing_list" + '${pageMaker.makeQuery(1)}'
							+ "&searchType="
							+ $("select option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val());
				});
	});
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
				<h2>관리자-식재료</h2>
		</div>
		</div>
		</div>
		</div>
				<%@include file="nav.jsp"%>
			<section id="container">
				<form role="form" method="get">
					<div class="table-main table-responsive">
						<table class="table">
						<thead>
							<tr>
								<th>상품이미지</th>
								<th>식재료명</th>
								<th>카테고리</th>
								<th>가격</th>
								<th>수량</th>
								<th>등록일</th>
							</tr>
						</thead>

						<c:forEach items="${ingList}" var="ingList">
							<tr>
								<td><img src="${ingList.ingThumbImg}" style="width:100px; height:100px;"></td>
								<td><a
									href="/ingredient/admin_ing_view?n=${ingList.ingNum}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out
											value="${ingList.ingName}" /></a></td>
								<td>
									<!-- ${list.cateCode} --> ${ingList.ingCateCode}
								</td>
								<td><c:out value="${ingList.ingPrice}" /></td>
								<td><c:out value="${ingList.ingStock}" /></td>
								<td><fmt:formatDate value="${ingList.regDate}"
										pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>

					</table>
					</div>
					<div class="col-md-offset-3" style="margin-left: 400px;">
						<ul class="pagination ">
							<c:if test="${pageMaker.prev}">
								<li><a
									href="admin_ing_list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
									<a href="admin_ing_list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="admin_ing_list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if>
						</ul>
					</div>
					
					<div class="search row">
						<div class="col-xs-2 col-sm-2">
							<select name="searchType" class="form-control">
								<option value="n"
									<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
								<option value="t"
									<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>식재료명</option>
							</select>
						</div>

						<div class="col-xs-8 col-sm-8">
							<div class="input-group">
								<input type="text" name="keyword" id="keywordInput"
									value="${scri.keyword}" class="form-control" /> <span
									class="input-group-btn">
									<button id="searchBtn" type="button" class="btn btn-default">검색</button>
								</span>
							</div>
						</div>


					</div>
					
				</form>
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