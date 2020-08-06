<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

<style>
section.replyForm {
	padding: 30px 0;
}

section.replyForm div.input_area {
	margin: 10px 0;
}

section.replyForm textarea {
	font-size: 16px;
	font-family: '맑은 고딕', verdana;
	padding: 10px;
	width: 500px;;
	height: 150px;
}

section.replyForm button {
	font-size: 20px;
	padding: 5px 10px;
	margin: 10px 0;
	background: #fff;
	border: 1px solid #ccc;
}

section.ingReplyList {
	padding: 30px 0;
}

section.ingReplyList ol {
	padding: 0;
	margin: 0;
}

section.ingReplyList ol li {
	padding: 10px 0;
	border-bottom: 2px solid #eee;
}

section.ingReplyList div.userInfo {
	
}

section.ingReplyList div.userInfo .userId {
	font-size: 24px;
	font-weight: bold;
}

section.ingReplyList div.userInfo .date {
	color: #999;
	display: inline-block;
	margin-left: 10px;
}

section.ingReplyList div.replyContent {
	padding: 10px;
	margin: 20px 0;
}

section.ingReplyList div.replyFooter button {
	font-size: 14px;
	border: 1px solid #999;
	background: none;
	margin-right: 10px;
}

div.replyModal {
	position: relative;
	z-index: 1;
	display: none;
}

div.modalBackground {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	z-index: -1;
}

div.modalContent {
	position: fixed;
	top: 20%;
	left: calc(50% - 250px);
	width: 500px;
	height: 250px;
	padding: 20px 10px;
	background: #fff;
	border: 2px solid #666;
}

div.modalContent textarea {
	font-size: 16px;
	font-family: '맑은 고딕', verdana;
	padding: 10px;
	width: 500px;
	height: 200px;
}

div.modalContent button {
	font-size: 20px;
	padding: 5px 10px;
	margin: 10px 0;
	background: #fff;
	border: 1px solid #ccc;
}

div.modalContent button.modal_cancel {
	margin-left: 20px;
}
</style>



<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script> 
function replyList(){
 var ingNum = ${sellIngView.ingNum};
 $.getJSON("/ingredient/ing_reply_List" + "?n=" + ingNum, function(data){
  var str = "";
  
  $(data).each(function(){
   
   console.log(data);
   
   var repDate = new Date(this.repDate);
   repDate = repDate.toLocaleDateString("ko-US")
   
   str += "<li data-repNum='" + this.repNum + "'>"
     + "<div class='userInfo'>"
     + "<span class='userId'>" + this.userId + "</span>"
     + "<span class='date'>" + repDate + "</span>"
     + "</div>"
     + "<div class='replyContent'>" + this.repCon + "</div>"
    
     + "<c:if test='${member != null}'>"
     
     + "<div class='replyFooter'>"
     + "<button type='button' class='modify' data-repNum='" + this.repNum + "'>수정</button>"
     + "<button type='button' class='delete' data-repNum='" + this.repNum + "'>삭제</button>"
     + "</div>"
     
     + "</c:if>"
     
     + "</li>";           
  });
  
  $("section.ingReplyList ol").html(str);
 });
}
</script>
<title>게시판</title>
</head>



<body>
	<%@include file="../header.jsp"%>
	<div class="container">
		<div class="all-title-box">
			<div class="row">
				<div class="col-lg-6">
					<div class="col-lg-7 col-sm-7">
						<h2>식재료판매페이지</h2>
					</div>
				</div>
			</div>
		</div>
	
		<section id="container">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="ingredient_id" name="ingNum"
					value="${ingredient.ingNum}" /> <input type="hidden" id="page"
					name="page" value="${scri.page}"> <input type="hidden"
					id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
				<input type="hidden" id="searchType" name="searchType"
					value="${scri.searchType}"> <input type="hidden"
					id="keyword" name="keyword" value="${scri.keyword}">
			</form>



			<form role="form" method="post">
				<input type="hidden" name="ingNum" value="${sellIngView.ingNum}"
					id="ingNum" />
			</form>








			<div class="row">
				<div class="col-xl-7 col-lg-7 col-md-8">
					<div id="carousel-example-1"
						class="single-product-slider carousel slide" data-ride="carousel">
						<div class="carousel-inner" role="listbox">
							<img class="d-block w-100" src="${sellIngView.ingImg}"
								class="thumbImg" />
						</div>
					</div>
				</div>

				<div class="single-product-details">
					<input type="hidden" name="n" value="${ingredient.ingNum}" />
					<h2>${sellIngView.ingCateCode}- ${sellIngView.ingName}</h2>




					<h5>
						<fmt:formatNumber value="${sellIngView.ingPrice}"
							pattern="###,###,###" />
						원
					</h5>
					<p class="available-stock">
						stock : <span> ${sellIngView.ingStock}개 <br>weight :
							${sellIngView.ingWeight}g/ml
						</span>
					<p>
						<c:if test="${sellIngView.ingStock !=0}">
		<p class="cartStock">
			<span>구입 수량</span>
			<button type="button" class="plus">+</button>
			<input type="number" class="numBox" min="1"
				max="${sellIngView.ingStock}" value="1" readonly="readonly" />
			<button type="button" class="minus">-</button>
			<script>
  $(".plus").click(function(){
   var num = $(".numBox").val();
   var plusNum = Number(num) + 1;
   
   if(plusNum >= ${sellIngView.ingStock}) {
    $(".numBox").val(num);
   } else {
    $(".numBox").val(plusNum);          
   }
  });
  
  $(".minus").click(function(){
   var num = $(".numBox").val();
   var minusNum = Number(num) - 1;
   
   if(minusNum <= 0) {
    $(".numBox").val(num);
   } else {
    $(".numBox").val(minusNum);          
   }
  });
 </script>
		<p class="addToCart">
			<button type="button" class="addCart_btn">카트에 담기</button>
			<%@include file="nav2.jsp"%>
			<script>
 $(".addCart_btn").click(function(){
  var ingNum = $("#ingNum").val();
  var cartStock = $(".numBox").val();
  var data = {
    ingNum : ingNum,
    cartStock : cartStock
    };
  
  $.ajax({
   url : "/cart/addCart",
   type : "post",
   data : data,
   success : function(result){
    
    if(result == 1) {
     alert("카트 담기 성공");
     $(".numBox").val("1");
    } else {
     alert("회원만 사용할 수 있습니다.")
     $(".numBox").val("1");
    }
   },
   error : function(){
    alert("카트 담기 실패");
   }
  });
 });
