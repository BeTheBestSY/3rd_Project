<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style>
	img{
		width: 100%;
		object-fit: cover;
	}
	.img-box, .explain-box{
		display: inline-block;
		width: 25%;
	}
	.explain-box{
		height: 25%;
	}
</style>
<h1>프로필뷰</h1>
<!-- border-dark-subtle: 테두리 색상 -->
<div class="profile-box" style="border: 1px solid blue;">
	<div class="img-box" style="border: 1px solid red">
		<c:if test="${ub.u_profileimg eq null }">
			<img  src="resources/image/person.svg" class="border border-5 border-dark-subtle rounded-circle">
		</c:if>
		<c:if test="${ub.u_profileimg ne null }">
			<img  src="${ub.u_profileimg }" class="border border-5 border-dark-subtle rounded-circle">
		</c:if>
	</div>
	<div class="explain-box" style="border: 1px solid black">
		haha
	</div>
</div>

