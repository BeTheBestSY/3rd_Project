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
   body{
      padding-top: 140px;
   }
</style>

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
	</div>
<%@ include file="../views/footer.jsp" %>
</body>
</html>