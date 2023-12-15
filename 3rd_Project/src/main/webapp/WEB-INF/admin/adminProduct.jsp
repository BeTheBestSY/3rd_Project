<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminMenu.jsp"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/adminProduct.css">
<script type="text/javascript">
	function init(){
		var elem = document.getElementById('search');
		elem.value = `productFilter.admin?$`;
	}
	
	window.onload = function(){
		const radios = document.querySelectorAll("input[name='filter_btn']");
	 
		radios.forEach((radio) => {
			radio.addEventListener("change", (e) => {
				const current = e.currentTarget;
				if(current.checked){
					location.href='';
				}
			});
		});
	};
</script>
<article id="center" style=" text-align:center; font-family: 'MaruBuri-Regular';" >
<div class="section">
	<div class="tag">
		<h4>상품 관리</h4>
	</div>
	<div id="board-search">
		<div class="container">
			<div class="search-window">
				<div class="search-wrap">
					<form action="productList.admin" method="post">
						<select name="whatColumn" id="whatColumn" onchange="init()" >
							<option value="all" <c:if test="${param.whatColumn eq 'all' || param.whatColumn eq ''}">selected</c:if>>전체검색</option>
							<option value="p_brand" <c:if test="${param.whatColumn eq 'p_brand'}">selected</c:if>>이름</option>
							<option value="p_color" <c:if test="${param.whatColumn eq 'p_color'}">selected</c:if>>아이디</option>
							<option value="p_name" <c:if test="${param.whatColumn eq 'p_name'}">selected</c:if>>휴대폰번호</option>
						</select>
						<input id="search" type="search" name="keyword" value="${param.keyword }" placeholder="검색어를 입력해주세요.">
						<button type="submit" class="btn btn-dark">검색</button>
					</form>
					<div class="filter_radio">
						<input type="radio" name="filter_btn" value="p_stock" checked style="width:20px;height:18px;border:1px;"> 재고임박순&nbsp;
						<input type="radio" name="filter_btn" value="p_salevolume" style="width:20px;height:18px;border:1px;"> 누적판매량순&nbsp;
						<input type="radio" name="filter_btn" value="p_price" style="width:20px;height:18px;border:1px;"> 고가순&nbsp;
						<input type="radio" name="filter_btn" value="p_price" style="width:20px;height:18px;border:1px;"> 저가순&nbsp;
						<!-- 출고일(혹은 입고일) 칼럼을 넣어야 할까.. -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="board-list" >
		<div class="container" >
			<div class="row">
				<div class="whole1">
					<div class="topbox1">
						<table class="board-table" style="font-size: 13pt; text-align: center; table-layout:fixed;">
							<tr style="background: #f4f4f4;">
								<th scope="col" class="th-num">번호</th>
								<th scope="col" class="th-id" width="8%">브랜드</th>
								<th scope="col" class="th-name" width="25%">이름</th>
								<th scope="col" class="th-phone">가격</th>
								<th scope="col" class="th-point">재고수량</th>
								<th scope="col" class="th-paint">누적판매량</th>
								<th scope="col" class="th-personalc">퍼스널컬러</th>
								<th scope="col" class="th-delete"></th>
								<th scope="col" class="th-update"></th>
							</tr>
							<c:if test="${empty prodLists }">
								<tr>
									<td colspan="12">존재하지 않는 상품 입니다.</td>
								</tr>
							</c:if>
							
							<c:forEach var="pb" items="${prodLists }">
								<tr>
									<td>${pb.p_num }</td>
									<td>${pb.p_brand }</td>
									<td>${pb.p_name }</td>
									<td>${pb.p_price }</td>
									<td>${pb.p_stock }</td>
									<td>${pb.p_salevolume }</td>
									<td>${pb.p_color }</td>
									<td>
										<a href="productDelete.admin?p_num=${pb.p_num }">
											<input type="button" class="btn btn-white"  value="삭제하기">
										</a>
										<a href="productUpdate.admin?p_num=${pb.p_num }">
											<input type="button" class="btn btn-white"  value="수정하기">
										</a>
					 				</td>
								</tr>
							</c:forEach>
						</table>
						${pageInfo.pagingHtml }
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</article>


