<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
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
<script src="/ckeditor/ckeditor.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(
			function() {
				var formObj = $("form[name='updateForm']");

				$(".cancel_btn").on(
						"click",
						function() {
							event.preventDefault();
							location.href = "/notice/readView?nno=${update.nno}"
									+ "&page=${scri.page}"
									+ "&perPageNum=${scri.perPageNum}"
									+ "&searchType=${scri.searchType}"
									+ "&keyword=${scri.keyword}";
						})

				$(".update_btn").on("click", function() {
					if (fn_valiChk()) {
						return false;
					}
					formObj.attr("action", "/notice/update");
					formObj.attr("method", "post");
					formObj.submit();
				})
			})

	function fn_valiChk() {
		var updateForm = $("form[name='updateForm'] .chk").length;
		for (var i = 0; i < updateForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
</script>
<body>
	<%@include file="../header.jsp"%>
		<div class="container">
				<div class="all-title-box">
		<div class="row">
			<div class="col-lg-6">
			<div class="col-lg-4 col-sm-4">
				<h2>공지사항</h2>
				
		</div>
		</div>
		</div>
		</div>
			<hr />
		<div class="col-lg-10 col-sm-12">
		<c:if test="${member.authority == 3}">
			<%@include file="nav.jsp"%>
			</c:if>
				<section id="container">
					<form name="updateForm" role="form" method="post"
						action="/notice/update">
						<input type="hidden" name="nno" value="${update.nno}"
							readonly="readonly" />
						<div class="form-group">
							<label for="title" class="col-sm-2 control-label">제목</label> <input
								type="text" id="title" name="title" class=" chk form-control"
								value="${update.title}" title="제목을 입력하세요" />
						</div>
						<div class="form-group">
							<label for="content" class="col-sm-2 control-label">내용</label>
							<textarea id="content" name="content" class="form-control"
								style="height: 500px;">
					<c:out value="${update.content}" /></textarea>
					<script>
								var ckeditor_config = {
									resize_enaleb : false,
									enterMode : CKEDITOR.ENTER_BR,
									shiftEnterMode : CKEDITOR.ENTER_P,
								};

								CKEDITOR.replace("content", ckeditor_config);
							</script>
						</div>
						<div class="form-group">
							<label for="regdate" class="col-sm-2 control-label">작성날짜</label>
							<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd" />
						</div>
						<div class="submit-button text-center">
							<button type="submit" class="update_btn btn hvr-hover">저장</button>
							<button type="submit" class="cancel_btn btn hvr-hover">취소</button>
						</div>
					</form>
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