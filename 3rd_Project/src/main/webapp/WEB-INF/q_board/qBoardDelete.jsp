<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/qBoardDelete.css">
<%@ include file="./../views/header.jsp" %>


<article id="center" style=" text-align:center; font-family: 'MaruBuri-Regular';" >
	
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery.js"></script>
	<script>
	
		function goList(pageNumber){
			location.href="qBoardList.bd?pageNumber="+pageNumber;
		}
		
		function check(){
			if($('input[name="q_password"]').val()=="") {
				alert('비밀번호를 입력하셔야합니다');
				$('input[name="q_password"]').focus();
				return false;
			}
		}
	
	</script>

	<form name="deleteForm" action="qDelete.qb" method="post">
	<input type=hidden name="pageNumber" value="${ pageNumber }">
	<input type=hidden name="q_num" value="${ bb.q_num }">
		<table border=1>
			<tr>
				<th colspan=2 >글 삭제</th>
			</tr>
			<tr>
				<th >비밀번호 입력</th>
				<td align=center>
					<input type="q_password" name="q_password">
				</td>
			</tr>
			<tr>
				<th colspan=2 >
					<input type="submit" value="삭제하기" onClick="return check()">
					<input type="button" value="글 목록" onClick="goList(${pageNumber})">
				</th>
			</tr>
		</table>
	</form>

</article>


<%@ include file="./../views/footer.jsp" %>