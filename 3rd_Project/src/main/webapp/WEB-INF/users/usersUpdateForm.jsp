<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	#content_update th{
		text-align: left; 
		background: #F6F6F6;
		padding-left: 20px;
	}
	#content_update{
		width: 90%; 
		height: 400px; 
		text-align: left;
	}
</style>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(function(){
		$("#zip").click(function(){
			alert("우편번호 찾기 버튼을 이용해주세요.");
		});
		$("#road").click(function(){
			alert("우편번호 찾기 버튼을 이용해주세요.");
		});
	});

	function msg(){
		if(confirm('입력하신 정보로 수정 하시겠습니까?'))
			return true;
		else
			return false;
	}
</script>

<%@ include file="usersMypageMenuTop.jsp" %>

<div style="margin: 0px 0px 28px 5px; font-size: 10pt;">
	<a href="mypage.u" id="none_under">마이페이지</a> > 회원정보 > <a href="update.u" id="none_under">회원정보 수정</a>
</div>
<hr style="margin-bottom: 50px;">

<ul>
	<li><big><b>회원정보 수정</b></big></li>
	<br><br>
	<c:if test="${loginInfo.u_jointype != 'S'}">
		<span style="font-size: 11pt; line-height: 180%;">
		<u>네이버, 카카오, 구글 연동</u>으로 가입하신 회원님은 <font style="color: red;">필수 정보를 반드시 업데이트</font> 해 주셔야 정상적으로 이용하실 수 있습니다.<br>
		번거로우시더라도 잠깐 시간 내시어 정보 업데이트 부탁 드립니다. :)
		</span>
		<br><br><br> 
	</c:if>
	
	<div>
		<form action="update.u" method="post" onSubmit="return msg()">
			<input type="hidden" name="u_name" value="${loginInfo.u_name }">
			<input type="hidden" name="u_id" value="${loginInfo.u_id }">
			<table id="content_update">
				<tr style="border-top: 1px solid #D5D5D5; height: 14%;">
					<th>&nbsp;&nbsp;이름</th>
					<td>${loginInfo.u_name}</td>
				</tr>
				<tr style="border-top: 1px dotted #EAEAEA; border-bottom: 1px dotted #EAEAEA; height: 14%;">
					<th>&nbsp;&nbsp;아이디</th>
					<td>
						<c:if test="${loginInfo.u_jointype eq 'S'}">${loginInfo.u_id }</c:if>
						<c:if test="${loginInfo.u_jointype eq 'N'}">네이버 연동</c:if> 
						<c:if test="${loginInfo.u_jointype eq 'K'}">카카오 연동</c:if>
					</td>
				</tr>
				<tr style="border-top: 1px dotted #EAEAEA; border-bottom: 1px dotted #EAEAEA; height: 14%;">
					<th><font color="red">*</font> 전화번호</th>
					<td>
						<c:set var="firstList">010, 011, 016, 017, 018, 019</c:set>
						<select name="u_phone" class="form-select" style="width: 12%; display: inline;">
							<c:forEach var="first" items="${firstList }">
								<option value="${first }"
									<c:if test="${fn:split(loginInfo.u_phone, '-')[0] eq first }">selected</c:if>>${first }</option>
							</c:forEach>
						</select>
						-
						<input type="text" class="form-control" name="u_phone" style="width: 12%; display: inline; text-align: center;" value="${fn:split(loginInfo.u_phone, '-')[1]}" maxlength="4" required> - 
						<input type="text" class="form-control" name="u_phone" style="width: 12%; display: inline; text-align: center;" value="${fn:split(loginInfo.u_phone, '-')[2]}" maxlength="4" required>
						</td>
				</tr>
				<tr style="border-top: 1px dotted #EAEAEA; border-bottom: 1px dotted #EAEAEA;">
					<th>&nbsp;&nbsp;주소</th>
					<td>
						<input type="text" class="form-control" name="u_address" id="zip" style="display: inline; width: 50%; margin-bottom: 5px;" value="${loginInfo.u_address eq '-' ? '': fn:split(loginInfo.u_address, ',')[0]}" id="sample4_postcode" placeholder="우편번호" readonly> 
						<input type="button" class="btn btn-outline-secondary" style="margin-bottom: 5px; height: 37px;" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" class="form-control" name="u_address" id="road" style="width: 90%; margin-bottom: 5px;" value="${loginInfo.u_address eq '-' ? '': fn:split(loginInfo.u_address, ',')[1]}" id="sample4_roadAddress" placeholder="도로명주소" readonly> 
						<span id="guide" style="color: #999; display: none"></span>
						<input type="text" class="form-control" name="u_address" style="width: 90%; margin-bottom: 5px;" value="${loginInfo.u_address eq '-' ? '': fn:split(loginInfo.u_address, ',')[2]}" id="sample4_detailAddress" placeholder="상세주소"></td>
				</tr>
				<!-- <tr>
						<th>* 결제수단</th>
						<td>
							<input type="text" name="u_pay" value="" placeholder="" required>
						</td>
				</tr> -->
				<tr style="border-bottom: 1px solid #D5D5D5; height: 14%;">
					<th><font color="red">*</font> 퍼스널 컬러</th>
					<td>
						<c:set var="pcList">잘 모르겠음,봄 라이트,봄 브라이트,여름 라이트,여름 브라이트,여름 뮤트,가을 뮤트,가을 스트롱,가을 딥,겨울 브라이트,겨울 딥</c:set>
						<select name="u_color" class="form-select" style="width: 90%;">
							<c:forEach var="pc" items="${pcList}">
								<option value="${pc}"
									<c:if test="${pc eq loginInfo.u_color }">selected</c:if>>${pc}</option>
							</c:forEach>
					</select></td>
				</tr>
			</table>
			<br><br>
			<input type="submit" class="btn btn-outline-secondary" style="margin-left: 37%;" value="수정하기">
			<input type="reset" class="btn btn-outline-secondary" value="되돌리기">
		</form>
	</div>
</ul>
<br>

<%@ include file="usersMypageMenuBottom.jsp" %>
