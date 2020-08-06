<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>Freshshop - Ecommerce Bootstrap 4 HTML Template</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

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

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->



<head>
   <script src="//code.jquery.com/jquery.min.js"></script>
   <script
      src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>


<script type="text/javascript">
      $(document).ready(function(){
         var formObj = $("form[name='loginForm']");
         
         $(".regist_btn").on("click", function(){
            formObj.attr("action", "/member/registForm");
            formObj.attr("method", "get");
            formObj.submit();            
         });
     
         $(".login_btn").on("click", function(){
            formObj.attr("action", "/member/login");
            formObj.attr("method", "post");
            formObj.submit();            
         });
         
         $(".find_pw_btn").on("click", function(){
            formObj.attr("action", "/member/find_pw_form");
            formObj.attr("method", "get");
            formObj.submit();            
         });
         $(".find_id_btn").on("click", function(){
            formObj.attr("action", "/member/find_id_form");
            formObj.attr("method", "get");
            formObj.submit();            
         });
      })
</script>
</head>
<body>
	<%@include file="../header.jsp" %>
	<div id="page-wrapper">
	<%@include file="../sidebar.jsp" %>
      <div class="contact-box-main">

         <div class="container">

            <div class="row">
               <div class="col-lg-8 col-sm-12">
                  <div class="contact-form-right">
               <h2>로그인</h2>
                  <section id="loginFormArea">
                     <form name="loginForm" method="post">
                        <div class="row">
                           <div class="col-md-12">
                              아이디
                              <div class="form-group">
                                 <input type="text" class="form-control" id="userId" name="userId"
                                    placeholder="userID" />
                                 <div class="help-block with-errors"></div>
                              </div>
                           </div>
                           
                           <div class="col-md-12">
                              비밀번호
                              <div class="form-group">
                                 <input type="password" class="form-control" id="userPasswd"
                                    name="userPasswd" placeholder="password">
                                 <div class="help-block with-errors"></div>
                              </div>
                           </div>
                        </div>

                        <div class="submit-button text-center">
                           <button class="login_btn btn hvr-hover" id="submit" type="submit"
                              style="margin-right: 10px; width: 450px">로그인</button>
                        </div>
                     <div class="submit-button text-center" style="margin-top: 50px">
                        <button class="find_id_btn btn hvr-hover" type="submit"
                           style="margin-right: 10px">아이디찾기</button>
                        <button class="find_pw_btn btn hvr-hover" type="submit"
                           style="margin-left: 10px; margin-right: 10px">비밀번호찾기</button>
                     <button class="regist_btn btn hvr-hover" id="submit" type="submit"
                              style="margin-left: 10px">회원가입</button>
                        </div>
                        <c:if test="${msg == false }">
                           <p style="color:#f00;">로그인 실패</p>
                        </c:if>   
                     </form>
                        
                        <div id="msgSubmit" class="h3 text-center hidden"></div>
                        <div class="clearfix"></div>

                  </section>
                     </div>
               </div>
            </div>
         </div>
   </div>

			<%@include file="../footer.jsp" %>
</div>


      <a href="#" id="back-to-top" title="Back to top"
         style="display: none;">&uarr;</a>

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