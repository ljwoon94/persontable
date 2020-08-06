<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="/ckeditor/ckeditor.js"></script>
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
			<div class="contact-box-main">
				<div class="container">
					<div class="row">
						<div class="col-lg-10 col-sm-12">
							<div class="contact-form-right">
									<form action="/ingredient/ingRegister" method="post"
										enctype="multipart/form-data">

										<div class="form-group">
											<label>카테고리</label> <select class="category1"
												name="ingCateCode"style="margin-left:15px; height:30px;">
												<option value="채소">채소</option>
												<option value="과일">과일</option>
												<option value="육류">육류</option>
												<option value="해산물">해산물</option>
												<option value="조미료">조미료</option>
												<option value="소스">소스</option>
												<option value="견과류">견과류</option>
												<option value="유제품">유제품</option>
												<option value="기타">기타</option>
											</select>
										</div>

										<div class="form-group">
											<label for="gdsName">상품명</label> <input type="text"
												id="ingName" name="ingName"
												style="margin-left: 30px; width: 500px;" />
										</div>

										<div class="form-group">
											<label for="gdsPrice">상품가격</label> <input type="text"
												id="ingPrice" name="ingPrice"
												style="margin-left: 15px; width: 500px;" />
										</div>

										<div class="form-group">
											<label for="gdsStock">상품수량</label> <input type="text"
												id="ingStock" name="ingStock"
												style="margin-left: 15px; width: 500px;" />
										</div>

										<div class="form-group">
											<label for="gdsStock">상품중량</label> <input type="text"
												id="ingWeight" style="margin-left: 15px; width: 500px;"
												name="ingWeight" />
										</div>
										<div class="form-group">
											<label for="ingDes">상품소개</label>
											<textarea id="indDes" id="gdsDes" name="ingDes"
												style="margin-left: 15px; width: 500px;"></textarea>
											<script>
												var ckeditor_config = {
													resize_enaleb : false,
													enterMode : CKEDITOR.ENTER_BR,
													shiftEnterMode : CKEDITOR.ENTER_P,
													filebrowserUploadUrl : "/ingredient/ckUpload"
												};

												CKEDITOR.replace("ingDes",
														ckeditor_config);
											</script>
										</div>
										<div class="form-group">
											<input type="file" id="ingImg" name="file" />
											<script>
												$("#ingImg")
														.change(
																function() {
																	if (this.files
																			&& this.files[0]) {
																		var reader = new FileReader;
																		reader.onload = function(
																				data) {
																			$(
																					".select_img img")
																					.attr(
																							"src",
																							data.target.result)
																					.width(
																							500);
																		}
																		reader
																				.readAsDataURL(this.files[0]);
																	}
																});
											</script>
											<%-- 	<%=request.getRealPath("/")%> --%>
										<div class="submit-button text-center">
											<button class = "btn hvr-hover" type="submit" >등록</button>
										</div>
										</div>

									</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			var regExp = /[^0-9]/gi;

			$("#ingPrice").keyup(function() {
				numCheck($(this));
			});
			$("#ingStock").keyup(function() {
				numCheck($(this));
			});

			function numCheck(selector) {
				var tempVal = selector.val();
				selector.val(tempVal.replace(regExp, ""));
			}
		</script>
		<%@include file="../footer.jsp"%>
	</div>

</body>
</html>