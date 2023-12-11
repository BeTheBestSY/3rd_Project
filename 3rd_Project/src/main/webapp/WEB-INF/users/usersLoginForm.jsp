<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../views/header.jsp" %>

<style>
	table{
		font-family: 'RIDIBatang'; 
		font-size: 11pt;
		width: 400px;
		height: 100px; 
	}
	#loginBtn{
		width: 100%;
		height: 90%;
		margin-left: 5px;
		color: white;
		background: #7C81BB;
		border: none;
		border-radius: 3px;
	}
	#loginBtn:hover{
		background: #B3B3CE;
	}
	#verticalLine{
		width: 1px;
		height: 100%;
		background: #D5D5D5; 
		margin: auto;
		display: inline-block;
		top: -10px;
		position: relative;
	}
	#etcBtn{
		width: 100px;
		height: 30px;
		margin-left: 5px;
		background: #EAEAEA;
		border: none;
		border-radius: 3px;
		font-size: 10pt;
	}
	#etcBtn:hover {
		background: #BDBDBD;
		color: white;
	}
}
</style>
<div id="center" style="text-align: center;">
<br><br><br><br>
<div>
	<span style="font-family: 'MaruBuri-Regular'; font-size: 40pt; font-weight: bold;">LOGIN</span><br>
	<span style="font-family: 'RIDIBatang'; font-size: 12pt; color: graytext;">회원 전용 서비스</span><br><br><br>
	<span style="font-family: 'RIDIBatang'; font-size: 12pt; line-height: 180%;">
		로그인 이후에 이용하실 수 있습니다.<br>
		아이디와 비밀번호를 입력해주세요.<br>
		아직 회원이 아니시라면, 회원가입을 먼저 진행해주세요.
	</span>
</div>
<br><br><br>

<hr style="width: 70%; margin: auto;">
<br><br>
<form action="login.u" method="post">
	<table style="margin: auto;">
		<tr>
			<td>
				<table>
					<tr>
						<td width="20%">아이디</td> 
						<td width="60%"><input type="text" name="u_id" class="form-control" required></td>
						<td width="20%" rowspan="2"><input type="submit" value="로그인" id="loginBtn"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="u_password" class="form-control" required></td>
					</tr>
					<!-- api 연동 -->
				</table>
			</td>
			<td align="right" valign="middle">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div id="verticalLine"></div>
			</td>
			<td>
				<table style="text-align: left; margin-left: 20px; width: 320px;"> 
					<tr>
						<td>아직 회원이 아니신가요?</td>
<<<<<<< HEAD
						<td><input type="button" value="회원가입" onClick="location.href='register.u'"></td>
					</tr>
					<tr>
						<td>아이디를 잃어버리셨나요?</td>
						<td><input type="button" value="아이디 찾기" onClick="location.href='findid.u'"></td>
					</tr>
					<tr>
						<td>비밀번호를 잃어버리셨나요?</td>
						<td><input type="button" value="비밀번호 찾기" onClick="location.href='findpw.u'"></td>
=======
						<td><input type="button" value="회원가입" id="etcBtn" onClick="#"></td>
					</tr>
					<tr>
						<td>아이디를 잃어버리셨나요?</td>
						<td><input type="button" value="아이디 찾기" id="etcBtn" onClick="#"></td>
					</tr>
					<tr>
						<td>비밀번호를 잃어버리셨나요?</td>
						<td><input type="button" value="비밀번호 찾기" id="etcBtn" onClick="#"></td>
>>>>>>> 28442c646f164f782c7ddfde9167a2672fc2c8e1
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
<br><br>
<hr style="width: 70%; margin: auto;"> 
</div>
<%@ include file="../views/footer.jsp" %>