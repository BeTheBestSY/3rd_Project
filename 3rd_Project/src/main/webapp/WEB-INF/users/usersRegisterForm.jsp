<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	th{
		
	}
</style>

<%@ include file="../views/header.jsp" %>
<div id="center" style="text-align: center;">
	<br><br><br><br>
	<div>
		<span style="font-family: 'MaruBuri-Regular'; font-size: 40pt; font-weight: bold;">JOIN US</span><br>
		<span style="font-family: 'RIDIBatang'; font-size: 12pt; color: graytext;">회원가입을 환영합니다!</span><br><br><br>
	</div>
	<div>
		<form action="register.u" method="post">
		<table border="1" style="margin: auto; text-align: left;">
			<tr>
				<th>* 이름</th>
				<td>
					<input type="text" name="u_name" required>
				</td>
			</tr>
			<tr>
				<th>* 아이디</th>
				<td>
					<input type="text" name="u_id" placeholder="영문소문자/숫자, 4~16자" required>
					중복체크, 정규표현식 아직
				</td>
			</tr>
			<tr>
				<th>* 패스워드</th>
				<td>
					<input type="text" name="u_password" placeholder="영문 대소문자/숫자/특수문자 중 3가지 이상 조합, 8자~16자" required>
				</td>
			</tr>
			<tr>
				<th>* 휴대전화번호</th>
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
				<th>주소</th>
				<td>
					<input type="text" name="u_address" id="sample4_postcode" placeholder="우편번호">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name="u_address" id="sample4_roadAddress" placeholder="도로명주소">
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" name="u_address" id="sample4_detailAddress" placeholder="상세주소">
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
</div>

<%@ include file="../views/footer.jsp" %>