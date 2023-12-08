<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<style>
nav {
	z-index: 99;
	color: black;
	position: fixed;
	left: 20%;
	top: 20%;
	font-size: 12pt;
	font-weight: bold;
}

nav span {
	width: 100px; 
	margin-top: 10px;
	border: 2px solid black;
	border-radius: 50px;
	padding: 10px;
	border-color: beige;
	background-color: beige;
	text-align: center;
}

nav span:hover {
	background-color: bisque;
	cursor: pointer;
}

#sl, #sb {
	width: 800px;
	height: 1000px;
}
</style>

<%@ include file="./../views/header.jsp" %>

<article id="center">
	colList.jsp<br>
	<nav>
      <span id="navSL">봄 라이트</span>
      <span id="navSB">봄 브라이트</span>
    </nav>
    
    <section id="sl">봄 라이트</section>
    <section id="sb" style="background-color: cyan;">봄 브라이트</section>
    
    <script type="text/javascript">
    	document.querySelector("#navSL").addEventListener("click", (e) => {
    	  document.querySelector("#sl").scrollIntoView({ behavior: "smooth" });
    	});
    	document.querySelector("#navSB").addEventListener("click", (e) => {
    	  document.querySelector("#sb").scrollIntoView({ behavior: "smooth" });
    	});
    </script>
</article>

<%@ include file="./../views/footer.jsp" %>