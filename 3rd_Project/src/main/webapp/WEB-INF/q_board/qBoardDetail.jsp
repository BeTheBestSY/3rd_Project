<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../views/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/qBoardWrite.css">
<style type="text/css">
	
</style>  
<script type="text/javascript">

	function reply(){
		location.href="reply.qb";
	}
	function goList(pageNumber){
		location.href="qBoardList.qb?pageNumber="+pageNumber;
	}
	
	function goUpdate(q_num,pageNumber){
		location.href="qUpdate.qb?q_num="+q_num+"&pageNumber="+pageNumber;
	}
	
	function goDelete(q_num,pageNumber){
		location.href="qDelete.qb?q_num="+q_num+"&pageNumber="+pageNumber;
	}
	
	function goReply(q_num,q_ref,q_re_step,q_re_level,pageNumber){
		location.href="qReply.qb?q_ref="+q_ref+"&q_re_step="+q_re_step+"&q_re_level="+q_re_level+"&pageNumber="+pageNumber+"&q_num="+q_num;
	}
	 
	
</script>
<%
	application.setAttribute("flag",false);
%>
<article id="center" style=" font-family: 'MaruBuri-Regular';" >

<br>
<div class="page-title">
    <div class="container">
        <br><br>
        <h3 style="font-size: 25pt; font-weight: bold;">의견 게시판</h3>
        <input type=button value="목록" onClick="goList(${pageNumber})" class="btn btn-white"><br>
    </div>
</div>
<br><br><br><br><br>

<div id="board-list">
			
		<form:form commandName="bb" action="write.qb" method="post">
		      <table class="board-table" style="font-size: 13pt;">
				<tr>
					<th align="left" bgcolor="#f9f7f9" width="15%">제목</th>
					<td align="left" colspan="3">
						${ bb.q_subject }
					</td>
				</tr>
				<tr>
					<th align="left" bgcolor="#f9f7f9">작성자</th>
					<td align="left">
						${ bb.q_writer }
					</td>
					<th align="left" bgcolor="#f9f7f9" width="15%">이메일</th>
					<td align="left">
						${ bb.q_email }
					</td>
				</tr>
				<tr>
					<th align="left" bgcolor="#f9f7f9">내용</th>
					<td align="left" valign="top" colspan="3" height="300px">
						<br>
						${ bb.q_content }
					</td>
				</tr>
						
			 </table>
			 <br><br>
			 
			<!-- 세션이 작성자와 같거나 관리자가 아니면 수정, 삭제, 목록 버튼 보이게 -->
			<c:if test="${id == bb.q_writer && id!='admin'}">
				 <center>
					<input type="button" value="수정하기" onClick="goUpdate(${ bb.q_num },${pageNumber})" class="btn btn-dark" style="font-size: 13pt; width: 130px;">&nbsp;
					<input type="button" value="삭제하기" onClick="goDelete(${ bb.q_num },${pageNumber})" class="btn btn-dark" style="font-size: 13pt; width: 130px;">&nbsp;
				
				</center>
			</c:if>
			<!-- 아이디가 'admin'(관리자)면 답글달기 버튼까지 보이게 -->
			<c:if test="${id == 'admin'}"> 
				<center>
					<input type="button" value="수정하기" onClick="goUpdate(${ bb.q_num },${pageNumber})" class="btn btn-dark" style="font-size: 13pt; width: 130px;">&nbsp;
					<input type="button" value="삭제하기" onClick="goDelete(${ bb.q_num },${pageNumber})" class="btn btn-dark" style="font-size: 13pt; width: 130px;">&nbsp;
					<input type="button" value="답글달기" onClick="goReply(${ bb.q_num },${ bb.q_ref },${ bb.q_re_step },${ bb.q_re_level },${pageNumber})" class="btn btn-dark" style="font-size: 13pt; width: 130px;">&nbsp;
				</center>
			</c:if>
			
		</form:form>
		
</article>



<%@ include file="./../views/footer.jsp" %>