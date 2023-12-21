<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	UsersBean ub = (UsersBean)session.getAttribute("loginInfo");
			
	if(ub==null){
		session.setAttribute("destination", "redirect:/cartList.mall");
	%>
<script type="text/javascript">
			alert("로그인 후 이용 가능합니다.")
			window.location.href = "login.u";
		</script>
<%
	};
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<style>
body {
	padding-top: 140px;
}
</style>

<<<<<<< HEAD
<%@ include file="../product/productHeader.jsp" %>
 
	<div id="content">
		<table class="table" width="100%" style="text-align: center;"> 
		  <thead>
		    <tr style="font-size: 13pt;"> 
		      <th scope="col">#</th>
		      <th scope="col">상품명</th>
		      <th scope="col">가격(단가)</th>
		      <th scope="col">수량</th>
		      <th scope="col">주문금액</th>
		      <th scope="col">X</th>
		    </tr>
		  </thead>
		  
		  <tbody class="table-group-divider">
			<c:if test="${fn:length(productList) == 0}">
				<tr>
					<td colspan="6" style="text-align: center;">장바구니에 담긴 상품이 없습니다.</td>
				</tr>
			</c:if>
	
			<c:if test="${fn:length(productList) != 0}">
				<c:forEach var="pb" items="${ productList }"  varStatus="loop">
					 
					    <tr>
					      <th scope="row">   ${loop.index + 1}</th>
					      <td>${pb.p_name}</td>
					      <td> 
					      	<fmt:formatNumber value="${pb.p_price}" pattern="#,###" />원
						  </td>
					      <td>
						  	<fmt:formatNumber value="${list[loop.index].cart_qty}" pattern="#,###" />개
						  </td>
					      <td>
						  	<fmt:formatNumber value="${pb.p_price*list[loop.index].cart_qty}" pattern="#,###" />원
						   <c:set var="totalAmount" value="${totalAmount + (pb.p_price * list[loop.index].cart_qty)}" />
   
						  </td>
					      <td>
					      	<a href="cartDelete.mall?p_num=${pb.p_num}" class="nav-link px-2 link-secondary">
								X 
							</a>
					      </td>
					    </tr>  
			  	 	</c:forEach>
				</c:if>
					<tr>
						<td colspan="4"></td>
						<td>배송비:</td>
						<td>
							<c:if test="${totalAmount<30000}">
								 3,000원
							</c:if>
							<c:if test="${totalAmount>=30000}">
								 0원
							</c:if>
						</td> 
					</tr>
					<tr>
						<td colspan="3"></td>
						<td>전체 금액:</td>
						<td>
							<c:if test="${totalAmount<30000}">
								<fmt:formatNumber value="${totalAmount+3000}" pattern="#,###" />원
							</c:if>
							<c:if test="${totalAmount>=30000}">
								<fmt:formatNumber value="${totalAmount}" pattern="#,###" />원
							</c:if>
							</td> 
						<td><a href="cartOrder.mall">주문하기</a></td>
					</tr>
				 
		</tbody>
	</table>
=======
	<%@ include file="../product/productHeader.jsp"%>
	<div style="font-family: 'MaruBuri-Regular'; font-size: 25pt; font-weight: bold; margin: 50px 0px 30px 360px;">
		장바구니
>>>>>>> branch 'SY' of https://github.com/BeTheBestSY/3rd_Project.git
	</div>

	<div style="width: 1200px; margin: auto; padding: 0px 25px 20px 12px;">
		<table style="text-align: center; font-family: 'RIDIBatang'; width: 100%;">
			<thead>
				<tr style="font-size: 13pt; border-top: 1px solid black; background: #F6F6F6; height: 50px;">
					<th scope="col"><input type="checkbox" name="all"></th>
					<th scope="col">상품명</th>
					<th scope="col">수량</th>
					<th scope="col">가격</th>
					<th scope="col">배송비</th>
					<th scope="col">주문금액</th>
					<th scope="col">선택</th>
				</tr>
			</thead>

			<tbody>
				<c:if test="${fn:length(productList) == 0}">
					<tr>
						<td colspan="7" style="text-align: center;">
							장바구니에 담긴 상품이 없습니다.
						</td>
					</tr>
				</c:if>

				<c:if test="${fn:length(productList) != 0}">
					<c:forEach var="pb" items="${ productList }" varStatus="loop">
						<tr valign="middle">
							<td scope="row"><input type="checkbox" name="check"></td>
							<td>${pb.p_name}</td> 
							<td>
								<input type="number" class="form-control" min="1" value="${list[loop.index].cart_qty}" style="width: 60px; height: 31px; display: inline;">
								<input type="button" value="수정" style="width: 40px; font-size: 10pt;"> 
							</td>
							<td><fmt:formatNumber value="${pb.p_price}" pattern="#,###" />원</td>
							<td><fmt:formatNumber value="${deli}" pattern="#,###" />원</td>
							<td>
								<fmt:formatNumber value="${pb.p_price*list[loop.index].cart_qty}" pattern="#,###" />원
								<c:set var="totalAmount" value="${totalAmount + (pb.p_price * list[loop.index].cart_qty)}" />
							</td>
							<td>
								<input type="button" value="삭제하기" onClick="location.href='cartDelete.mall?p_num=${pb.p_num}'"><br>
								<input type="button" value="바로구매">
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<tr>
					<td colspan="5"></td>
					<td>배송비:</td>
					<td><c:if test="${totalAmount<30000}">
								 3,000원
							</c:if> <c:if test="${totalAmount>=30000}">
								 0원
							</c:if></td>
				</tr>
				<tr>
					<td colspan="4"></td>
					<td>전체 총액:</td>
					<td><c:if test="${totalAmount<30000}">
							<fmt:formatNumber value="${totalAmount+3000}" pattern="#,###" />원
							</c:if> <c:if test="${totalAmount>=30000}">
							<fmt:formatNumber value="${totalAmount}" pattern="#,###" />원
							</c:if></td>
					<td><a href="cartOrder.mall">주문하기</a></td>
				</tr>

			</tbody>
		</table>
	</div>
	<%@ include file="../views/footer.jsp"%>
</body>
</html>