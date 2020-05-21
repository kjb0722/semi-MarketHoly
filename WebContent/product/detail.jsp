<%@page import="com.market.review.dto.ReviewDto"%>
<%@page import="com.market.review.dao.ReviewDao"%>
<%@page import="com.market.product.dao.ProductDao"%>
<%@page import="com.market.product.dto.ProductDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#wrap {width:1100px;}
.info {
	float: left;
	width:40%;
}

.container {
	clear: both
}

#total {
	float: right;
}

#img {
	float: left;

}

h1, h2, h3 {
	display: inline
}
#incart{

}
</style>
<div id="wrap">
	<div class="info" id="img">
		<img src="${pageContext.request.contextPath }/img/${dto.thumb_save}"
			width="300px" height="400px">
	</div>
	<div class="info">	
	&nbsp&nbsp&nbsp&nbsp
	</div>
	<div class="info">

		<h1>${dto.name}</h1>
		<h4 class='text-muted'>${dto.description}</h4>
		<h1>${dto.price}</h1>원
		<hr style="border: solid 1px purple;">
		<h4>
			구매수량&nbsp&nbsp
			<button type="button" class="btn btn-default" onclick="minus()">
				<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
			</button>
			<label id="EA">1</label>
			<button type="button" class="btn btn-default" onclick="plus()">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
			</button>
		</h4>
		<br> <input type="hidden" id="price" value="${dto.price }">
		<p class='text-muted' style = "font-size:0.9em;">
		판매단위 1팩 <br>
		중량 용량 200g <br>
		원산지 국산 <br>
		포장타입 냉장/종이포장 <br>
		유통기한 농산물로 별도 유통기한은 없으나 가급적 빨리 드시기 바랍니다. <br>
		안내사항 -상품특성상 3%내외의 중량차이가 발생할 수 있습니다. <br>
		</p>
		<hr style="border: solid 1px purple;">
		<div id="total">
			<label id="sum"><h3>총 상품금액 :</h3>
				<h1>${dto.price }</label>
			</h1>
			원<br> 
			<button type="button" class="btn-lg pull-right" id="incart" 
			style="background-color: purple;color:white" onclick="incart()">장바구니 담기</button>
		</div>

	</div>
</div>



<ul id="myTab" class="nav nav-tabs" role="tablist">
	<li><a href="#discript" data-toggle="tab">상품설명</a></li>
	<li><a href="#review" data-toggle="tab">상품후기</a></li>
	<li><a href="#qna" data-toggle="tab">상품문의</a></li>
</ul>


<div id="myTabContent" class="tab-content">
	<!-- 상품상세탭 -->
	<div class="tab-pane" id="discript">
		<img src="${pageContext.request.contextPath }/img/${dto.detail_save }">
	</div>

	<!-- 리뷰탭 -->
	<div class="tab-pane" id="review">
		<a href="${cp }/member/listReview.do?pnum=${dto.pnum }"> 리뷰글보기</a>
	</div>

	<!-- qna탭 -->
	<div class="tab-pane" id="qna">
		<a href="${cp }/qna/qnaList.do?pnum=${dto.pnum }"> 질문글보기</a>
	</div>
</div>


<section class="container">
	<c:choose>
		<c:when test="${param.tabpage == null}">
		</c:when>
		<c:otherwise>
			<jsp:include page="/${param.tabpage}"></jsp:include>
		</c:otherwise>
	</c:choose>
</section>

<script>
	function plus() {
		var EA = document.getElementById("EA");
		var price = document.getElementById("price").value;
		var sum = document.getElementById("sum");
		EA.innerHTML = parseInt(EA.innerHTML) + 1;
		sum.innerHTML = price * parseInt(EA.innerHTML);
	}
	function minus() {
		var EA = document.getElementById("EA");
		var price = document.getElementById("price").value;
		var sum = document.getElementById("sum");

		if (EA.innerHTML <= 1) {
			alert("최소수량입니다");
		} else {
			EA.innerHTML = parseInt(EA.innerHTML) - 1;
			sum.innerHTML = price * parseInt(EA.innerHTML);
		}
	}
	function incart() {
		var id = '${sessionScope.memberDto.id}';
		var pnum = $
		{
			param.pnum
		}
		;
		var EA = document.getElementById("EA");
		location = "${cp }/member/cartAdd.do?pnum=" + pnum + "&id=" + id
				+ "&EA=" + parseInt(EA.innerHTML);

	}
</script>
