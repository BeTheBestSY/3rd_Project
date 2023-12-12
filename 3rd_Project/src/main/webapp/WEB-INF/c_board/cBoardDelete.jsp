<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../views/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/qBoardDelete.css">

	<script>
	
		function goList(pageNumber){
			location.href="cBoardList.cb?pageNumber="+pageNumber;
		}
		
		
	</script>
	
	
<br>

<article id="center" style=" text-align:center; font-family: 'MaruBuri-Regular';" >
<br><br><br><br><br>

	<div id="board-list">	
		<form name="deleteForm" action="cDelete.cb" method="post">
		<input type=hidden name="pageNumber" value="${ pageNumber }">
		<input type=hidden name="c_num" value="${ bb.c_num }">
		
			<table border=1>
				<tr style="background-color: #f9f7f9;">
					<th style="padding:5% 5%; text-align:center;">게시글 비밀번호를 입력하세요</th>
				</tr>
				<tr rowspan=2>
					<td align=center style="border-top: 1px solid #e7e7e7; border-bottom: 1px solid #e7e7e7; padding:5% 5%;">
						<input type="q_password" name="q_password" class="form-control" maxlength="12" size="12">
					</td>
				</tr>
				
			</table>
			<center>
						<input type="submit" value="삭제하기" onClick="return check()" class="btn btn-dark" style="margin-top:3%; font-size: 13pt; width: 130px;">&nbsp;
						<input type="button" value="목록으로" onClick="goList(${pageNumber})" class="btn btn-dark" style="margin-top:3%; font-size: 13pt; width: 130px;">
			</center>		
		</form>
	</div>
</article>
<%@ include file="./../views/footer.jsp" %>