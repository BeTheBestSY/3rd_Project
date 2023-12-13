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
	table th{
		text-align: center; 
		background: #F6F6F6;
	}
	table td{
		padding-left: 10px;
	}
	ul{
		line-height: 180%;
	}
}
</style>
    
<%@ include file="../views/header.jsp" %>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function msg(){
		if(confirm('탈퇴하면 포인트가 삭제됩니다. 정말로 탈퇴하시겠습니까?'))
			location.href = 'delete.u?u_id=${loginInfo.u_id }';
	}
	
	$(document).ready(function() {
		resizeContent();
	});

	$(window).resize(function() {
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
					<li><a href="#" id="none_under">회원정보 수정</a></li>
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
				<div style="margin-bottom: 50px; font-size: 10pt;">
					<a href="mypage.u" id="none_under">마이페이지</a> > 회원정보 > <a href="mypage.u" id="none_under">회원정보 조회</a>
				</div>
				
				<div style="font-family: 'MaruBuri-Regular'; font-size: 25pt; font-weight: bold; margin-bottom: 50px;">
					반갑습니다, ${loginInfo.u_name}님!
				</div>
				
				<ul>
					<li><big>회원정보 조회</big></li>
						<br>
						<div>
							<table style="width: 90%; height: 150px;">
								<tr style="border-top: 1px solid #D5D5D5;">
									<th>아이디</th>
									<td colspan="3">${loginInfo.u_id}</td>
								</tr>
								<tr style="border-top: 1px dotted #EAEAEA; border-bottom: 1px dotted #EAEAEA;">
									<th width="20%">이름</th>
									<td width="30%">${loginInfo.u_name}</td>
									<th width="20%">전화번호</th>
									<td width="30%">${loginInfo.u_phone}</td>
								</tr>
								<tr style="border-top: 1px dotted #EAEAEA; border-bottom: 1px dotted #EAEAEA;">
									<th>퍼스널 컬러</th>
									<td>${loginInfo.u_color}</td>
									<th>보유 포인트</th>
									<td>${loginInfo.u_point} points</td>
								</tr>
								<tr style="border-bottom: 1px solid #D5D5D5;">
									<th>주소</th>
									<td colspan="3">${fn:split(loginInfo.u_address, ',')[1] } ${fn:split(loginInfo.u_address, ',')[2] } (${fn:split(loginInfo.u_address, ',')[0] })</td>
								</tr>
							</table>
						</div>
						<br><br>
				</ul>
				
				<br>
				
				
			</div>
		</td>
	</tr>
</table>

<%@ include file="../views/footer.jsp" %>
