<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//list.jsp로 넘어올때 카테고리 넘버 받아오기
	//int cnum=Integer.parseInt();
	//int type=Integer.parseInt();
	//getlist함수에 넣어주기
	//로그인한 아이디도 세션에있는거 가져오기(로그인 안되어있을때 장바구니에 담으면....?)
	//재고수량 0인 상품 품절 표시
	//장바구니 버튼 누르면 cart.do로 이동해서 pnum,수량,세션에 있는 아이디 넘겨주기(로그인 안되어있으면 login.do로)
%>
<script>
	function getList() {
		
	}
	
	function result(){
		
	}
</script>
<h1>상품목록</h1>
<h3>카테고리 타입</h3>
<h3>카테고리 번호</h3>
<select name="list_filter">
	<option value="신상품순">신상품순1</option>
	<option value="인기상품순">인기상품순</option>
	<option value="낮은가격순">낮은가격순</option>
	<option value="높은가격순">높은가격순</option>
</select>
<div class="container">
	<div class="row">
		<div class="col-md-4">
		
		<!-- for문돌려서 상품리스트 가져오기 -->
		<c:forEach var="dto" items="${requestScope.list }">
			<tr>
				<td>${dto.thumb_save}</td>
				<td><input type="button" id="incart" value="담기(아이콘)">
				<td>${dto.name}</td>
				<td>${dto.price }</td>
				<td>${dto.description }</td>
				<c:set var="cp" value="${pageContext.request.contextPath }" />
				<td><a href="${cp }/board/view.do?num=${vo.num}">${vo.title }</a></td>
			</tr>
		</c:forEach>
		</div>
	 	
	</div>
	<!-- 페이징 -->
	<div>
		<c:if test="${startPageNum>4}">
			<a href="${cp }/board/list.do?pageNum=${startPageNum-1}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			<c:choose>
				<c:when test="${i==pageNum }">
					<a href="${cp }/board/list.do?pageNum=${i}&filed=${field}&keyword=${keyword}"> <span
						style='color: lightsalmon'>[${i}]</span></a>
				</c:when>
				<c:otherwise>
					<a href="${cp }/board/list.do?pageNum=${i}&filed=${field}&keyword=${keyword}"> <span
						style='color: gray'>[${i}]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pageCount>endPageNum}">
			<a href="${cp }/board/list.do?pageNum=${endPageNum+1}">[다음]</a>
		</c:if>
	</div>
</div>
				
</body>
</html>