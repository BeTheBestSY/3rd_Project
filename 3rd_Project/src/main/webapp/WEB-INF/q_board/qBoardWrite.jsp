<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../views/header.jsp" %>
  
<style type="text/css">
	table{
		margin : auto;
		margin-top:30px;
		width:80%;
	}
	
	.err {
	font-size: 9pt;
	color: red;
	font-weight: bold;
	}
	
</style>  
<script type="text/javascript">

	function goList() {
		location.href="qBoardList.qb"
	}
	
</script>
<%
	application.setAttribute("flag",false);
%>

<article id="center" style="text-align: center; font-family: 'MaruBuri-Regular';" >



<form:form commandName="bb" action="write.qb" method="post">
	<table  border=1  bgcolor="skyblue">
		<tr>
			<th colspan=2 bgcolor="pink"> 
				글 쓰기
			</th>
		</tr>
		<tr>
			<th bgcolor="pink">이름</th>
			<td >
				<input type="text" name="q_writer" value="${ bb.q_writer }">
				<form:errors cssClass="err" path="q_writer" />
			</td>
		</tr>
		<tr>
			<th bgcolor="pink">제목</th>
			<td>
				<input type="text" name="q_subject" value="${ bb.q_subject }">
				<form:errors cssClass="err" path="q_subject" />
			</td>
		</tr>
		<tr>
			<th bgcolor="pink">Email</th>
			<td>
				<input type="text" name="q_email" value="${ bb.q_email }">
				<form:errors cssClass="err" path="q_email" />
			</td>
		</tr>
		<tr>
			<th bgcolor="pink">내용</th>
			<td>
				<textarea rows="20" cols="60" name="q_content" style="resize: none;">${ bb.q_content }</textarea>
				<form:errors cssClass="err" path="q_content" />
			</td>
		</tr>
		<tr>
			<th bgcolor="pink">비밀번호</th>
			<td>
				<input type="password" name="q_password">
				<form:errors cssClass="err" path="q_password" />
			</td>
		</tr>
		<tr>
			<th colspan=2 bgcolor="pink">
				<input type="submit" value="글 쓰기">
				<input type="reset" value="다시 작성">
				<input type="button" value="글 목록" onClick="goList()">
			</th>
		</tr>
	</table>
</form:form>













	
</article>



<%@ include file="./../views/footer.jsp" %>