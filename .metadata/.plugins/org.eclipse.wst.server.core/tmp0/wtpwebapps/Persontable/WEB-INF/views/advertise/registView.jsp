<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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
<script src="/ckeditor/ckeditor.js"></script>
<title>게시판</title>
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
				<form action="/advertise/regist" method="post"
					enctype="multipart/form-data">

					<div class="form-group">
						<label for="adName">광고명</label> <input type="text" id="adName"
							name="adName" style="margin-left: 30px; width: 500px;" />
					</div>

					<div class="form-group">
						<label for="adDes">광고소개</label>
						<textarea id="adDes" rows="5" cols="50" id="adDes" name="adDes"></textarea>
					</div>
					<script>
 var ckeditor_config = {
   resize_enaleb : false,
   enterMode : CKEDITOR.ENTER_BR,
   shiftEnterMode : CKEDITOR.ENTER_P,
   filebrowserUploadUrl : "/advertise/ckUpload"
 };
 
 CKEDITOR.replace("adDes", ckeditor_config);
</script>
					<div class="form-group">
						<input type="file" id="adImg" name="file" />
						<div class="select_img">
							<img src="" />
						</div>

						<script>
							$("#adImg")
									.change(
											function() {
												if (this.files && this.files[0]) {
													var reader = new FileReader;
													reader.onload = function(
															data) {
														$(".select_img img")
																.attr("src",data.target.result)
																.width(500);
													}
													reader
															.readAsDataURL(this.files[0]);
												}
											});
						</script>
						<%-- <%=request.getRealPath("/") %> --%>
					</div>
					<div class="submit-button text-center" style="margin-top:100px;">
						<button class="btn hvr-hover" type="submit" >등록</button>
						<button type="button" onclick="history.go(-1);" class="btn hvr-hover">취소</button>
					</div>

				</form>
			</div>
		</div>
		</div>
	</div>
		<%@include file="../footer.jsp"%>
		</div>

</body>
</html>