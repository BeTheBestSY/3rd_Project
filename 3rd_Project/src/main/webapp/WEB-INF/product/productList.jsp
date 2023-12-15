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
<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/album/">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
	#s {
		margin: 0 auto;
		width: 500px;
	}
	.bd-placeholder-img {
		font-size: 1.125rem;
		text-anchor: middle;
		-webkit-user-select: none;
		-moz-user-select: none;
		user-select: none;
	}
	.b-example-divider {
		width: 100%;
		height: 3rem;
		background-color: rgba(0, 0, 0, .1);
		border: solid rgba(0, 0, 0, .15);
		border-width: 1px 0;
		box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
			rgba(0, 0, 0, .15);
	}
	.b-example-vr {
		flex-shrink: 0;
		width: 1.5rem;
		height: 100vh;
	}
	.bi {
		vertical-align: -.125em;
		fill: currentColor;
	}
	.nav-scroller {
		position: relative;
		z-index: 2;
		height: 2.75rem;
		overflow-y: hidden;
	}
	.nav-scroller .nav {
		display: flex;
		flex-wrap: nowrap;
		padding-bottom: 1rem;
		margin-top: -1px;
		overflow-x: auto;
		text-align: center;
		white-space: nowrap;
		-webkit-overflow-scrolling: touch;
	}
	.btn-bd-primary { -
		-bd-violet-bg: #712cf9; -
		-bd-violet-rgb: 112.520718, 44.062154, 249.437846; -
		-bs-btn-font-weight: 600; -
		-bs-btn-color: var(- -bs-white); -
		-bs-btn-bg: var(- -bd-violet-bg); -
		-bs-btn-border-color: var(- -bd-violet-bg); -
		-bs-btn-hover-color: var(- -bs-white); -
		-bs-btn-hover-bg: #6528e0; -
		-bs-btn-hover-border-color: #6528e0; -
		-bs-btn-focus-shadow-rgb: var(- -bd-violet-rgb); -
		-bs-btn-active-color: var(- -bs-btn-hover-color); -
		-bs-btn-active-bg: #5a23c8; -
		-bs-btn-active-border-color: #5a23c8;
	}
	.bd-mode-toggle {
		z-index: 1500;
	}
</style>

</head>


<%@ include file="../views/header.jsp" %>

