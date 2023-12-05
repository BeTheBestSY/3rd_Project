<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<style>
	#btn{
		width: 500px; 
		height: 100px;
		background: white;
		border-radius: 15px 15px 15px 15px;
		box-shadow: 5px 5px 10px 0px #BDBDBD;
		text-align: left;
	}
	#btn:hover {
		background: #EAEAEA;
	}
	table{
		width: 100%;
	}
	td{
		padding: 15px 0px 0px 10px;
	}
}
</style>

<center>
<img src="resources/image/main.gif" width="100%">
<div style="color: white; top: -560px; position: relative; font-family: 'TheJamsil5Bold'; font-size: 28pt;">
	당신에게 가장 잘 어울리는<br>
	퍼스널 컬러 진단 서비스를 제공합니다.</div>
<div style="color: white; top: -550px; position: relative; font-family: 'MaruBuri-Regular'; font-size: 15pt;">
	Personal Color Consulting Service
</div>
<div style="color: white; top: -480px; position: relative; font-family: 'MaruBuri-Regular'; font-size: 12pt; line-height: 200%;">
	'FIND YOUR Hidden Beauty' 는 고객님께 보다 간편한 퍼스널 컬러 진단 서비스를 제공하며,<br>
	진단 이후에는 퍼스널 컬러 별 화장법과 스타일링을 안내해드리고 있습니다.
</div>
<img src="resources/image/fyhbLogo_white.png" width="200" style="top: -310px; position: relative;">
</center>

<article id="center" style="text-align: center; font-family: 'MaruBuri-Regular'; top: -80px; position: relative;">
	
	<p style="font-size: 35pt; color: #C98BA4; font-family: 'TheJamsil5Bold';">
		퍼스널 컬러 진단
	</p>
	<p style="font-size: 18pt; color: graytext; top: -10px; position: relative;">
		personal color consulting
	</p>
	<br><br>
	<p style="font-size: 13pt; font-weight: bold; line-height: 180%;">
		사람은 각자 고유의 색을 가지고 있습니다.<br>
		'퍼스널 컬러'는 자신이 가진 신체색과 조화를 이루어,<br> 
		자신을 보다 생기있고 활기차게 보이게 해 주는 색상을 뜻합니다.
	</p>
	<br><br>
	<p style="font-size: 11pt; color: gray; line-height: 220%;">
		퍼스널 컬러를 파악하는 것은 효과적으로 이미지를 관리하는 방법 중 하나입니다.<br>
		어울리는 컬러를 활용하면 긍정적인 이미지를 얻을 수 있는 반면,<br>
		어울리지 않는 컬러를 활용하면 피부가 거칠어보이거나 노안으로 보이는 등 단점이 극대화될 수 있습니다.
	</p>
	<br><br><br><br><br>
	<div style="display: inline-block;">
		<img src="resources/image/personal.svg" width="120"><br><br><br>
		<span style="font-size: 17pt; font-weight: bold; color: #C98BA4; font-family: 'TheJamsil5Bold'">
			Personal
		</span>
		<br>
		<span style="font-size: 14pt; color: graytext; line-height: 200%;">
			각자의
		</span>
	</div>
	<div style="width: 200px; display: inline-block;"></div>
	<div style="display: inline-block;">
		<img src="resources/image/color.png" width="120"><br><br><br>
		<span style="font-size: 17pt; font-weight: bold; color: #C98BA4; font-family: 'TheJamsil5Bold'">
			Color
		</span>
		<br>
		<span style="font-size: 14pt; color: graytext; line-height: 200%;">
			색상
		</span>
	</div>
	<div style="width: 200px; display: inline-block;"></div>
	<div style="display: inline-block;">
		<img src="resources/image/personalColor.svg" width="125"><br><br><br>
		<span style="font-size: 17pt; font-weight: bold; color: #C98BA4; font-family: 'TheJamsil5Bold'">
			Personal Color
		</span>
		<br>
		<span style="font-size: 14pt; color: graytext; line-height: 200%;">
			개인의 고유색
		</span>
	</div>
	
</article>

<center style="font-family: 'MaruBuri-Regular'; padding-bottom: 0px; top: -170px; position: relative;">
	<br><br><br><br><br><br><br><br>
	<div id="btn" onclick="location.href='#'">
		<table>
			<tr>
				<td><img src="resources/image/ai.png" width="70"></td>
				<td>
					<span style="font-size: 18pt; font-weight: bold;">AI 진단받기</span><br>
					<span style="font-size: 13pt; color: graytext;">얼굴이 선명하게 나온 사진을 준비해주세요!</span>
				</td>
			</tr>
		</table>
	</div>
	<br><br>
	<div id="btn" onclick="location.href='#'">
		<table>
			<tr>
				<td>&nbsp;&nbsp;<img src="resources/image/report.png" width="70"></td>
				<td>
					<span style="font-size: 18pt; font-weight: bold;">퍼스널 컬러 별 특징이 궁금하다면?</span><br>
					<span style="font-size: 13pt; color: graytext;">진단받은 컬러의 특징을 알려드릴게요.</span>
				</td>
			</tr>
		</table>
	</div>
</center>

<img src="resources/image/main2.png" width="100%" style="padding: 60px 0px 200px 0px;">

<%@ include file="footer.jsp" %>