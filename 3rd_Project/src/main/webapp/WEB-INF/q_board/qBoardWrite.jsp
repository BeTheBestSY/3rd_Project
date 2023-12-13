<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../views/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/qBoardWrite.css">
<style type="text/css">
	
</style>  
<script type="text/javascript">

	function goList() {
		location.href="qBoardList.qb"
	}
	
</script>
<%
	application.setAttribute("flag",false);
%>

<br>
<article id="center" style=" text-align:center; font-family: 'MaruBuri-Regular';" >


<div class="page-title">
    <div class="container">
        <br><br>
        <h3 style="font-size: 25pt; font-weight: bold;">문의 남기기</h3>
        <input type=button value="목록" onClick="goList()" class="btn btn-white"><br>
    </div>
</div>
<br><br><br><br><br>

 <div id="board-list">
	
		<form:form commandName="bb" action="write.qb" method="post">
		      <table class="board-table" style="font-size: 13pt;">
				<tr>
					<th align="left" bgcolor="#f9f7f9">제목</th>
					<td align="left" colspan="3">
						<input type="text" name="q_subject" value="${ bb.q_subject }" class="form-control" style="width: 94%;" maxlength="20" placeholder="20자 이내로 입력해주세요." required>
					</td>
				</tr>
				<tr>
					<th align="left" bgcolor="#f9f7f9">작성자</th>
					<td align="left">
						<input type="text" name="q_writer" value="${loginInfo.u_id}" class="form-control" style="width: 85%;" maxlength="5" placeholder="5자 이내로 입력해주세요." required>
					</td>
					<th align="left" bgcolor="#f9f7f9">이메일</th>
					<td align="left">
						<input type="email" name="q_email" value="${ bb.q_email }" class="form-control" style="width: 85%;""  placeholder="ex) color@gmail.com" required>
					</td>
				</tr>
				<tr>
					<th align="left" bgcolor="#f9f7f9">내용</th>
					<td align="left" colspan="3">
						<textarea rows="10" cols="100" name="q_content" class="form-control" style="width: 94%; resize: none;" required>${ bb.q_content }</textarea>
					</td>
				</tr>
				<tr>
					<th align="left" bgcolor="#f9f7f9">비밀번호</th>
					<td align="left" colspan="3">
						<input type="password" name="q_password" class="form-control" style="width: 35%; resize: none;" placeholder="4자 이내로 입력해주세요." maxlength="4" required>
					</td>
				</tr>
						
			 </table>
			 <br><br>
			 
			 	  <!-- 로그인 하지 않은 상태면 -->
			<c:if test="${loginInfo.u_id  == null}">
			 	<center>
				 	<% 
				 		 response.sendRedirect("login.u");
				 	%>
				</center>
			</c:if>
			<!-- 로그인 한 상태면 -->
			<c:if test="${loginInfo.u_id  != null}">
			 <center>
	 				<input type="submit" value="작성 완료" class="btn btn-dark" style="font-size: 13pt; width: 130px;">
			</center>
			</c:if>
		</form:form>
</article>

</div>


<%@ include file="./../views/footer.jsp" %>