<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../views/header.jsp" %>
<div id="center" style="text-align: center">
<br><br>
<hr style="border: 2px solid black; width: 80%; margin: auto;">
<br><br>
<c:if test="${ub.u_id ne null }">
	<h5><b>${ub.u_name }</b> 님의 아이디는 <b>${ub.u_id }</b> 입니다.</h5><br><br>
</c:if>
<c:if test="${ub.u_id eq null }">
	<h5>일치하는 정보가 없습니다.</h5><br><br>
</c:if>
<a href=".main"><input type="button" value="메인으로 돌아가기"></a>
</div>>
<%@ include file="../views/footer.jsp" %>