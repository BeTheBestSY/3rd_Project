<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	application.setAttribute("flag", false);
%>
<style>
	table{
		margin: auto; 
		width: 800px;
		height: 650px;
		font-family: 'RIDIBatang';
	}
	th{
		background: #EAEAEA; 
		padding-left: 10px;
	}
	td{
		padding: 0px 10px 0px 10px;
	}
	body{
		padding-top: 90px;
	}
	#searchBtn{
		width: 120px;
		height: 35px;
		margin-left: 5px;
		background: #EAEAEA;
		border: none;
		border-radius: 3px;
		font-size: 11pt;
	}
	#searchBtn:hover{
		background: #BDBDBD;
		color: white;
	}
	#subBtn{
		width: 120px;
		height: 40px;
		margin-left: 5px;
		color: white;
		background: #8C8C8C;
		border: none;
		border-radius: 3px;
		font-size: 11pt;
	}
	#subBtn:hover{
		background: #EAEAEA;
		color: black;
	}
	#resetBtn{
		width: 120px;
		height: 40px;
		margin-left: 5px;
		background: #EAEAEA;
		border: none;
		border-radius: 3px;
		font-size: 11pt;
	}
	#resetBtn:hover {
		background: #BDBDBD;
		color: white;
	}
}
</style>
<script>
	function zipClick(){
		document.getElementById("searchBtn").click();
	}
</script>

<%@ include file="../views/header.jsp" %>

<div id="center" style="text-align: center;">
	<br><br><br><br>
	<div>
		<span style="font-family: 'MaruBuri-Regular'; font-size: 40pt; font-weight: bold;">WELCOME!</span>
		<br><br> 
		<span style="font-family: 'RIDIBatang'; font-size: 12pt; color: graytext; line-height: 180%;">
			<u>FIND YOUR Hidden Beauty</u><br>
			회원가입을 환영합니다.
		</span>
		<br><br><br><br>
	</div>
	<div>
		<form action="register.u" method="post">
		<table>
			<tr style="border-top: 2px solid graytext;">
				<th width="20%"><font color="red">*</font> 이름</th>
				<td width="80%">
					<input type="text" class="form-control" name="u_name" value="${ub.u_name }" required>
				</td>
			</tr>
			<tr style="border-top: 1px solid #BDBDBD;">
				<th><font color="red">*</font> 아이디</th>
				<td>
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
					<!-- 중복체크, 정규표현식 아직 -->
=======
>>>>>>> branch 'HJ' of https://github.com/BeTheBestSY/3rd_Project.git
=======
=======
					<!-- 중복체크, 정규표현식 아직 -->
>>>>>>> 40797b2e23e86f81f690da65f87b46d5f176b23e
>>>>>>> b5d609e9a21a409f075ce3e39aa31cd1f6348f85
=======
>>>>>>> branch 'HJ' of https://github.com/BeTheBestSY/3rd_Project.git
					<input type="text" class="form-control" name="u_id" value="${ub.u_id }" placeholder="영문 소문자+숫자, 4~16자" pattern="^[A-Za-z0-9]{4,16}$" required> 
				</td>
			</tr>
			<tr style="border-top: 1px solid #BDBDBD;">
				<th><font color="red">*</font> 비밀번호</th>
				<td>
					<input type="password" class="form-control" name="u_password" value="${ub.u_password }" placeholder="영문 대소문자/숫자/특수문자 중 3가지 이상 조합, 8자~16자" required>
				</td>
			</tr>
			<tr style="border-top: 1px solid #BDBDBD;">
				<th><font color="red">*</font> 비밀번호 확인</th>
				<td>
					<input type="password" class="form-control" name="u_rePassword" required>
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
					</td>
=======
>>>>>>> branch 'HJ' of https://github.com/BeTheBestSY/3rd_Project.git
=======
=======
					</td>
>>>>>>> 40797b2e23e86f81f690da65f87b46d5f176b23e
>>>>>>> b5d609e9a21a409f075ce3e39aa31cd1f6348f85
=======
				</td>
