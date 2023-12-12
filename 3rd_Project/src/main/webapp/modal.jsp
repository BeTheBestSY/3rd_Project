<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>Modal</title>

<style>
.modal {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}
.modal.show {
	display: block;
}
.modal_body {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 700px;
	height: 400px;
	padding: 40px;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
}
</style>
</head>

<body>
	<div class="modal">
		<div class="modal_body">
			<span>AI 퍼스널 컬러 진단 관련 안내</span>
			<br><br>
			<span>
				1. 동일 인물이라도 사진의 색감과 조명에 따라 측정 결과가 달라질 수 있습니다.<br>
				&nbsp;&nbsp;&nbsp;최대한 색이 들어가지 않은 조명 아래에서 찍은 사진으로 진행 부탁 드립니다.<br><br> 
				2. 평소 스타일링에 따라 정확한 진단이 나오지 않는 경우가 있습니다.<br>
				&nbsp;&nbsp;&nbsp;(퍼스널 컬러는 봄 브라이트이나 스모키&스트릿 스타일링을 즐겨 입으신다든가 등...)<br>
				&nbsp;&nbsp;&nbsp;결과가 의아하시거나 좀 더 전문적인 진단을 받고 싶으시다면<br>
				&nbsp;&nbsp;&nbsp;결과 노출 화면에서 퍼스널 컬러 업체를 소개해드리고 있으니 참고 부탁 드립니다.<br><br> 
			</span><br>
		</div>
	</div>
	<button class="btn-open-popup">Modal 띄우기</button>
	
	<script>
	    const body = document.querySelector('body');
	    const modal = document.querySelector('.modal');
	    const btnOpenPopup = document.querySelector('.btn-open-popup');
	
	    btnOpenPopup.addEventListener('click', () => {
	      modal.classList.toggle('show');
	
	      if (modal.classList.contains('show')) {
	        body.style.overflow = 'hidden';
	      }
	    });
	
	    modal.addEventListener('click', (event) => {
	      if (event.target === modal) {
	        modal.classList.toggle('show');
	
	        if (!modal.classList.contains('show')) {
	          body.style.overflow = 'auto';
	        }
	      }
	    });
    </script>
</body>
</html>
