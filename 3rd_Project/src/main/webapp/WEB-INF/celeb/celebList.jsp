<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../views/header.jsp"%>
<script type="text/javascript">
	$(function(){
		if($("#btn_splt").click(function(){
			$("#decoration").css({"background-image":"url('resources/image/spring_bg.jpg')"});
			$("#splt").show();
			$("#spbr").hide();
			$("#smlt").hide();
			$("#smbr").hide();
			$("#smmt").hide();
			$("#atmt").hide();
			$("#atst").hide();
			$("#atdp").hide();
			$("#wtbr").hide();
			$("#wtdp").hide();
		}));
		
		if($("#btn_spbr").click(function(){
			$("#decoration").css({"background-image":"url('resources/image/summer_bg.jpg')"});
			$("#splt").hide();
			$("#spbr").show();
			$("#smlt").hide();
			$("#smbr").hide();
			$("#smmt").hide();
			$("#atmt").hide();
			$("#atst").hide();
			$("#atdp").hide();
			$("#wtbr").hide();
			$("#wtdp").hide();
		}));
		
		if($("#btn_smlt").click(function(){
			$("#decoration").css({"background-image":"url('resources/image/autumn_bg.jpeg')"});
			$("#splt").hide();
			$("#spbr").hide();
			$("#smlt").show();
			$("#smbr").hide();
			$("#smmt").hide();
			$("#atmt").hide();
			$("#atst").hide();
			$("#atdp").hide();
			$("#wtbr").hide();
			$("#wtdp").hide();
		}));
		
		if($("#btn_smbr").click(function(){
			$("#decoration").css({"background-image":"url('resources/image/winter_bg.jpg')"});
			$("#splt").hide();
			$("#spbr").hide();
			$("#smlt").hide();
			$("#smbr").show();
			$("#smmt").hide();
			$("#atmt").hide();
			$("#atst").hide();
			$("#atdp").hide();
			$("#wtbr").hide();
			$("#wtdp").hide();
		}));
		
		if($("#btn_smmt").click(function(){
			$("#decoration").css({"background-image":"url('resources/image/winter_bg.jpg')"});
			$("#splt").hide();
			$("#spbr").hide();
			$("#smlt").hide();
			$("#smbr").hide();
			$("#smmt").show();
			$("#atmt").hide();
			$("#atst").hide();
			$("#atdp").hide();
			$("#wtbr").hide();
			$("#wtdp").hide();
		}));
		
		if($("#btn_atmt").click(function(){
			$("#decoration").css({"background-image":"url('resources/image/winter_bg.jpg')"});
			$("#splt").hide();
			$("#spbr").hide();
			$("#smlt").hide();
			$("#smbr").hide();
			$("#smmt").hide();
			$("#atmt").show();
			$("#atst").hide();
			$("#atdp").hide();
			$("#wtbr").hide();
			$("#wtdp").hide();
		}));
		
		if($("#btn_atst").click(function(){
			$("#decoration").css({"background-image":"url('resources/image/winter_bg.jpg')"});
			$("#splt").hide();
			$("#spbr").hide();
			$("#smlt").hide();
			$("#smbr").hide();
			$("#smmt").hide();
			$("#atmt").hide();
			$("#atst").show();
			$("#atdp").hide();
			$("#wtbr").hide();
			$("#wtdp").hide();
		}));
		
		if($("#btn_atdp").click(function(){
			$("#decoration").css({"background-image":"url('resources/image/winter_bg.jpg')"});
			$("#splt").hide();
			$("#spbr").hide();
			$("#smlt").hide();
			$("#smbr").hide();
			$("#smmt").hide();
			$("#atmt").hide();
			$("#atst").hide();
			$("#atdp").show();
			$("#wtbr").hide();
			$("#wtdp").hide();
		}));
		
		if($("#btn_wtbr").click(function(){
			$("#decoration").css({"background-image":"url('resources/image/winter_bg.jpg')"});
			$("#splt").hide();
			$("#spbr").hide();
			$("#smlt").hide();
			$("#smbr").hide();
			$("#smmt").hide();
			$("#atmt").hide();
			$("#atst").hide();
			$("#atdp").hide();
			$("#wtbr").show();
			$("#wtdp").hide();
		}));
		
		if($("#btn_wtdp").click(function(){
			$("#decoration").css({"background-image":"url('resources/image/winter_bg.jpg')"});
			$("#splt").hide();
			$("#spbr").hide();
			$("#smlt").hide();
			$("#smbr").hide();
			$("#smmt").hide();
			$("#atmt").hide();
			$("#atst").hide();
			$("#atdp").hide();
			$("#wtbr").hide();
			$("#wtdp").show();
		}));
	});
</script>



<style>
	#mainArea{
		text-align: center;
		margin-right:60%;
		margin-top:10%;
	}
	#btn_splt, #btn_spbr, #btn_smlt, #btn_smbr, #btn_smmt, #btn_atmt, #btn_atst, #btn_atdp, #btn_wtbr, #btn_wtdp {
		border: 1px solid #EAEAEA;
		background: white;
		font-family: 'RIDIBatang';
		font-size: 13pt;
	}
	#btn_splt:hover {
		background: #EDE5D8;
		color: white;
	}
	#btn_spbr:hover {
		background: #B3B3CE;
		color: white;
	}
	#btn_smlt:hover {
		background: #C98BA4;
		color: white;
	}
	#btn_smbr:hover {
		background: #7C81BB;
		color: white;
	}
	#btn_smmt:hover {
		background: #EDE5D8;
		color: white;
	}
	#btn_atmt:hover {
		background: #B3B3CE;
		color: white;
	}
	#btn_atst:hover {
		background: #C98BA4;
		color: white;
	}
	#btn_atdp:hover {
		background: #7C81BB;
		color: white;
	}
	#btn_wtbr:hover {
		background: #EDE5D8;
		color: white;
	}
	#btn_wtdp:hover {
		background: #B3B3CE;
		color: white;
	}
}
</style>


<article id="center">

<form action="celebDetail.cel" method="post">
<div id="mainArea">
	<div class="btn-group" role="group" style="width: 300px; margin: auto;">
		<input type="button" class="btn" id="btn_splt" name="cl_color" value="봄 라이트">
		<input type="button" class="btn" id="btn_spbr" name="cl_color" value="봄 브라이트"> 
		<input type="button" class="btn" id="btn_smlt" name="cl_color" value="여름 라이트"> 
		<input type="button" class="btn" id="btn_smbr" name="cl_color" value="여름 브라이트">
		<input type="button" class="btn" id="btn_smmt" name="cl_color" value="여름 뮤트"> 
		<input type="button" class="btn" id="btn_atmt" name="cl_color" value="가을 뮤트">
		<input type="button" class="btn" id="btn_atst" name="cl_color" value="가을 스트롱">
		<input type="button" class="btn" id="btn_atdp" name="cl_color" value="가을 딥">
		<input type="button" class="btn" id="btn_wtbr" name="cl_color" value="겨울 브라이트">
		<input type="button" class="btn" id="btn_wtdp" name="cl_color" value="겨울 딥">
	</div>
</div>
	</form>
	<br><br><br><br>
	<div id="decoration">
	<br><br><br>
		<div id="btn_splt">
			<span id="seasonArea">봄 라이트</span><br><br>
			<c:forEach var="list" items="${list}">
				<span id="sDetailArea">	${list.cl_name} </span><br><br>
				<img src="resources/image/${list.cl_image}" id="seasonImg">
			</c:forEach>
		</div>

        <!-- top subjects End -->
</article>
<%@ include file="./../views/footer.jsp"%>