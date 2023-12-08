<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<style type="text/css">
#wrap{
margin: 0 auto;
width: 1024px !important;  
}
#content{
margin: 0 auto;
width: 1024px;  
}  
#s{
margin: 0 auto;
width: 500px;
}  
</style>
</head>
<%@ include file="../views/header.jsp" %>
<body>
 
<div id=wrap>

	<form action="company.cmp" method="get">
		<div class="input-group mb-3" id="s">
			<select name ="whatColumn" class="btn btn-outline-secondary dropdown-toggle" style="text-align: left;">
				<option value="all">전체
				<option value="cmp_name">회사명
				<option value="cmp_station">근처 역
				<option value="cmp_addr">주소
			</select>
			
			<input type="text"  name="keyword" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
			<input class="btn btn-outline-secondary" type="submit" id="button-addon2"  value="검색"> 
		</div>
	</form>
	<div id="content">
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">회사명</th>
		      <th scope="col">주소</th>
		      <th scope="col">가격(2인기준)</th>
		      <th scope="col">근처 역</th>
		    </tr>
		  </thead>
		  <tbody class="table-group-divider">
		  <c:if test="${fn:length(list) == 0}">
				<tr>
					<td colspan="5" style="text-align: center;">
						정보가 없습니다.
					</td>
				</tr>
			</c:if>
			
			 <c:if test="${fn:length(list) != 0}">
				<c:forEach var="cb" items="${ list }">
				    <tr>
				      <th scope="row">${cb.cmp_num}</th>
				      <td>${cb.cmp_name}</td>
				      <td>${cb.cmp_addr}</td>
				      <td>
					      <fmt:formatNumber value="${cb.cmp_price }" pattern="#,###" />
					  </td>
				      <td>${cb.cmp_station}</td>
				    </tr>
		  	  </c:forEach>
			</c:if>
		  </tbody>
		</table>
	</div>
</div>
<center>
${pageInfo.pagingHtml}
</center>
</body>
<%@ include file="../views/footer.jsp" %>
</html>