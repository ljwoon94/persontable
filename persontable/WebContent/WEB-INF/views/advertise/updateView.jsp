<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
<script src="/ckeditor/ckeditor.js"></script>

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
						<h2>관리자-광고</h2>
						</div>
					</div>
				</div>
			</div>
		<%@include file="nav.jsp"%>
		</div>
			<div class="contact-box-main">
				<div class="container">
					<div class="row">
						<div class="col-lg-10 col-sm-12">
		<section id="container">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="advertise_id" name="adNum"
					value="${advertise.adNum}" /> <input type="hidden" id="page"
					name="page" value="${scri.page}"> <input type="hidden"
					id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
				<input type="hidden" id="searchType" name="searchType"
					value="${scri.searchType}"> <input type="hidden"
					id="keyword" name="keyword" value="${scri.keyword}">
			</form>

			<form role="form" method="post" autocomplete="off"
				enctype="multipart/form-data">

				<input type="hidden" name="adNum" value="${advertise.adNum}" />


				<div class="form-group">
					<label for="adName">광고명</label> <input type="text" id="adName"
						name="adName" value="${advertise.adName}"  style="margin-left: 30px; width: 500px;" />
				</div>
				<div class="form-group">
					<label for="adDes">광고소개</label>
					<textarea id = "adDes" rows="5" cols="50" id="adDes" name="adDes">${advertise.adDes}</textarea>
				</div>
				<script>
								var ckeditor_config = {
									resize_enaleb : false,
									enterMode : CKEDITOR.ENTER_BR,
									shiftEnterMode : CKEDITOR.ENTER_P,
								};

								CKEDITOR.replace("adDes", ckeditor_config);
							</script>
				<div class="form-group">
					<input type="file" id="adImg" name="file" />
					<div class="select_img">
						<img src="${advertise.adImg}" /> <input type="hidden"
							name="adImg" value="${advertise.adImg}" /> <input type="hidden"
							name="adThumbImg" value="${advertise.adThumbImg}" />
					</div>

					<script>
						$("#adImg").change(
								function() {
									if (this.files && this.files[0]) {
										var reader = new FileReader;
										reader.onload = function(data) {
											$(".select_img img").attr("src",
													data.target.result).width(
													500);
										}
										reader.readAsDataURL(this.files[0]);
									}
								});
					</script>
					<%-- <%=request.getRealPath("/")%> --%>
				</div>
				<div class="submit-button text-center" style="margin-top:200px;">
					<button type="submit" id="update_Btn" class="btn hvr-hover">저장</button>
					<button type="submit" id="back_Btn" class="btn hvr-hover">취소</button>
					<script>
						var formObj = $("form[role='form']");

						$("#update_Btn").click(function() {
							formObj.attr("action", "/advertise/update");
							formObj.attr("method", "post")
							formObj.submit();
						});
						
					</script>
				</div>
			</form>
		</section>
		</div>
		</div>
		</div></div>
	<%@include file="../footer.jsp"%>
	</div>


</body>
</html>