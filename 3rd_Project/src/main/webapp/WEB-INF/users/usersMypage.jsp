<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	table th{
		text-align: left; 
		background: #F6F6F6;
		padding-left: 20px;
	}
</style>

<%@ include file="usersMypageMenuTop.jsp" %>

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
		<table style="width: 90%; height: 170px; text-align: left;" id="content">
			<tr style="border-top: 1px solid #D5D5D5;">
				<th>아이디</th>
				<td colspan="3"><c:if test="${loginInfo.u_link eq 'S' }">${loginInfo.u_id }</c:if>
					<c:if test="${loginInfo.u_link eq 'N' }">네이버 연동</c:if> <c:if
						test="${loginInfo.u_link eq 'K' }">카카오 연동</c:if></td>
			</tr>
			<tr style="border-top: 1px dotted #EAEAEA; border-bottom: 1px dotted #EAEAEA;">
				<th width="15%">이름</th>
				<td width="35%">${loginInfo.u_name}</td>
				<th width="15%">전화번호</th>
				<td width="35%"><c:if test="${loginInfo.u_link eq 'S' }">${loginInfo.u_phone }</c:if>
					<c:if test="${loginInfo.u_link eq 'N' || loginInfo.u_link eq 'K'}">필수 입력 사항입니다.</c:if>
				</td>
			</tr>
			<tr
				style="border-top: 1px dotted #EAEAEA; border-bottom: 1px dotted #EAEAEA;">
				<th>퍼스널 컬러</th>
				<td>${loginInfo.u_color}</td>
				<th>보유 포인트</th>
				<td>${loginInfo.u_point} points</td>
			</tr>
			<tr style="border-bottom: 1px solid #D5D5D5;">
				<th>주소</th>
				<td colspan="3">${fn:split(loginInfo.u_address, ',')[1] }
					${fn:split(loginInfo.u_address, ',')[2] }
					(${fn:split(loginInfo.u_address, ',')[0] })</td>
			</tr>
		</table>
	</div>
</ul>
<br>

<%@ include file="usersMypageMenuBottom.jsp" %>
