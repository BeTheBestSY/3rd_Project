<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
	.footer_content{
		font-size: 10pt;
		left: 50px;
		top: -23px;
		position: relative;
		margin-bottom: 100px;
		font-family: 'MaruBuri-Regular';
	}
	#footer_vertical{
		width: 3px; 
		height: 18px;
		background: #7C81BB;
		display: inline-block;
	}
	#footer_title{
		font-size: 15pt; 
		font-weight: bold;
		font-family: 'MaruBuri-Regular';
	}
	#footer_menu{
		font-size: 9pt;
		text-decoration: none;
		color: graytext;
	}
    a.top {
      position: fixed;
      left: 96%;
      bottom: 28px;
      display: none;
    }
</style>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 300) {
				$('.top').fadeIn();
			} else {
				$('.top').fadeOut();
			}
		});
		$('.top').click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
	});
</script>

<a href="#" class="top"><img src="resources/image/arrow1.png" width="50"></a>

<div class="container">
	<footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
		<div class="col-md-4 d-flex align-items-center">
			<svg class="bi" width="30" height="24"><use xlink:href="#bootstrap" /></svg>
			<span class="mb-3 mb-md-0 text-body-secondary">
				&copy; 2023 FIND YOUR Hidden Beauty Inc.
			</span>
		</div>
		<ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
			<li class="ms-2">
				<a href="#" id="footer_menu">개인정보 보호 정책&nbsp;&nbsp;&nbsp;|</a>
			</li>
			<li class="ms-2">
				<a href="#" id="footer_menu">이메일 무단수집 거부&nbsp;&nbsp;&nbsp;|</a>
			</li>
			<li class="ms-2">
				<a href="#" id="footer_menu">제작자 정보</a>
			</li>
			<li class="ms-3">&nbsp;&nbsp;
			</li>
		</ul>
	</footer>
	<div class="footer_content">
		<br>
		<b>당신의 숨겨진 아름다움을 찾아서 -</b><br><br><br>
		&nbsp;&nbsp;&nbsp;
		<div id="footer_vertical"></div>&nbsp;&nbsp;<font id="footer_title">업무시간</font><div style="width: 138px; display:inline-block;"></div>
		<div id="footer_vertical"></div>&nbsp;&nbsp;<font id="footer_title">휴무일</font><div style="width: 244px; display:inline-block;"></div>
		<div id="footer_vertical"></div>&nbsp;&nbsp;<font id="footer_title">주소</font>
		<br>
		<div style="top: 8px; position: relative; color: graytext;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			평일 AM 09:00 ~ PM 06:00 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			공휴일, 주말, 지정 휴무일(추후 팝업창 안내) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			서울특별시 마포구 월드컵북로 21 풍성빌딩 4층
		</div><br><br>
		&nbsp;&nbsp;&nbsp;<div id="footer_vertical"></div>&nbsp;&nbsp;<font id="footer_title">정보</font>
		<div style="top: 8px; position: relative; color: graytext;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(주)쌍용교육센터 H반 환감탈태조 FIND YOUR Hidden Beauty | 신고번호 : 제 2023-서울마포-00000호<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공동대표 4인 : 김수연, 박혜주, 황다온, 이유진 (TEL : 02-336-8546 / FAX : 02-334-5405)
		</div>
		<img src="resources/image/syLogo.png" width="230" style="left: 975px; top: -30px; position: relative;" onclick="location.href='https://www.sist.co.kr/index.jsp'">
	</div>
</div>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous">
</script>
</body>
</html>