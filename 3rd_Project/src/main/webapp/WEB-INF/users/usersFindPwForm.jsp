<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../views/header.jsp" %>
<style>
	table{
		font-family: 'RIDIBatang'; 
		font-size: 11pt;
		width: 400px;
		height: 100px;
		margin: auto;
	}
</style>
<div id="center" style="text-align: center;">
<br><br>
<hr style="border: 2px solid black; width: 80%; margin: auto;">
<br><br>
	<h1>비밀번호 찾기</h1>
	<form action="findpw.u" method="post">
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="u_name" required></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="u_id" required></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td>
					<c:set var="firstList">010, 011, 016, 017, 018, 019</c:set>
					<select name="u_phone">
						<c:forEach var="first" items="${firstList }">
							<option value="${first }">${first }</option>
						</c:forEach>
					</select> - 
					<input type="text" name="u_phone" maxlength="4" size="6" required> - 
					<input type="text" name="u_phone" maxlength="4" size="6" required>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="찾기"></td>
			</tr>
		
		</table>
	</form>
</div>
<%@ include file="../views/footer.jsp" %>