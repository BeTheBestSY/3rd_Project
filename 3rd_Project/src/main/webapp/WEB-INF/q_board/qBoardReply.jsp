<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../views/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/qBoardWrite.css">
<style type="text/css">
	
</style>  
<script type="text/javascript">

	function goList(pageNumber){
		location.href="qBoardList.qb?pageNumber="+pageNumber;
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
        <h3 style="font-size: 25pt; font-weight: bold;">답글 달기</h3>
    </div>
</div>
<br><br><br><br><br>

<div id="board-list">		
	<form:form commandName="bb" action="qReply.qb" method="post">
		<input type="hidden" name="q_num" value="${ bb.q_num }">
		<input type="hidden" name="pageNumber" value="${pageNumber}">
		<input type = "hidden" name = q_ref value=${bb.q_ref }>
		<input type = "hidden" name = q_re_step value=${ bb.q_re_step }>
		<input type = "hidden" name = q_re_level value=${ bb.q_re_level }>
			      <table class="board-table" style="font-size: 13pt;">
					<tr>
					<th align="left" bgcolor="#D0D6CE">제목</th>
					<td align="left" colspan="3">
						<input type="text" name="q_subject" value="${bb.q_subject}" class="form-control" style="width: 94%;" maxlength="20" placeholder="20자 이내로 입력해주세요." required>
					</td>
				</tr>
				<tr>
					<th align="left" bgcolor="#D0D6CE">작성자</th>
					<td align="left">
						<input type="text" name="q_writer" value="${loginInfo.u_id}" class="form-control" style="width: 85%;" maxlength="5" placeholder="5자 이내로 입력해주세요." required>
					</td>
					<th align="left" bgcolor="#D0D6CE">이메일</th>
					<td align="left">
						<input type="email" name="q_email" class="form-control" style="width: 85%;""  placeholder="ex) color@gmail.com" required>
					</td>
				</tr>
				<tr>
					<th align="left" bgcolor="#D0D6CE">내용</th>
					<td align="left" colspan="3">
						<textarea rows="10" cols="100" name="q_content" class="form-control" style="width: 94%; resize: none;" required></textarea>
					</td>
				</tr>
				<tr>
					<th align="left" bgcolor="#D0D6CE">비밀번호</th>
					<td align="left" colspan="3">
						<input type="password" name="q_password" class="form-control" style="width: 35%; resize: none;" placeholder="4자 이내로 입력해주세요." maxlength="4" required>
					</td>
				</tr>
						
					</table>
				 <br><br>
				 <center>
						<input type="submit" value="답글 작성" class="btn btn-dark" style="font-size: 13pt; width: 130px;">&nbsp;
						<input type="button" value="목록으로" onClick="goList(${pageNumber})" class="btn btn-dark" style="font-size: 13pt; width: 130px;">
		 </center>
	</form:form>
</div>
</article>


<%@ include file="./../views/footer.jsp" %>