</script>
		</p>
	</c:if>
	<c:if test="${sellIngView.ingStock == 0}">
		<p>상품 수량이 부족합니다.</p>
	</c:if>
				</div>

			</div>
			<div class="col-xl-12">
				<h4>
					<br>Description
				</h4>
				<p>${sellIngView.ingDes}</p>
			</div>
				<script>
               var formObj = $("form[role='form']");

               $("#modify_Btn").click(function() {
                  formObj.attr("action", "/ingredient/ingModify");
                  formObj.attr("method", "get")
                  formObj.submit();
               });

               $("#delete_Btn").click(function() {

                  formObj.attr("action", "/ingredient/sell_ing_list");
                  formObj.submit();

               });
            </script>

	<div id="reply">

		<c:if test="${member == null }">
			<p>
				후기를 남기시려면 <a href="/member/loginForm">로그인</a>해주세요
			</p>
		</c:if>

		<c:if test="${member != null}">
			<section class="replyForm">
				<form role="form" method="post" autocomplete="off">

					<input type="hidden" name="ingNum" value="${sellIngView.ingNum}">

					<div class="input_area">
						<textarea name="repCon" id="repCon"></textarea>
					</div>

					<div class="input_area">
						<button type="button" id="reply_btn">후기 남기기</button>
					</div>
					<script>
 $("#reply_btn").click(function(){
  
  var formObj = $(".replyForm form[role='form']");
  var ingNum = $("#ingNum").val();
  var repCon = $("#repCon").val()
  
  var data = {
    ingNum : ingNum,
    repCon : repCon
    };
  
  $.ajax({
   url : "/ingredient/ing_reply_write",
   type : "post",
   data : data,
   success : function(){
    replyList();
    $("#repCon").val("");
   }
  });
 });
				</script>
				</form>
			</section>
		</c:if>
	</div>


	<section class="ingReplyList">
		<ol>
			<%-- <c:forEach items="${ingReplyList}" var="ingReplyList">

                     <li>
                        <div class="userInfo">
                           <span class="userId">${ingReplyList.userId}</span> <span
                              class="date"><fmt:formatDate
                                 value="${ingReplyList.repDate}" pattern="yyyy-MM-dd" /></span>
                        </div>
                        <div class="replyContent">${ingReplyList.repCon}</div>
                     </li>
                  </c:forEach> --%>
		</ol>
                  <script>replyList()</script>
		<script>
               $(document).on("click", ".modify", function(){
                  /*  $(".replyModal").attr("style", "display:block;"); */
                    $(".replyModal").fadeIn(200); 
                   
                   var repNum = $(this).attr("data-repNum");
                   var repCon = $(this).parent().parent().children(".replyContent").text();
                   
                   $(".modal_repCon").val(repCon);
                   $(".modal_modify_btn").attr("data-repNum", repNum);
                   
                  });
               
               
               </script>
		<script>
               
$(document).on("click", ".delete", function(){
  var deleteConfirm = confirm("정말로 삭제하시겠습니까?");
  
  if(deleteConfirm){
  var data = {repNum : $(this).attr("data-repNum")};
   
  $.ajax({
   url : "/ingredient/deleteIngReply",
   type : "post",
   data : data,
   success : function(result){
      
      if(result == 1) {
       replyList();
      } else {
       alert("작성자 본인만 할 수 있습니다.");     
      }
     },
     error : function(){
        alert("로그인하셔야합니다.")
       }
   
  });
  }
 });
 </script>

	</section>

	</div>


	<hr />



	<div class="replyModal">

		<div class="modalContent">

			<div>
				<textarea class="modal_repCon" name="modal_repCon"></textarea>
			</div>

			<div>
				<button type="button" class="modal_modify_btn">수정</button>
				<button type="button" class="modal_cancel">취소</button>
			</div>

		</div>

		<div class="modalBackground"></div>

	</div>
	<script>

$(".modal_modify_btn").click(function(){
    var modifyConfirm = confirm("정말로 수정하시겠습니까?");
    
    if(modifyConfirm) {
     var data = {
        repNum : $(this).attr("data-repNum"),
        repCon : $(".modal_repCon").val()
       };  // ReplyVO 형태로 데이터 생성
     
     $.ajax({
      url : "/ingredient/modifyIngReply",
      type : "post",
      data : data,
      success : function(result){
       
       if(result == 1) {
        replyList();
        $(".replyModal").fadeOut(200);
       } else {
        alert("작성자 본인만 할 수 있습니다.");       
       }
      },
      error : function(){
       alert("로그인하셔야합니다.")
      }
     });
    }
    
   });

$(".modal_cancel").click(function(){
   /* $(".replyModal").attr("style", "display:none;"); */
    $(".replyModal").fadeOut(200); 
   
});
</script>
	</div>


	<%@include file="../footer.jsp"%>

</body>
</html>