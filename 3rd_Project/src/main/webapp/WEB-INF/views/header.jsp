<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FIND YOUR Hidden Beauty</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style>
	#center{
		left: 355px;
		position: relative;
		width: 1200px;
		padding: 10px 0px 100px 0px;
	}
	@font-face {
	    font-family: 'MaruBuri-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/MaruBuri-Regular.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	@font-face {
	    font-family: 'RIDIBatang';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	@font-face {
	    font-family: 'TheJamsil5Bold';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
	    font-weight: 700;
	    font-style: normal;
	}
</style>
</head>

<body>
	<header class="p-3 mb-3 border-bottom" style="font-family: 'RIDIBatang';">
		<div class="container">
			<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">

				<!-- 메뉴 선택하기 -->
				<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0" style="font-size: 13pt;">
					<li>
						<a href="<%=request.getContextPath()%>/" class="nav-link px-2 link-secondary">
						<img src="resources/image/fyhbLogo.png" width="170"></a>
					</li>
					<li style="margin-top: 10px; margin-left: 30px">
<<<<<<< HEAD
						<a href="#asd" class="nav-link px-2 link-body-emphasis">AI 컬러진단</a>
					</li> 
=======
						<a href="colorAi.ai" class="nav-link px-2 link-body-emphasis">AI 컬러진단</a>
					</li>
>>>>>>> branch 'YJ' of https://github.com/BeTheBestSY/3rd_Project.git
					<li style="margin-top: 10px; margin-left: 10px">
						<a href="#" class="nav-link px-2 link-body-emphasis">퍼스널 컬러란?</a>
					</li>
					<li style="margin-top: 10px; margin-left: 10px">
						<a href="#" class="nav-link px-2 link-body-emphasis">의견 게시판</a>
					</li>
					<li style="margin-top: 10px; margin-left: 10px">
						<a href="#" class="nav-link px-2 link-body-emphasis">쇼핑하기</a>
					</li>
				</ul>  

				<!-- 로그인아이콘 & 드롭다운 메뉴 -->
				<div class="dropdown text-end" style="margin-right: 50px">
					<a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"> 
						<img src="resources/image/person.svg" width="32" height="32" class="rounded-circle">
					</a>
					<c:if test="${id == null}">
						<ul class="dropdown-menu text-small">
							<li><a class="dropdown-item" onclick="goLogin()">로그인</a></li>
							<li><a class="dropdown-item" href="<%=request.getContextPath()%>/members/registerForm.jsp">회원가입</a></li>
						</ul>
					</c:if>
					<c:if test="${id != null}">
					<ul class="dropdown-menu text-small">
						<li style="text-align: center;"><small>안녕하세요, <b><%=session.getAttribute("id")%></b>님</small></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">마이페이지</a></li>
						<li><a class="dropdown-item" href="#">로그아웃</a></li>
					</ul>
					</c:if>
				</div>
			</div>
		</div>
	</header>
