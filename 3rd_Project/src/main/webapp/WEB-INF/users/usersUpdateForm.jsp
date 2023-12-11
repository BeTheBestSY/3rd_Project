<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	th{
		
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
<%@ include file="../views/header.jsp" %>
<div id="center" style="text-align: center;">
	<br><br><br><br>
	<div>
		<span style="font-family: 'MaruBuri-Regular'; font-size: 40pt; font-weight: bold;">UPDATE</span><br>
	</div>
	<div>
	<form action="update.u" method="post" onSubmit="return msg()">
		<input type="hidden" name="u_name" value="${ub.u_name }">
		<input type="hidden" name="u_id" value="${ub.u_id }">
		<table border="1" style="margin: auto; text-align: left;">
			<tr>
				<th>* 이름</th>
				<td>${ub.u_name }</td>
			</tr>
			<tr>
				<th>* 아이디</th>
				<td>${ub.u_id }</td>
			</tr>
			<tr>
				<th>* 휴대전화번호</th>
				<td>
					<c:set var="firstList">010, 011, 016, 017, 018, 019</c:set>
					<select name="u_phone">
						<c:forEach var="first" items="${firstList }">
							<option value="${first }" <c:if test="${fn:split(ub.u_phone, '-')[0] eq first }">selected</c:if>>${first }</option>
						</c:forEach>
					</select>
					<input type="text" name="u_phone" value="${fn:split(ub.u_phone, '-')[1]}" maxlength="4" required> - 
					<input type="text" name="u_phone" value="${fn:split(ub.u_phone, '-')[2]}" maxlength="4" required>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<!-- 05502,서울 송파구 한가람로 65,103호 -->
				<!-- 서울 송파구 한가람로 65, 103호 (05502) -->
				<td>
					<input type="text" name="u_address" value="${fn:split(ub.u_address, ',')[0]}" id="sample4_postcode" placeholder="우편번호" value="">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name="u_address" value="${fn:split(ub.u_address, ',')[1]}" id="sample4_roadAddress" placeholder="도로명주소">
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" name="u_address" value="${fn:split(ub.u_address, ',')[2]}" id="sample4_detailAddress" placeholder="상세주소">
				</td>
			</tr>
			<!-- <tr>
				<th>* 결제수단</th>
				<td>
					<input type="text" name="u_pay" value="" placeholder="" required>
				</td>
			</tr> -->
			<tr>
				<th>* 퍼스널컬러</th>
				<td>
					<c:set var="pcList">봄 라이트,봄 브라이트,여름 라이트,여름 브라이트,여름 뮤트,가을 뮤트,가을 스트롱,가을 딥,겨울 브라이트,겨울 딥,잘 모르겠음</c:set>
					<select name="u_color">
						<c:forEach var="pc" items="${pcList }">
							<option value="${pc }" <c:if test="${pc eq ub.u_color }">selected</c:if>>${pc }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="수정하기"></td>
			</tr>
		</table>
	</form>
	</div>
</div>

<%@ include file="../views/footer.jsp" %>