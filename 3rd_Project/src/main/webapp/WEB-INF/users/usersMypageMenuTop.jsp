<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	#none_under{
		text-decoration: none;
		color: black;
	}
	#none_under:hover {
		color: #A6A6A6;
	}
	#content td{
		padding-left: 25px; 
	}
	ul{
		line-height: 180%;
	}
}
</style>
    
<%@ include file="../views/header.jsp" %>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	/* function msg(){
		if(confirm('탈퇴하면 포인트가 삭제됩니다. 정말로 탈퇴하시겠습니까?'))
			location.href = 'delete.u?u_id=${loginInfo.u_id }';
	} */
	
	$(document).ready(function() {
		resizeContent();
	});

	function resizeContent() {
		var contentHeight = $("#content").height();
		$('#nav').css({'height':contentHeight+340+'px'});
	}
</script>

<table>
	<tr>
		<td>
			<div id="nav" style="width: 200px; background: #F6F6F6; margin-left: 300px; border-radius: 20px; font-family: 'RIDIBatang'; padding: 40px 30px 40px 30px;">
				
				<div style="font-size: 20pt; margin: 0px 0px 15px 7px; font-family: 'MaruBuri-Regular'; font-weight: bold;">
					<a href="mypage.u" id="none_under">마이페이지</a>
				</div>
				<hr>
				<br>
				
				<b>회원정보</b>
				<ul>
					<li><a href="mypage.u" id="none_under">회원정보 조회</a></li>
					<li><a href="update.u" id="none_under">회원정보 수정</a></li>
					<!-- <input type="button" value="회원정보 수정하기" onClick="location.href='update.u'"> -->
					<li><a href="#" id="none_under">회원탈퇴</a></li>
					<!-- <input type="button" value="회원탈퇴" onClick="msg()"> -->
				</ul>
				<br>
				
				<b>게시물 관리</b>
				<ul>
					<li><a href="#" id="none_under">후기 게시판</a></li>
					<li><a href="#" id="none_under">문의 게시판</a></li>
				</ul>
				<br>
				
				<b>나의 쇼핑</b>
				<ul style="line-height: 180%;">
					<li><a href="#" id="none_under">주문내역 조회</a></li>
				</ul>
				
				<!-- <a href="changepw.u" id="none_under">비밀번호 변경</a> -->
			</div>
		</td>
		<td valign="top">
			<div id="content" style="width: 1060px; border-radius: 20px; box-shadow: 5px 5px 10px 0px #BDBDBD; padding: 40px; padding-bottom: 300px; font-family: 'RIDIBatang';">
				
