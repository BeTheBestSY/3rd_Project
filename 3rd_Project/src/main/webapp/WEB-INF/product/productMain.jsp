<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	#none_under{
		text-decoration: none;
		color: black;
	}
</style>

<%@ include file="../views/header.jsp" %>
	
	<!-- 상단 메뉴바 --> 
	<form>
	<div style="width: 100%; margin: auto; font-family: 'TheJamsil5Bold'; font-size: 12pt; padding: 20px 0px 20px 300px; border-bottom: 0.5px solid #EAEAEA; background: #FDF9FB;">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#" id="none_under">베스트</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#" id="none_under">신상품</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#" id="none_under">모아보기</a>
		<div style="display: inline; left: 960px; position: relative;"> 
			<input type="text" id="searchBar" style="border: none; border-bottom: 1px solid black; position: absolute; left: -220px; top: -2px; display: none; background: rgba(0,0,0,0);">&nbsp;&nbsp;
			<img src="resources/image/search.png" width="23" onClick="display()">&nbsp;&nbsp; 
			<a href="#"><img src="resources/image/cart.png" width="23"></a>
		</div>
		<script>
			var searchDisplay = true;
			
			function display(){
				var con = document.getElementById("searchBar");
				if(con.style.display == "none"){
					con.style.display = "block";
				} else {
					con.style.display = "none";
				}
			}
		</script>
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

<%@ include file="../views/footer.jsp" %>
