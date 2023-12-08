<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../views/header.jsp" %>
 
<div id="center">
<h1>로그인화면(usersLoginForm.jsp)</h1>
<form action="login.u" method="post">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="u_id" required></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="u_password" required></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="로그인"></td>
		</tr>
		<!-- api 연동 -->
	</table>
</form>
</div id="center">
<%@ include file="../views/footer.jsp" %>