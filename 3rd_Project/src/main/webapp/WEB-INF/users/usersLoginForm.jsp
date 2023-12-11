<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../views/header.jsp" %>

<style>
	table{
		font-family: 'RIDIBatang'; 
		font-size: 11pt;
		width: 350px;
		height: 100px;
	}
</style>
<div id="center" style="text-align: center;">
<br><br>
<hr style="border: 2px solid black; width: 80%; margin: auto;">
<br><br>
<div>
	<span style="font-family: 'MaruBuri-Regular'; font-size: 35pt; font-weight: bold;">LOGIN</span><br>
	<span style="font-family: 'RIDIBatang'; font-size: 12pt; color: graytext;">회원전용서비스</span><br><br><br>
	<span style="font-family: 'RIDIBatang'; font-size: 12pt; line-height: 180%;">
		로그인 이후에 이용하실 수 있습니다.<br>
		아이디와 비밀번호를 입력해주세요.<br>
		아직 회원이 아니시라면, 회원가입을 먼저 진행해주세요.
	</span>
</div>
<br><br> 

<hr style="width: 70%; margin: auto;">
<br>
<form action="login.u" method="post">
	<table style="margin: auto;">
		<tr>
			<td>
				<table border="1">
					<tr>
						<td>아이디</td>
						<td><input type="text" name="u_id" required></td>
						<td rowspan="2"><input type="submit" value="로그인"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="u_password" required></td>
					</tr>
					<!-- api 연동 -->
				</table>
			</td>
			<td>
				<table style="text-align: left; margin-left: 20px; width: 320px;"> 
					<tr>
						<td>아직 회원이 아니신가요?</td>
						<td><input type="button" value="회원가입" onClick="location.href='register.u'"></td>
					</tr>
					<tr>
						<td>아이디를 잃어버리셨나요?</td>
						<td><input type="button" value="아이디 찾기" onClick="location.href='findid.u'"></td>
					</tr>
					<tr>
						<td>비밀번호를 잃어버리셨나요?</td>
						<td><input type="button" value="비밀번호 찾기" onClick="location.href='findpw.u'"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
<br>
<hr style="width: 70%; margin: auto;"> 
</div>
<%@ include file="../views/footer.jsp" %>