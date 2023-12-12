<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../views/header.jsp" %>
<script>
	function msg(){
		if(confirm('탈퇴하면 포인트가 삭제됩니다. 정말로 탈퇴하시겠습니까?'))
			location.href = 'delete.u?u_id=${loginInfo.u_id }';
	}
</script>
<div id="center">
<a href="mypage.u">마이페이지</a> | <a href="changepw.u">비밀번호 변경</a>
<h1>반갑습니다, ${loginInfo.u_name }님!</h1>
<br>
>회원정보<br>
<table border="1">
	<tr>
		<th>아이디</th>
		<td>${loginInfo.u_id }</td>
		<th>휴대전화번호</th>
		<td>${loginInfo.u_phone }</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>${fn:split(loginInfo.u_address, ',')[1] } ${fn:split(loginInfo.u_address, ',')[2] } (${fn:split(loginInfo.u_address, ',')[0] })</td>
		<th>퍼스널컬러</th>
		<td>${loginInfo.u_color }</td>
	</tr>
</table>
<input type="button" value="회원정보 수정하기" onClick="location.href='update.u'"><br><br>
>작성한 글 <br>
>주문내역 <br><br>
<input type="button" value="회원탈퇴" onClick="msg()">
</div>
<%@ include file="../views/footer.jsp" %>