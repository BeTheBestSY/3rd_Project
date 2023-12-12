<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 
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
		      <th scope="col">위치 검색</th>
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
				      <td>
				      	<a href="marker.cmp?cmp_num=${cb.cmp_num}&pageNumber=${pageInfo.pageNumber}" class="nav-link px-2 link-secondary">
						<img src="resources/image/marker.png" width="30"></a>
				      </td>
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
<br><br><br>
<center>   
<div id="staticMap" style="width:1024px;height:350px;"></div>
</center>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f8fb6e61c9516794c3e829ce49ef713c"></script>
	<script>
	 
// 이미지 지도에 표시할 마커입니다
var marker = {
		 
    position: new kakao.maps.LatLng(${oneY}, ${oneX}), 
    text: '${oneName}' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다
};
  
var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div
    staticMapOption = { 
        center: new kakao.maps.LatLng(${oneY}, ${oneX}), // 이미지 지도의 중심좌표
        level: 3, // 이미지 지도의 확대 레벨
        marker: marker // 이미지 지도에 표시할 마커
    };
<center>
${pageInfo.pagingHtml}
</center>
<br><br><br>
<center>   
<div id="staticMap" style="width:1024px;height:350px;"></div>
</center>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f8fb6e61c9516794c3e829ce49ef713c"></script>
	<script>
	 
// 이미지 지도에 표시할 마커입니다
var marker = {
		 
    position: new kakao.maps.LatLng(${oneY}, ${oneX}), 
    text: '${oneName}' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다
};
  
var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div
    staticMapOption = { 
        center: new kakao.maps.LatLng(${oneY}, ${oneX}), // 이미지 지도의 중심좌표
        level: 3, // 이미지 지도의 확대 레벨
        marker: marker // 이미지 지도에 표시할 마커
    };

// 이미지 지도를 생성합니다
var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
</script>
</body>
<%@ include file="../views/footer.jsp" %>
</html>