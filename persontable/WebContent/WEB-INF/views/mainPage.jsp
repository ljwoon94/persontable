<%@page import="spring.web.vo.AdvertiseVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
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
<link rel="shortcut icon" href="./../images/favicon.ico"
   type="image/x-icon">
<link rel="apple-touch-icon" href="./../images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="./../css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="./../css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="./../css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="./../css/custom.css">

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
   <%@include file="header.jsp"%>
   <!-- Start Products  -->
   <div class="products-box">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="title-all text-center">
                  <h1>과일 & 식재료</h1>
                  <p></p>
               </div>
            </div>
         </div>

         <div class="row special-list">
            <c:forEach items="${sellIngList}" var="sellIngList" begin="0"
               end="3">
               <div class="col-lg-3 col-md-6 special-grid fruits">
                  <div class="products-single fix">

                     <div class="box-img-hover">

                        <a href="/ingredient/sellIngView?n=${sellIngList.ingNum }"><img
                           src="${sellIngList.ingThumbImg }" class="img-fluid" alt="Image"  style="width:150px; height:200px;"></a>

                     </div>
                     <div class="why-text">
                        <a href="/ingredient/sellIngView?n=${sellIngList.ingNum }">${sellIngList.ingName }</a>

                        <h5>${sellIngList.ingPrice }원</h5>
                     </div>
                  </div>
               </div>
            </c:forEach>


         </div>
      </div>
   </div>
   <!-- End Products  -->


   <div id="slides-shop" class="cover-slides col-sm-12 col md-12">
      <ul class="slides-container">
         <c:forEach items="${adList}" var="adList" begin="0" end="2">

           <img src="${adList.adImg }" alt="" style="width:1000px; height:500px;">
         </c:forEach>
         </ul>
         <div class="slides-navigation">
            <a href="#" class="next"><i class="fa fa-angle-right"
               aria-hidden="true"></i></a> <a href="#" class="prev"><i
               class="fa fa-angle-left" aria-hidden="true"></i></a>
         </div>
   

   </div>








   <!-- Start Products  -->
   <div class="products-box">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="title-all text-center">
                  <h1>레시피</h1>
                  <p></p>
               </div>
            </div>
         </div>


         <div class="row special-list">
            <div class="col-lg-3 col-md-6 special-grid best-seller">
               <div class="products-single fix">
                  <div class="box-img-hover">
                     <div class="type-lb"></div>
                     <img src="images/img-pro-01.jpg" class="img-fluid" alt="Image">
                     <div class="mask-icon">

                        <a class="cart" href="#">Add to Cart</a>
                     </div>
                  </div>
                  <div class="why-text">
                     <h4>당근</h4>
                     <h5>2000원</h5>
                  </div>
               </div>
            </div>

            <div class="col-lg-3 col-md-6 special-grid top-featured">
               <div class="products-single fix">
                  <div class="box-img-hover">
                     <div class="type-lb"></div>
                     <img src="images/img-pro-02.jpg" class="img-fluid" alt="Image">
                     <div class="mask-icon">

                        <a class="cart" href="#">Add to Cart</a>
                     </div>
                  </div>
                  <div class="why-text">
                     <h4>토마토</h4>
                     <h5>3000원</h5>
                  </div>
               </div>
            </div>

            <div class="col-lg-3 col-md-6 special-grid top-featured">
               <div class="products-single fix">
                  <div class="box-img-hover">
                     <div class="type-lb"></div>
                     <img src="images/img-pro-03.jpg" class="img-fluid" alt="Image">
                     <div class="mask-icon">

                        <a class="cart" href="#">Add to Cart</a>
                     </div>
                  </div>
                  <div class="why-text">
                     <h4>청포도</h4>
                     <h5>3500원</h5>
                  </div>
               </div>
            </div>

            <div class="col-lg-3 col-md-6 special-grid best-seller">
               <div class="products-single fix">
                  <div class="box-img-hover">
                     <div class="type-lb"></div>
                     <img src="images/img-pro-03.jpg" class="img-fluid" alt="Image">
                     <div class="mask-icon">

                        <a class="cart" href="#">Add to Cart</a>
                     </div>
                  </div>
                  <div class="why-text">
                     <h4>청포도</h4>
                     <h5>1000원</h5>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- End Products  -->


   <%@include file="footer.jsp"%>


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