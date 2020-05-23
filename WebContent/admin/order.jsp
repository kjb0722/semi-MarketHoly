<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
table, th, td {
	text-align: center;
}

input[type=checkbox] {
	zoom: 1.5;
}

.hidden{
	display: none;
}
</style>
<div class="container">
	<div class="row">
		<h3>주문 관리</h3>
	</div>
	<div class="row">
		<div class="col-md-5 form-inline">
			<span class="label label-success">주문 상태 변경</span>
			<select class="form-control" id="cboStatus">
				<c:forEach var="dto" items="${statList }">
					<option value="${dto.val }">${dto.name }</option>
				</c:forEach>
			</select>
			<input type="button" class="btn btn-lg btn-primary" value="변경" id="btnUpdate">
		</div>
		<div class="col-md-6 form-inline">
			<span class="label label-success">검색 종류</span>
			<select class="form-control" id="kind">
				<c:forEach var="dto" items="${comList }">
					<option value="${dto.val }">${dto.name }</option>
				</c:forEach>
			</select>
			<input type="text" class="form-control" placeholder="검색어를 입력하세요" maxlength="30" id="txtWord">
			<input type="button" class="btn btn-lg btn-primary" value="검색" id="btnSearch">
		</div>
		<div class="col-md-1 form-inline">
			<select class="form-control pull-right" id="cboSrhStatus">
				<c:forEach var="dto" items="${statusList }">
					<option value="${dto.val }">${dto.name }</option>
				</c:forEach>
			</select>
		</div>
	</div>
	<div class="row">
		<table class="table table-bordered" id="order-table">
			<thead>
				<tr>
					<th style="width: 5%;">
						<input type="checkbox" id="chkAll">
					</th>
					<th style="width: 5%;">번호</th>
					<th style="width: 10%;">주문자</th>
					<th style="width: 10%;">상태</th>
					<th style="width: 30%;">주문 상품</th>
					<th style="width: 8%;">결제</th>
					<th style="width: 10%;">가격</th>
					<th class="hidden">주소</th>
					<th style="width: 10%;">결제 방법</th>
					<th class="hidden">사용 포인트</th>
					<th style="width: 12%;">등록 날짜</th>
				</tr>
			</thead>
			<tbody>

			</tbody>
		</table>
	</div>
</div>

<script>
	$(document).ready(function() {
		orderListLoad($("#kind").val(), "", 1, $("#cboStatus").val());
	});
	
	//주문 상태 변경//
	$("#btnUpdate").click(function() {
		orderUpdate();
	});
	
	function orderUpdate(){
		let status = $("#cboStatus").val();
		let onums = [];
		/* $("#order-table>tbody>tr>td>input[type='checkbox']:checked").each(function(i, element) {
			onums.push($("#order-table>tbody>tr>td").eq(1).text());
		}); */
		$("#order-table>tbody>tr").each(function(i, element) {
			if($(this).eq(0).find("input[type='checkbox']").prop("checked") == true){
				onums.push($(this).find("td").eq(1).text());
			}
		});

		if(onums.length > 0){
			jQuery.ajax({
				dataType:"JSON",
				url:`${cp}/admin/ordStatUpdate.do`,
				method:"post",
				data:{status:status,
					onums:onums},
				success:function(data){
					if(data.n>0){
						alert(data.n+"건 수정 완료");
						$("#btnSearch").click();
					}else{
						//location = `${cp}/error.do`;
					}
				}
			});			
		}else{
			alert("주문 상태를 변경하실 주문 내역을 선택하세요.");
			return;
		}
	}
	//주문 상태 변경//
	
	//테이블 전체 체크박스 이벤트//
	$("#chkAll").click(function() {
		let check = $(this).prop("checked");
		$("#order-table>tbody>tr>td>input[type='checkbox']").each(function(i, element) {
			element.checked = check;
		});
	});
	//테이블 전체 체크박스 이벤트//
	
	//주문 상태 콤보박스 이벤트//
	$("#cboSrhStatus").change(function() {
		$("#btnSearch").click();
	});
	//주문 상태 콤보박스 이벤트//
	
	//검색 text 이벤트//
	$("#txtWord").keyup(function() {
		$("#btnSearch").click();
	});
	//검색 text 이벤트//
	
	//검색 버튼 이벤트//
	$("#btnSearch").click(function() {
		$("#chkAll").prop("checked", false);
		let kind = $("#kind").val();
		let word = $("#txtWord").val();
		let status = $("#cboSrhStatus").val();
		orderListLoad(kind,word,1,status);
	});
	//검색 버튼 이벤트//

	//주문 목록 로드//
	function orderListLoad(kind, word, pageNum, status) {
		jQuery.ajax({
			dataType:"JSON",
			url:`${cp}/admin/orderList.do`,
			method:"get",
			data:{kind:kind,
				word:word,
				pageNum:pageNum,
				status:status},
			success:function(data){
				tbodyRowAdd(data[0]);
			}
		});
	}
	//주문 목록 로드//
	
	function tbodyRowAdd(data){
		let tbody = $("#order-table>tbody");
		tbody.empty();
		for(let dto of data){
			let row = "<tr>";
			row += "<td>";
			row += "<input type='checkbox'>";
			row += "</td>";
			row += "<td>"+dto.onum+"</td>";
			row += "<td>"+dto.id+"</td>";
			row += "<td>"+dto.statusName+"</td>";
			row += "<td><a href='${cp}/admin/ordDetail.do?onum="+dto.onum+"'>"+dto.prodName+"</a></td>";
			row += "<td>"+dto.pay_yn+"</td>";
			row += "<td>"+dto.price+"</td>";
			row += "<td class='hidden'>"+dto.addr+"</td>";
			row += "<td>"+dto.pay_wayName+"</td>";
			row += "<td class='hidden'>"+dto.use_point+"</td>";
			row += "<td>"+dto.reg_date+"</td>";			
			row += "</tr>";
			tbody.append(row);
		}
	}
</script>