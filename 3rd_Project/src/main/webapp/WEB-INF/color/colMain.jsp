<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	#imageArea{
		width: 610px;
		height: 700px;
		overflow: hidden;
		left: -30px;
		position: relative;
	}
	#image1, #image2, #image3, #image4, #image5{
		width: 281px;
		height: 374px;
		border-radius: 15px 15px 15px 15px;
	}
	#image1{
		background: #7C81BB;
		left: 0px;
		top: 30px;
		position: relative;
		overflow: hidden;
	}
	#image2{
		background: #B3B3CE;
		left: 0px;
		top: 60px;
		position: relative;
		overflow: hidden;
	}
	#image3{
		background: #D0D6CE;
		left: 310px;
		top: -930px;
		position: relative;
		overflow: hidden;
	}
	#image4{
		background: #EDE5D8;
		left: 310px;
		top: -900px;
		position: relative;
		overflow: hidden;
	}
	#image5{
		background: #E7B3CE;
		left: 310px;
		top: -870px;
		position: relative;
		overflow: hidden;
	}
	#colorTitle{
		font-family: 'MaruBuri-Regular';
		font-size: 35pt;
		font-weight: bold;
		padding: 100px 0px 30px 0px;
	}
	#colorContents{
		font-family: 'RIDIBatang';
		font-size: 9pt;
		line-height: 180%;
		color: graytext;
		margin-bottom: 70px;
		padding-left: 20px;
	}
	#btn{
		width: 350px;
		height: 60px;
		border-radius: 50px 50px 50px 50px;
		border: 1px solid #7C81BB;
		margin-bottom: 15px;
		background: white;
		font-family: 'MaruBuri-Regular';
		font-size: 13pt;
		font-weight: bold;
		color: #7C81BB;
	}
	#btn:hover {
		background: #7C81BB;
		color: white;
	}
}
</style>

<%@ include file="./../views/header.jsp" %>

<article id="center">
	<br>
	<div class="row">
		<div class="col-lg-6">
			<div id="colorTitle">
				'퍼스널 컬러' 란<br>
				무엇을 말하는 걸까요?
			</div>
			<div id="colorContents">
				피부톤과 가장 어울리는 색상을 찾는 ‘색채학 이론’ 에서 발전한 개념으로,<br>
				색채의 조화와 부조화의 원리에 기초를 두고 개개인의 피부톤을 분석하는 이론입니다.<br><br>
				모든 색을 사계절 유형으로 구분하는 것이 특징이며,<br>
				퍼스널 컬러 진단을 통해 개인에게 가장 잘 어울리는 색을 분석하여<br>
				단점은 보완하고 장점을 극대화시켜 긍정적이고, 자신감 있는 이미지를 연출할 수 있습니다.
			</div>
			<input type="button" id="btn" value="컬러 별 특징 살펴보기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;GO"
				onClick="location.href='colList.col'"><br>
			<input type="button" id="btn" value="컬러 별 대표 연예인 알아보기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;GO"
				onClick="location.href='#'">
		</div>
		<div class="col-lg-6" id="imageArea">
			<div id="image1"></div>
			<div id="image2"></div>
			<div id="image3"></div>
			<div id="image4"></div>
			<div id="image5"></div>
		</div>
	</div>
	
</article>

<%@ include file="./../views/footer.jsp" %>
