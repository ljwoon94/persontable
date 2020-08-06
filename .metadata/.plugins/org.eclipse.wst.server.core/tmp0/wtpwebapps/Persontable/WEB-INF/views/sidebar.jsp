<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.centerd {
	margin-right: auto;
	margin-left: auto;
}

#page-wrapper {
	padding-left: 250px;
}

#sidebar-wrapper {
	position: fixed;
	width: 250px;
	height: 100%;
	margin-left: -250px;
	background-color: #ffffff;
	overflow-x: hidden;
	overflow-y: auto;
}

#page-content-wrapper {
	width: 100%;
	padding: 20px;
}
/* 사이드바 스타일 */
.sidebar-nav {
	width: 250px;
	padding: 0;
	list-style: none;
}

.sidebar-nav li {
	text-indent: 1.5em;
	line-height: 2.8em;
}

.sidebar-nav li a {
	display: block;
	text-decoration: none;
	color: #000000;
}

.sidebar-nav li a:hover {
	color: #000000;
	background: rgb(255, 255, 100, 0.2);
}

.sidebar-nav>.sidebar-brand {
	font-size: 1.3em;
	line-height: 3em;
}
</style>
<div id="sidebar-wrapper">
	<c:if test="${member != null }">
		<ul class="sidebar-nav">
			<li><a href="/member/modifyForm">회원정보수정</a></li>
			<li><a href="/member/deleteForm">회원정보탈퇴</a></li>
			<li><a href="/cart/cartList">장바구니목록</a></li>
			
			<c:if test="${member.authority == 1}"> 
				<li><a href="/ingredient/admin_ing_list">식재료관리페이지</a></li>
			</c:if>
			<c:if test="${member.authority == 2}">
				<li><a href="/advertise/list">광고관리페이지</a></li>
			</c:if>
			<c:if test="${member.authority == 3}">
				<li><a href="/memberManage/list">회원정보관리페이지</a></li>
				<li><a href="/cart/adminOrderList">주문관리페이지</a></li>
			</c:if>
		</ul>
	</c:if>
</div>