<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../views/header.jsp" %>
<script>
	function msg(){
		if(confirm('변경 하시겠습니까?'))
			return true;
		else
			return false;
	}
</script>
<div id="center">
<form action="changepw.u" method="post" onSubmit="return msg()">
	<table border="1">
		<tr>
			<th>기존 비밀번호</th>
			<td><input type="password" name="old_password" value="${param.old_password }" required></td>
		</tr>
		<tr>
			<th>변경할 비밀번호</th>
			<td><input type="password" name="new_password" value="${param.new_password }" required></td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" name="new_password_chk" value="${param.new_password_chk }" required></td>
		</tr>
	</table>
	<input type="submit" value="비밀번호 변경하기">
</form>
</div>
<%@ include file="../views/footer.jsp" %>