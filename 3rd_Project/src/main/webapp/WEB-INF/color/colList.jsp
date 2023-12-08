<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
var div2 = document.getElementsByClassName("div2");

function handleClick(event) {
  console.log(event.target);
  // console.log(this);
  // 콘솔창을 보면 둘다 동일한 값이 나온다
  // 저장용

  console.log(event.target.classList);

  if (event.target.classList[1] === "clicked") {
    event.target.classList.remove("clicked");
  } else {
    for (var i = 0; i < div2.length; i++) {
      div2[i].classList.remove("clicked");
    }

    event.target.classList.add("clicked");
  }
}

function init() {
  for (var i = 0; i < div2.length; i++) {
    div2[i].addEventListener("click", handleClick);
  }
}

init();

/* 	$(function(){
		$("#btnSpring").click(function(){
			$("#btnSpring").css({"background": "#EDE5D8"});
			$("#btnSummer").css({"background": "white"});
			$("#btnAutumn").css({"background": "white"});
			$("#btnWinter").css({"background": "white"});
		});
		$("#btnSummer").click(function(){
			$("#btnSpring").css({"background": "white"});
			$("#btnSummer").css({"background": "#B3B3CE"});
			$("#btnAutumn").css({"background": "white"});
			$("#btnWinter").css({"background": "white"});
		});
		$("#btnAutumn").click(function(){
			$("#btnSpring").css({"background": "white"});
			$("#btnSummer").css({"background": "white"});
			$("#btnAutumn").css({"background": "#C98BA4"});
			$("#btnWinter").css({"background": "white"});
		});
		$("#btnWinter").click(function(){
			$("#btnSpring").css({"background": "white"});
			$("#btnSummer").css({"background": "white"});
			$("#btnAutumn").css({"background": "white"});
			$("#btnWinter").css({"background": "#7C81BB"});
		});
		
	});
	 */
</script>

<style>
	#btnSpring, #btnSummer, #btnAutumn, #btnWinter {
		border: 1px solid #EAEAEA;
	}
	#btnSpring:hover {
		background: #EDE5D8;
	}
	#btnSummer:hover {
		background: #B3B3CE;
	}
	#btnAutumn:hover {
		background: #C98BA4;
	}
	#btnWinter:hover {
		background: #7C81BB;
	}
}
</style>

<%@ include file="./../views/header.jsp"%>

<article id="center" style="text-align: center;">
	저희는 톤을 크게 4계절로, 자세하게는 총 10가지로 분류합니다.<br>

	<div class="btn-group" role="group" style="width: 300px;">
		<input type="button" class="btn" name="div2" id="btnSpring" value="&nbsp;봄&nbsp;"></button>
		<input type="button" class="btn" name="div2" id="btnSummer" value="여름"> 
		<input type="button" class="btn" name="div2" id="btnAutumn" value="가을"> 
		<input type="button" class="btn" name="div2" id="btnWinter" value="겨울">
	</div>

	<div id="spring">
		<img src="resources/image/pccs_spring.png" width="60%">
	</div>
	<div id="summer">
		<img src="resources/image/pccs_summer.png" width="60%">
	</div>
	<div id="auturm">
		<img src="resources/image/pccs_autumn.png" width="60%">
	</div>
	<div id="winter">
		<img src="resources/image/pccs_winter.png" width="60%">
	</div>


</article>

<%@ include file="./../views/footer.jsp"%>