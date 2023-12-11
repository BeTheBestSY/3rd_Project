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
		text-align: left;
	}
	td{
		padding: 0px 0px 10px 10px; 
	}
	#btn{
		width: 120px;
		height: 40px;
		margin-left: 5px;
		background: #EAEAEA;
		border: none;
		border-radius: 3px;
		font-size: 12pt;
	}
	#btn:hover {
		background: #BDBDBD;
		color: white;
	}
</style>
<div id="center" style="text-align: center;">
	<br><br><br><br>
	<div>
		<span style="font-family: 'MaruBuri-Regular'; font-size: 35pt; font-weight: bold;">비밀번호 찾기</span>
		<br><br>
		<span style="font-family: 'RIDIBatang'; font-size: 11pt; line-height: 180%;">
			가입 시 입력하신 성함, 아이디, 전화번호를 입력해주세요.<br>
			해당 정보를 바탕으로 아이디를 찾아드릴게요!
		</span>
	</div>
	<br><br><br> 
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
				<td>전화번호</td>
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