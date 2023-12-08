<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../views/header.jsp" %>
<div id="center">
<h1>회원가입화면(usersRegisterForm.jsp)</h1>
<form action="register.u" method="post">
<table border="1">
	<tr>
		<td>아이디</td>
		<td>
			<input type="text" name="u_id" placeholder="대/소문자, 숫자 포함 6자리 이상" required>
		</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>
			<input type="text" name="u_name" required>
		</td>
	</tr>
	<tr>
		<td>패스워드</td>
		<td>
			<input type="text" name="u_password" placeholder="대/소문자, 숫자 포함 8자리 이상"" required>
		</td>
	</tr>
	<tr>
		<td>휴대전화번호</td>
		<td>
			<c:set var="firstList">010, 011, 016, 017, 018, 019</c:set>
			<select name="u_phone">
				<c:forEach var="first" items="${firstList }">
					<option value="${first }">${first }</option>
				</c:forEach>
			</select>
			<input type="text" name="u_phone" maxlength="4" required> - 
			<input type="text" name="u_phone" maxlength="4" required>
		</td>
	</tr>
	<tr>
		<td>주소</td>
		<td>
			<input type="text" name="u_address" id="sample4_postcode" placeholder="우편번호">
			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" name="u_address" id="sample4_roadAddress" placeholder="도로명주소">
			<span id="guide" style="color:#999;display:none"></span>
			<input type="text" name="u_address" id="sample4_detailAddress" placeholder="상세주소">
		</td>
	</tr>
	<!-- <tr>
		<td>*결제수단</td>
		<td>
			<input type="text" name="u_pay" value="" placeholder="" required>
		</td>
	</tr> -->
	<tr>
		<td>퍼스널컬러</td>
		<td>
			<c:set var="pcList">봄 라이트,봄 브라이트,여름 라이트,여름 브라이트,여름 뮤트,가을 뮤트,가을 스트롱,가을 딥,겨울 브라이트,겨울 딥,잘 모르겠음</c:set>
			<select name="u_color">
				<c:forEach var="pc" items="${pcList }">
					<option value="${pc }">${pc }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="가입하기"></td>
	</tr>
</table>
</form>
</div>
<%@ include file="../views/footer.jsp" %>