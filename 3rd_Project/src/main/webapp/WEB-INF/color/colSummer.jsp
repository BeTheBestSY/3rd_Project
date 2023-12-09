<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 200) {
				$('#thisNav').css({"top":"30px"});
			} else {
				$('#thisNav').css({"top":"270px"});
			}
		});
	});
</script>

<!-- 저장용 -->
<!-- 저장용 -->

<style>
	nav {
		z-index: 99;
		color: black;
		position: fixed;
		left: 350px; 
		top: 270px; 
		font-size: 12pt; 
		font-weight: bold;
		font-family: 'RIDIBatang';
	}
	#navSML, #navSMB, #navSM {
		width: 120px;
		height: 45px;
		border-radius: 50px;
		border: none;
		background-color: beige;
		text-align: center;
		box-shadow: 3px 3px 3px 0px #BDBDBD;
	}
	#navSML:hover, #navSMB:hover, #navSM:hover {
		background-color: bisque;
		cursor: pointer;
	}
	#title{
		font-family: 'MaruBuri-Regular';
		font-size: 20pt;
		padding: 50px 0px 20px 0px;
	}
	#sml, #smb, #sm {
		width: 100%;
		padding-bottom: 50px;
	}
</style>

<%@ include file="./../views/header.jsp" %> 

<article id="center">
	<div id="title">
		<b>'여름'의 색상들을 소개해드릴게요!</b><br>
		<span style="font-family: 'RIDIBatang'; font-size: 13pt; line-height: 180%;">
			아래 버튼을 클릭하여 해당 퍼스널 컬러로 이동해주세요.
		</span><br>
	</div>
	<nav id="thisNav">
      <button id="navSML">${cbsml.col_name}</button>&nbsp;
      <button id="navSMB">${cbsmb.col_name}</button>&nbsp;
      <button id="navSM">${cbsm.col_name}</button>
    </nav>
    
    <div id="sml">
    	<br><br><br>
    	<br><br>
    	<img src="resources/image/${cbsml.col_ttlImg}" width="100%"><br><br><br>
    	<img src="resources/image/${cbsml.col_stlImg}" width="100%"><br><br><br><br>
    	<div style="text-align: center; font-weight: bold; font-size: 15pt; font-family: 'MaruBuri-Regular';">* ${cbsml.col_name} 추천 색상 *</div>
    	<br><br>
    	<img src="resources/image/${cbsml.col_colImg}" width="100%" style="margin: auto;"><br><br><br>
    </div>
    <div id="smb">
    	<br><br><br>
    	<br><br>
    	<img src="resources/image/${cbsmb.col_ttlImg}" width="100%"><br><br><br>
    	<img src="resources/image/${cbsmb.col_stlImg}" width="100%"><br><br><br><br>
    	<div style="text-align: center; font-weight: bold; font-size: 15pt; font-family: 'MaruBuri-Regular';">* ${cbsmb.col_name} 추천 색상 *</div>
    	<br><br>
    	<img src="resources/image/${cbsmb.col_colImg}" width="100%" style="margin: auto;"><br><br><br>
    </div>
    <div id="sm">
    	<br><br><br>
    	<br><br>
    	<img src="resources/image/${cbsm.col_ttlImg}" width="100%"><br><br><br>
    	<img src="resources/image/${cbsm.col_stlImg}" width="100%"><br><br><br><br>
    	<div style="text-align: center; font-weight: bold; font-size: 15pt; font-family: 'MaruBuri-Regular';">* ${cbsm.col_name} 추천 색상 *</div>
    	<br><br>
    	<img src="resources/image/${cbsm.col_colImg}" width="100%" style="margin: auto;"><br><br><br>
    </div>
    
    <script type="text/javascript">
    	document.querySelector("#navSML").addEventListener("click", (e) => {
    	  document.querySelector("#sml").scrollIntoView({ behavior: "smooth" });
    	});
    	document.querySelector("#navSMB").addEventListener("click", (e) => {
    	  document.querySelector("#smb").scrollIntoView({ behavior: "smooth" });
    	});
    	document.querySelector("#navSM").addEventListener("click", (e) => {
      	  document.querySelector("#sm").scrollIntoView({ behavior: "smooth" });
      	});
	</script>
	   
</article>

<%@ include file="./../views/footer.jsp" %>