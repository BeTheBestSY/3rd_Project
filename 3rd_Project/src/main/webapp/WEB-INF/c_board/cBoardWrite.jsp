<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../views/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/qBoardWrite.css">
<style>
	#btn{
		font-size: 13pt; 
		width: 130px; 
		color: black; 
		background: white; 
		border: 1px solid #D5D5D5;
		border-radius: 5px;
	}
	#btn:hover {
		background: #D0D6CE;
		color: white;
	}
	body{
		padding-top: 90px;
	}
</style>

<%
	application.setAttribute("flag",false);
%>

<br>
<article id="center" style=" text-align:center; font-family: 'RIDIBatang';" >


<div class="page-title">
    <div class="container">
        <br><br>
        <h3 style="font-size: 25pt; font-weight: bold;">후기 남기기</h3>
        <input type=button value="목록" onClick="location.href='cBoardList.cb?pageNumber=${pageNumber}&whatColumn=${whatColumn}&keyword=${keyword}'" class="btn btn-white"><br>
    </div>
</div>
<br><br><br><br><br>

 <div id="board-list">
	
		<form:form commandName="bb" action="write.cb" method="post">
		      <table class="board-table" style="font-size: 13pt;">
				<tr>
					<th align="left" bgcolor="#EDE5D8" width="10%">제목</th>
					<td align="left" colspan="3">
						<input type="text" name="c_subject" value="${ bb.c_subject }" class="form-control" style="width: 94%;" maxlength="20" placeholder="20자 이내로 입력해주세요." required>
					</td>
				</tr>
				<tr>
					<th align="left" bgcolor="#EDE5D8" width="10%">작성자</th>
					<td align="left" width="35%">
						<c:if test="${joinType == 'N'}">
							외부 회원 (네이버)
						</c:if>
						<c:if test="${joinType == 'K'}">
							외부 회원 (카카오)
						</c:if>
						<c:if test="${joinType == 'S'}">
							&nbsp;${loginInfo.u_id} 
						</c:if>
						<input type="hidden" name="c_writer" value="${loginInfo.u_id}" class="form-control" style="width: 85%;" maxlength="5" readonly>
					</td>
					<th align="left" bgcolor="#EDE5D8" width="14%">이메일</th>
					<td align="left">
						<input type="email" name="c_email" value="${ bb.c_email }" class="form-control" style="width: 86%;""  placeholder="ex) color@gmail.com" required>
					</td>
				</tr>
				<tr>
					<th align="left" bgcolor="#EDE5D8" width="10%">내용</th>
					<td align="left" colspan="3">
						<textarea rows="10" cols="100" name="c_content" class="form-control" style="width: 94%; resize: none;" required>${ bb.c_content }</textarea>
					</td>
				</tr>
				<tr>
					<th align="left" bgcolor="#EDE5D8">비밀번호</th>
					<td align="left" colspan="3">
						<input type="password" name="c_password" class="form-control" style="width: 35%; resize: none;" placeholder="4자 이내로 입력해주세요." maxlength="4" required>
					</td>
				</tr>
						
			 </table>
			 <br><br>
			 	  <!-- 로그인 하지 않은 상태면 -->
			<c:if test="${loginInfo.u_id  == null}">
				<script type="text/javascript">
					alert("로그인 후 이용 가능합니다.");
					location.href="login.u";
				</script>
				<%
					session.setAttribute("destination", "redirect:/write.cb");
				%>
			</c:if>
			<!-- 로그인 한 상태면 -->
			<c:if test="${loginInfo.u_id  != null}">
			 <center>
	 				<input type="submit" value="작성 완료" class="btn btn-dark" id="btn">
			</center>
			</c:if>
		</form:form>
	</div>
</article>


<%@ include file="./../views/footer.jsp" %>