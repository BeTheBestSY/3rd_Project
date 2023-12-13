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
		height: 350px; 
		text-align: left;
	}
</style>
<script>
	function msg(){
		if(confirm('입력하신 정보로 수정 하시겠습니까?'))
			return true;
		else
			return false;
	}
</script>

<%@ include file="usersMypageMenuTop.jsp" %>

<div style="margin-bottom: 50px; font-size: 10pt;">
	<a href="mypage.u" id="none_under">마이페이지</a> > 회원정보 > <a href="update.u" id="none_under">회원정보 수정</a>
</div>

<ul>
	<li><big>회원정보 수정</big></li>
	<br>
	<div>
		<form action="update.u" method="post" onSubmit="return msg()">
			<input type="hidden" name="u_name" value="${ub.u_name }"> 
			<input type="hidden" name="u_id" value="${ub.u_id }">
			<table id="content_update">
				<tr style="border-top: 1px solid #D5D5D5;">
					<th>* 이름</th>
					<td>${loginInfo.u_name}</td>
				</tr>
				<tr style="border-top: 1px dotted #EAEAEA; border-bottom: 1px dotted #EAEAEA;">
					<th>* 아이디</th>
					<td>
						<c:if test="${loginInfo.u_link eq 'S' }">${loginInfo.u_id }</c:if>
						<c:if test="${loginInfo.u_link eq 'N' }">네이버 연동</c:if> 
						<c:if test="${loginInfo.u_link eq 'K' }">카카오 연동</c:if>
					</td>
				</tr>
				<tr style="border-top: 1px dotted #EAEAEA; border-bottom: 1px dotted #EAEAEA;">
					<th>* 휴대전화번호</th>
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
						<input type="text" name="u_address" value="${loginInfo.u_address eq '-' ? '': fn:split(loginInfo.u_address, ',')[0]}" id="sample4_postcode" placeholder="우편번호"> 
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" name="u_address" value="${loginInfo.u_address eq '-' ? '': fn:split(loginInfo.u_address, ',')[1]}" id="sample4_roadAddress" placeholder="도로명주소"> 
						<span id="guide" style="color: #999; display: none"></span> 
						<input type="text" name="u_address" value="${loginInfo.u_address eq '-' ? '': fn:split(loginInfo.u_address, ',')[2]}" id="sample4_detailAddress" placeholder="상세주소"></td>
				</tr>
				<!-- <tr>
						<th>* 결제수단</th>
						<td>
							<input type="text" name="u_pay" value="" placeholder="" required>
						</td>
				</tr> -->
				<tr style="border-bottom: 1px solid #D5D5D5;">
					<th>* 퍼스널컬러</th>
					<td><c:set var="pcList">봄 라이트,봄 브라이트,여름 라이트,여름 브라이트,여름 뮤트,가을 뮤트,가을 스트롱,가을 딥,겨울 브라이트,겨울 딥,잘 모르겠음</c:set>
						<select name="u_color">
							<c:forEach var="pc" items="${pcList }">
								<option value="${pc }"
									<c:if test="${pc eq loginInfo.u_color }">selected</c:if>>${pc }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="수정하기"></td>
				</tr>
			</table>
		</form>
	</div>
</ul>
<br>

<%@ include file="usersMypageMenuBottom.jsp" %>
