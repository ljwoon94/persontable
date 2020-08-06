<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<header class="main-header">
	<!-- Start Navigation -->
	<nav
		class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
		<div class="container">
			<!-- Start Header Navigation -->
			<div class="navbar-header">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbar-menu" aria-controls="navbars-rs-food"
					aria-expanded="false" aria-label="Toggle navigation">
					<i class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand" href="/"><img src="/images/logo.png"
					class="logo" alt=""></a>
			</div>
			<!-- End Header Navigation -->

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navbar-menu">
				<ul class="nav navbar-nav ml-auto" data-in="fadeInDown"
					data-out="fadeOutUp">

					<li class="nav-item"><a class="nav-link" href="/board/list">게시판</a></li>
					
					<li class="nav-item"><a class="nav-link" href="/notice/list">공지사항</a></li>

					<li class="nav-item"><a class="nav-link" href="">레시피</a></li>
					<li class="nav-item"><a class="nav-link" href="/ingredient/sell_ing_list">식재료</a></li>
					<c:if test="${member == null}">
						<li class="nav-item"><a class="nav-link" href="/member/loginForm">로그인</a></li>
					</c:if>
					<c:if test="${member != null }">
						<li class="nav-item"><a class="nav-link" href="/member/logout">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" href="/cart/orderList">마이페이지</a></li>

						<li class="nav-item"><a class="nav-link" href="/cart/cartList">	<i class="fa fa-shopping-bag"></i>장바구니</a></li>
						<div class="submit-button text-right"><button class="write_btn btn hvr-hover">${member.userId }님환영합니다.</button></div>
					</c:if>
				</ul>
				<form action="#">
					<input class="form-control" placeholder="Search here..."
						type="text">

				</form>
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</div>
		</div>
	</nav>
	<!-- End Navigation -->
</header>