<body>
	
	<!-- 상단 이미지바 -->
	<div style="width: 67%; margin: auto; font-family: 'RIDIBatang'; font-size: 13pt; padding: 0px 0px 20px 0px;">
		<a>베스트</a>&nbsp;&nbsp;<a>신제품</a>&nbsp;&nbsp;<a>전체보기</a>
	</div>
	
	<!-- 캐러샐 이미지 부분 -->
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="resources/image/ca_ex1.jpg" class="d-block w-100">
			</div>
		    <div class="carousel-item">
		    	<img src="resources/image/ca_ex2.jpg" class="d-block w-100">
		    </div>
		    <div class="carousel-item">
		    	<img src="resources/image/ca_ex3.jpg" class="d-block w-100">
		    </div>
		    <div class="carousel-item">
		    	<img src="resources/image/ca_ex4.jpg" class="d-block w-100">
		    </div>
		    <div class="carousel-item">
		    	<img src="resources/image/ca_ex5.jpg" class="d-block w-100">
		    </div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
	    	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    	<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
	    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
	    	<span class="visually-hidden">Next</span>
	  	</button>
	</div>

	<div id="wrap">
		<form action="productList.p" method="get">
			<div class="input-group mb-3" id="s">
				<select name ="whatColumn" class="btn btn-outline-secondary dropdown-toggle" style="text-align: left;">
					<option value="all">전체
					<option value="p_brand">브랜드
					<option value="p_name">이름
				</select>
				<input type="text"  name="keyword" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
				<input class="btn btn-outline-secondary" type="submit" id="button-addon2"  value="검색"> 
			</div>
		</form>
		<br><br>
	
		<main> 
			<section>
				<ul class="nav nav-underline justify-content-center">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="productList.p?whatColumn=p_color&keyword=봄" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					    	봄
					    </a>
					    <ul class="dropdown-menu">
					    	<li><a class="dropdown-item" href="productList.p?whatColumn=p_color&keyword=봄+라이트">봄 라이트</a></li>
					        <li><a class="dropdown-item" href="productList.p?whatColumn=p_color&keyword=봄+브라이트">봄 브라이트</a></li>
						</ul>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="productList.p?whatColumn=p_color&keyword=여름" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					    	여름
					    </a>
					    <ul class="dropdown-menu">
					    	<li><a class="dropdown-item" href="productList.p?whatColumn=p_color&keyword=여름+라이트">여름 라이트</a></li>
					        <li><a class="dropdown-item" href="productList.p?whatColumn=p_color&keyword=여름+브라이트">여름 브라이트</a></li>
					        <li><a class="dropdown-item" href="productList.p?whatColumn=p_color&keyword=여름+뮤트">여름 뮤트</a></li>
					   	</ul>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="productList.p?whatColumn=p_color&keyword=가을" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					        가을
					    </a>
					    <ul class="dropdown-menu">
					    	<li><a class="dropdown-item" href="productList.p?whatColumn=p_color&keyword=가을+뮤트">가을 뮤트</a></li>
					        <li><a class="dropdown-item" href="productList.p?whatColumn=p_color&keyword=가을+스트롱">가을 스트롱</a></li>
					        <li><a class="dropdown-item" href="productList.p?whatColumn=p_color&keyword=가을+딥">가을 딥</a></li>
					    </ul>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="productList.p?whatColumn=p_color&keyword=겨울" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					        겨울
					   	</a>
					    <ul class="dropdown-menu">
					    	<li><a class="dropdown-item" href="productList.p?whatColumn=p_color&keyword=겨울+브라이트">겨울 브라이트</a></li>
					        <li><a class="dropdown-item" href="productList.p?whatColumn=p_color&keyword=겨울+딥">겨울 딥</a></li>
						</ul>
					</li>
				</ul>
			</section>
		   
			<div class="album py-5 bg-body-tertiary">
			    <div class="container">
					<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					
						<c:if test="${fn:length(productLists) == 0}">
							<div class="col">
						    	<div class="card shadow-sm">
						        	<br><br>
									<b>등록된 상품이 없습니다.</b><br><br>
								</div>
						    </div>
						</c:if>
						
						<c:if test="${fn:length(productLists) != 0}">
							<c:forEach var="pb" items="${productLists}"> 
								<div class="col">
							    	<div class="card shadow-sm">
							        	<a href="prodView.p?p_num=${pb.p_num}&pageNumber=${pageInfo.pageNumber}">
							         		<img src="<%=request.getContextPath() %>/resources/uploadFolder/product/${pb.p_ttlimg}" height="225">
							            </a>
							            <div class="card-body"> 
							            	<p class="card-text">${pb.p_name }</p>
							            	<p class="text-body-secondary">${pb.p_contents }</p>
							            	<div class="d-flex justify-content-between align-items-center">
							                	<div class="btn-group">
							                  		<a href="prodView.p?p_num=${pb.p_num}&pageNumber=${pageInfo.pageNumber}">
								                  		<button type="button" class="btn btn-sm btn-outline-secondary" >상세보기 ▶▶
								                  		</button>
							                 		</a>
							                	</div>   
							                	<small class="text-body-secondary"> <fmt:formatNumber value="${pb.p_price }" pattern="#,###" />원</small>
							              	</div>
							            </div>
							        </div>
							 	</div>
							</c:forEach>
						</c:if>
						
		      		</div>
		    	</div>
			</div>
			
			<center>
				${pageInfo.pagingHtml}
			</center>
		</main>
	</div>

</body>

<%@ include file="../views/footer.jsp" %>
</html>