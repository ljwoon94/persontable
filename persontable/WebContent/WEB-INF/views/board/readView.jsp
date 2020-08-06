<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<head>

<title>게시판</title>

</head>
<style>
section.replyForm {
	padding: 30px 0;
}

section.replyForm textarea {
	font-size: 15px;
	font-family: '맑은 고딕', verdana;
	padding: 10px;
	width: 880px;;
}

section.replyList {
	padding: 30px 0;
}

section.replyList ol {
	padding: 0;
	margin: 0;
}

section.replyList ol li {
	padding: 10px 0;
	border-bottom: 2px solid #eee;
}

section.replyList div.userInfo {
	
}

section.replyList div.userInfo .content {
	font-size: 24px;
	font-weight: bold;
}

section.replyList div.userInfo .date {
	color: #999;
	display: inline-block;
	margin-left: 10px;
}

section.replyList div.replyContent {
	padding: 10px;
	margin: 20px 0;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
						var formObj = $("form[name='readForm']");
						// 수정 
						$(".update_btn").on("click", function() {
							formObj.attr("action", "/board/updateView");
							formObj.attr("method", "get");
							formObj.submit();
						})

						// 삭제
						$(".delete_btn").on("click", function() {

							var deleteYN = confirm("삭제하시겠습니까?");
							if (deleteYN == true) {

								formObj.attr("action", "/board/delete");
								formObj.attr("method", "post");
								formObj.submit();

							}
						})

						// 목록
						$(".list_btn")
								.on(
										"click",
										function() {

											location.href = "/board/list?page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
										})

						$(".replyWriteBtn").on("click", function() {
							var formObj = $("form[name='replyForm']");
							formObj.attr("action", "/board/replyWrite");
							formObj.submit();
						});

						//댓글 수정 View
						$(".replyUpdateBtn").on("click",function() {
											location.href = "/board/replyUpdateView?bno=${read.bno}"
													+ "&page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}"
													+ "&keyword=${scri.keyword}"
													+ "&rno="
													+ $(this).attr("data-rno");
										});

						//댓글 삭제 View
						$(".replyDeleteBtn")
								.on(
										"click",
										function() {
											location.href = "/board/replyDeleteView?bno=${read.bno}"
													+ "&page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}"
													+ "&keyword=${scri.keyword}"
													+ "&rno="
													+ $(this).attr("data-rno");
										});
					})
</script>

<body>
	<%@include file="../header.jsp"%>
		<div class="container">
			<div class="all-title-box">
		<div class="row">
			<div class="col-lg-6">
			<div class="col-lg-3 col-sm-3">
				<h2>게시판</h2>
		</div>
		</div>
		</div>
		</div>
			<div class="col-lg-10 col-sm-12">
				<%@include file="nav.jsp"%>
				<section id="container">
					<form name="readForm" role="form" method="post">
						<input type="hidden" id="bno" name="bno" value="${read.bno}" /> <input
							type="hidden" id="page" name="page" value="${scri.page}">
						<input type="hidden" id="perPageNum" name="perPageNum"
							value="${scri.perPageNum}"> <input type="hidden"
							id="searchType" name="searchType" value="${scri.searchType}">
						<input type="hidden" id="keyword" name="keyword"
							value="${scri.keyword}">
					</form>
					<div class="form-group">
						<div class="col-lg-12 col-sm-12">
						<div class="row">
							<h2>${read.title}</h2>
							<div style="margin-left:800px"><fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" /></div>
						</div>
							<h4>작성자  -  ${read.writer}</h4>
						</div>
					</div>
					<div class="form-group" style="height: 500px; border: 1px solid;">
						<p> <c:out value="${read.content}" /> </p>
					</div>
					<div class="form-group">
							<img src="${read.bThumbImg}" class="thumbImg" />
						</div>
					<c:if test="${member.userId==read.writer || member.authority == 3}">
						<div class="submit-button text-center" style="margin-top:100px;">
							<button type="button" class="update_btn btn hvr-hover">수정</button>
							<button type="button" class="delete_btn  btn hvr-hover">삭제</button>
							<div class="clearfix"></div>
						</div>
					</c:if>




					<!-- 댓글 -->
					<div class="col-lg-12 col-sm-12" style="margin-top:100px;">
					<div id="reply">
						<input type="hidden" id="bno" name="bno" value="${read.bno}" /> <input
							type="hidden" id="page" name="page" value="${scri.page}">
						<input type="hidden" id="perPageNum" name="perPageNum"
							value="${scri.perPageNum}"> <input type="hidden"
							id="searchType" name="searchType" value="${scri.searchType}">
						<input type="hidden" id="keyword" name="keyword"
							value="${scri.keyword}">

						<c:if test="${member == null }">
							<p>
								댓글을 남기시려면 <a href="/member/loginForm">로그인</a>해주세요
							</p>
						</c:if>

						<c:if test="${member != null}">
							<section class="replyForm">
								<form name="replyForm" method="post" class="form-horizontal"
									autocomplete="off">
									<input type="hidden" name="bno" value ="${read.bno }">
									<div class="input_area">
										<textarea name="content" id="content"></textarea>
									</div>
								<div class="submit-button text-center">
										<button type="button" class="replyWriteBtn btn hvr-hover">댓글작성</button>
									</div>

								</form>
							</section>
						</c:if>
						<section class="replyList">
							<ol>
								<c:forEach items="${replyList}" var="replyList">
									<div style = "border: 1px solid;">
										<div class="userInfo" >
											<span class="userId"style = "margin-left:10px;">${replyList.writer}</span> 
											<span class="date"><fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" /></span>
								<c:if test="${member.userId==read.writer}">
											<button type="button" class="replyUpdateBtn btn hvr-hover" data-rno="${replyList.rno }">수정</button>
											<button type="button" class="replyDeleteBtn btn hvr-hover" data-rno="${replyList.rno }">삭제</button>
								</c:if>
										</div>
										<div class="replyContent">${replyList.content}</div>
									
									</div>
								</c:forEach>
							</ol>
						</section>
					</div>
					</div>
				</section>
			</div>
			<hr />
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
