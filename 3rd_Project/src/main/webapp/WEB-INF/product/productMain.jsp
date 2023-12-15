<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	body{
		padding-top: 140px;  
	}
</style>

<%@ include file="productHeader.jsp" %>
	 
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

<%@ include file="../views/footer.jsp" %>
