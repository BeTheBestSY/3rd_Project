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
<article id="center" style=" text-align:center; font-family: 'MaruBuri-Regular';" >
<div class="page-title">
    <div class="container">
        <br><br>
        <h3>답글 달기</h3>
    </div>
</div>

<div id="board-list">		
	<form:form commandName="bb" action="qReply.qb" method="post">
		<input type="hidden" name="q_num" value="${ bb.q_num }">
		<input type="hidden" name="pageNumber" value="${pageNumber}">
		<input type = "hidden" name = q_ref value=${bb.q_ref }>
		<input type = "hidden" name = q_re_step value=${ bb.q_re_step }>
		<input type = "hidden" name = q_re_level value=${ bb.q_re_level }>
			      <table class="board-table">
					<tr>
						<th align="left" bgcolor="#f9f7f9">제목</th>
						<td align="left" colspan="3">
							<input type="text" name="q_subject" >
							<form:errors cssClass="err" path="q_subject" />
						</td>
					</tr>
					<tr>
						<th align="left" bgcolor="#f9f7f9">작성자</th>
						<td align="left">
							<input type="text" name="q_writer">
							<form:errors cssClass="err" path="q_writer" />
						</td>
						<th align="left" bgcolor="#f9f7f9">이메일</th>
						<td align="left">
							<input type="text" name="q_email">
							<form:errors cssClass="err" path="q_email" />
						</td>
					</tr>
					<tr>
						<th align="left" bgcolor="#f9f7f9">내용</th>
						<td align="left" colspan="3">
							<textarea rows="10" cols="100" name="q_content" style="resize: none;"></textarea>
							<form:errors cssClass="err" path="q_content" />
						</td>
					</tr>
					<tr>
						<th align="left" bgcolor="#f9f7f9">비밀번호</th>
						<td align="left" colspan="3">
							<input type="password" name="q_password" >
							<form:errors cssClass="err" path="q_password" />
						</td>
					</tr>
					</table>
				 <br><br>
				 <center>
						<input type="submit" value="답글 작성" class="btn btn-dark">
						<input type="button" value="목록" onClick="goList(${pageNumber})" class="btn btn-dark">
		 </center>
	</form:form>
</div>
</article>


<%@ include file="./../views/footer.jsp" %>