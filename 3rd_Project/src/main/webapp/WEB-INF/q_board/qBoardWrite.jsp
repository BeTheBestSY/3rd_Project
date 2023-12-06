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
<article id="center" style=" text-align:center; font-family: 'MaruBuri-Regular';" >


<div class="page-title">
    <div class="container">
        <br><br>
        <h3>의견 남기기</h3>
        <input type=button value="목록" onClick="goList()" class="btn btn-white"><br>
    </div>
</div>
 <div id="board-list">
			
		<form:form commandName="bb" action="write.qb" method="post">
		      <table class="board-table">
				<tr>
					<th align="left" bgcolor="#f9f7f9">제목</th>
					<td align="left" colspan="3">
						<input type="text" name="q_subject" value="${ bb.q_subject }">
						<form:errors cssClass="err" path="q_subject" />
					</td>
				</tr>
				<tr>
					<th align="left" bgcolor="#f9f7f9">작성자</th>
					<td align="left">
						<input type="text" name="q_writer" value="${ bb.q_writer }">
						<form:errors cssClass="err" path="q_writer" />
					</td>
					<th align="left" bgcolor="#f9f7f9">이메일</th>
					<td align="left">
						<input type="text" name="q_email" value="${ bb.q_email }" >
						<form:errors cssClass="err" path="q_email" />
					</td>
				</tr>
				<tr>
					<th align="left" bgcolor="#f9f7f9">내용</th>
					<td align="left" colspan="3">
						<textarea rows="10" cols="100" name="q_content" style="resize: none;">${ bb.q_content }</textarea>
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
				
	 					<input type="submit" value="작성 완료" class="btn btn-dark">
			</center>
		</form:form>
</article>

</div>


<%@ include file="./../views/footer.jsp" %>