>>>>>>> branch 'HJ' of https://github.com/BeTheBestSY/3rd_Project.git
			</tr>
			<tr style="border-top: 1px solid #BDBDBD;">
				<th><font color="red">*</font> 전화번호</th>
				<td>
					<c:set var="firstList">010, 011, 016, 017, 018, 019</c:set>
					<select name="u_phone" class="form-select" style="width: 20%; display: inline;">
						<c:forEach var="first" items="${firstList }">
							<option value="${first }" <c:if test="${fn:split(ub.u_phone, '-')[0] eq first }">selected</c:if>>${first }</option>
						</c:forEach>
					</select>
					<input type="text" class="form-control" style="width: 20%; display: inline;" name="u_phone" value="${fn:split(ub.u_phone, '-')[1]}" maxlength="4" required> - 
					<input type="text" class="form-control" style="width: 20%; display: inline;" name="u_phone" value="${fn:split(ub.u_phone, '-')[2]}" maxlength="4" required>
<<<<<<< HEAD
<<<<<<< HEAD
					</td>

					</select> - 
					<input type="text" class="form-control" style="width: 20%; display: inline;" name="u_phone" value="${fn:split(ub.u_phone, '-')[1]}" maxlength="4" required> - 
					<input type="text" class="form-control" style="width: 20%; display: inline;" name="u_phone" value="${fn:split(ub.u_phone, '-')[2]}" maxlength="4" required>
=======
>>>>>>> branch 'HJ' of https://github.com/BeTheBestSY/3rd_Project.git
				</td>
<<<<<<< HEAD

=======
>>>>>>> branch 'HJ' of https://github.com/BeTheBestSY/3rd_Project.git
=======
				</td>
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> 40797b2e23e86f81f690da65f87b46d5f176b23e
>>>>>>> b5d609e9a21a409f075ce3e39aa31cd1f6348f85
=======
>>>>>>> branch 'HJ' of https://github.com/BeTheBestSY/3rd_Project.git
			</tr>
			<tr style="border-top: 1px solid #BDBDBD;">
				<th>&nbsp;&nbsp;주소</th>
				<td>
					<input type="text" class="form-control" style="width: 70%; display: inline; margin-bottom: 10px;" name="u_address" value="${ub.u_address eq '-' ? '': fn:split(ub.u_address, ',')[0]}" id="sample4_postcode" placeholder="먼저 우편번호 찾기 버튼을 눌러주세요." onClick="zipClick()" readonly>
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" id="searchBtn"><br>
					<input type="text" class="form-control" name="u_address" value="${ub.u_address eq '-' ? '': fn:split(ub.u_address, ',')[1]}" id="sample4_roadAddress" placeholder="도로명주소" style="margin-bottom: 10px;" onClick="zipClick()" readonly>
					<span id="guide" style="color:#999; display:none"></span>
					<input type="text" class="form-control" name="u_address" value="${ub.u_address eq '-' ? '': fn:split(ub.u_address, ',')[2]}" id="sample4_detailAddress" placeholder="상세주소">
				</td>
			</tr>
			<!-- <tr>
				<th>* 결제수단</th>
				<td>
					<input type="text" name="u_pay" value="" placeholder="" required>
				</td>
			</tr> -->
			<tr style="border-bottom: 2px solid graytext; border-top: 1px solid #BDBDBD;">
				<th ><font color="red">*</font> 퍼스널 컬러</th>
				<td>
					<c:set var="pcList">잘 모르겠음,봄 라이트,봄 브라이트,여름 라이트,여름 브라이트,여름 뮤트,가을 뮤트,가을 스트롱,가을 딥,겨울 브라이트,겨울 딥</c:set>
					<select name="u_color" class="form-select">
						<c:forEach var="pc" items="${pcList }">
							<option value="${pc }" <c:if test="${pc eq ub.u_color }">selected</c:if>>${pc }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<br><br>
					<input type="submit" value="가입하기" id="subBtn">&nbsp;
					<input type="reset" value="초기화" id="resetBtn">
				</td>
			</tr>
		</table>
	</form>
	</div>
</div>

<%@ include file="../views/footer.jsp" %>