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
			<input type="text" name="u_phone" required> - 
			<input type="text" name="u_phone" required>
		</td>
	</tr>
	<tr>
		<td>주소</td>
		<td>
			<!-- 주소 api 연동 -->
			<input type="text" name="u_address" placeholder="" required>
		</td>
	</tr>
	<!-- <tr>
		<td>*결제수단</td>
		<td>
			<input type="text" name="u_pay" value="" placeholder="" required>
		</td>
	</tr> -->
	<tr>
		<td colspan="2" align="center"><input type="submit" value="가입하기"></td>
	</tr>
</table>
</form>
</div>
<%@ include file="../views/footer.jsp" %>