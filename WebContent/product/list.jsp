<%@page import="com.market.product.dto.ProductDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.market.product.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
 /*	
	String id=null;
	if(session.getAttribute("id")!=null){
		id=(String)session.getAttribute("id");
	}
	int pageNum=1;
	if(request.getParameter("pageNum")!=null){
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
	}
	int cnum=Integer.parseInt(request.getParameter("cnum"));
	int type=(Integer)session.getAttribute("type");
*/
	//둘중에 뭘로 받아와야하지ㅣ...?
	//대분류1만 넘어오면 type이1인애들도 모두 넘어와야함
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
<h5>${ cnum} 과일.견과.쌀 > ${ type} 수입과일</h5>
<form action="${pageContext.request.contextPath }/product/list.do"
		method="post">
		<select name="list_filter" size="1">
			<option value="new" <c:if test="${list_filter=='new' }">selected</c:if>>신상품순</option>
			<option value="best"<c:if test="${op=='best' }">selected</c:if>>인기상품순</option>
			<option value="lowprice"<c:if test="${op=='lowprice' }">selected</c:if>>낮은가격순</option>
			<option value="highprice"<c:if test="${op=='highprice' }">selected</c:if>>높은가격순</option>
		</select>
		 <input type="submit" value="검색">
	</form>	
<div class="container">
    <div class="row">
        <div class="col-sm-3">
        <ul class="gallery">
        <li>
        <a href="">
	        <img src="../img/img1.jpg" width="100">
	       
	        <li>포도</li>
	        <li>쌔그럽고 마싯는 포도</li>
	        <li>5,000</li>
	        </li>
	        <span>장바구니</span>
        </a>
        </div>
        <div class="col-sm-3">
        <img src="../img/img1.jpg" width="100">
        <ul>
        <li>포도</li>
        <li>쌔그럽고 마싯는 포도</li>
        <li>5,000</li>
        </ul>
        <span>장바구니</span>
        </div>
        <div class="col-sm-3"><src img="img/img1.jpg">
        <img src="../img/img1.jpg" width="100">
        <ul>
        <li>포도</li>
        <li>쌔그럽고 마싯는 포도</li>
        <li>5,000</li>
        </ul>
        <span>장바구니</span>
        </div>
    </div>
    <div class="row">
         <div class="col-sm-3">
        <img src="../img/img1.jpg" width="100">
        <ul>
        <li>포도</li>
        <li>쌔그럽고 마싯는 포도</li>
        <li>5,000</li>
        </ul>
        <span>장바구니</span>
        </div>
        <div class="col-sm-3">
        <img src="../img/img1.jpg" width="100">
        <ul>
        <li>포도</li>
        <li>쌔그럽고 마싯는 포도</li>
        <li>5,000</li>
        </ul>
        <span>장바구니</span>
        </div>
        <div class="col-sm-3"><src img="img/img1.jpg">
        <img src="../img/img1.jpg" width="100">
        <ul>
        <li>포도</li>
        <li>쌔그럽고 마싯는 포도</li>
        <li>5,000</li>
        </ul>
        <span>장바구니</span>
        </div>
    </div>
    
<!-- for문돌려서 상품리스트 가져오기 -->
</div>
		<%-- 
		<%	
			int startRow=1;
			int endRow=4;
			String filter="new";
			ProductDao dao=new ProductDao();
			ArrayList<ProductDto> list=dao.getList(startRow, endRow, filter);
			for(int i=0;i<list.size();i++){
		%>
			<tr>
				<td><%=list.get(i).getThumb_save() %></td>
				<td><%=list.get(i).getName()%></td>
				<td><%=list.get(i).getPrice()%></td>
				<td><%=list.get(i).getDescription() %>></td>
			</tr>
		<%
			}
		%>
		
		 -->
		<%--
		<c:forEach var="pro" items="${requestScope.list }">
			<tr>
				<td>${pro.thumb_save}</td>
				<td><input type="button" id="incart" value="담기(아이콘)">
				<td>${pro.name}</td>
				<td>${pro.price }</td>
				<td>${pro.description }</td>
				<c:set var="cp" value="${pageContext.request.contextPath }" />
				<td><a href="${cp }/product/detail.do?pnum=${vo.pnum}">${vo.name }</a></td>
			</tr>
		</c:forEach>
		 --%>
</div>
	 	
	</div>
	<!-- 페이징 -->
	<div>
		<c:if test="${startPageNum>5}">
			<a href="${cp }/product/list.do?pageNum=${startPageNum-1}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			<c:choose>
				<c:when test="${i==pageNum }">
					<a href="${cp }/product/list.do?pageNum=${i}&field=${field}&keyword=${keyword}"> <span
						style='color: lightsalmon'>[${i}]</span></a>
				</c:when>
				<c:otherwise>
					<a href="${cp }/product/list.do?pageNum=${i}&field=${field}&keyword=${keyword}"> <span
						style='color: gray'>[${i}]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pageCount>endPageNum}">
			<a href="${cp }/product/list.do?pageNum=${endPageNum+1}">[다음]</a>
		</c:if>
	</div>

</body>
</html>