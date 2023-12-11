<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../views/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/qBoardWrite.css">
<style type="text/css">
	
</style>  
<script type="text/javascript">

	function reply(){
		location.href="reply.cb";
	}
	function goList(pageNumber){
		location.href="cBoardList.cb?pageNumber="+pageNumber;
	}
	
	function goUpdate(c_num,pageNumber){
		location.href="cUpdate.cb?c_num="+c_num+"&pageNumber="+pageNumber;
	}
	
	function goDelete(c_num,pageNumber){
		location.href="cDelete.cb?c_num="+c_num+"&pageNumber="+pageNumber;
	}
	
	function goReply(c_num,c_ref,c_re_step,c_re_level,pageNumber){
		location.href="cReply.cb?c_ref="+c_ref+"&c_re_step="+c_re_step+"&c_re_level="+c_re_level+"&pageNumber="+pageNumber+"&c_num="+c_num;
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
			
		<form:form commandName="bb" action="write.cb" method="post">
		      <table class="board-table" style="font-size: 13pt;">
				<tr>
					<th align="left" bgcolor="#f9f7f9" width="15%">제목</th>
					<td align="left" colspan="3">
						${ bb.c_subject }
					</td>
				</tr>
				<tr>
					<th align="left" bgcolor="#f9f7f9">작성자</th>
					<td align="left">
						${ bb.c_writer }
					</td>
					<th align="left" bgcolor="#f9f7f9" width="15%">이메일</th>
					<td align="left">
						${ bb.c_email }
					</td>
				</tr>
				<tr>
					<th align="left" bgcolor="#f9f7f9">내용</th>
					<td align="left" valign="top" colspan="3" height="300px">
						<br>
						${ bb.c_content }
					</td>
				</tr>
						
			 </table>
			 <br><br>
			 
			 <!-- 세션이 작성자와 같거나 관리자가 아니면 수정, 삭제, 목록 버튼 보이게 -->
			<c:if test="${id == bb.c_writer && id!='admin'}">
				 <center>
					<input type="button" value="수정하기" onClick="goUpdate(${ bb.c_num },${pageNumber})" class="btn btn-dark" style="font-size: 13pt; width: 130px;">&nbsp;
					<input type="button" value="삭제하기" onClick="goDelete(${ bb.c_num },${pageNumber})" class="btn btn-dark" style="font-size: 13pt; width: 130px;">&nbsp;
				
				</center>
			</c:if>
			<!-- 아이디가 'admin'(관리자)면 답글달기 버튼까지 보이게 -->
			<c:if test="${id == 'admin'}"> 
				<center>
					<input type="button" value="수정하기" onClick="goUpdate(${ bb.c_num },${pageNumber})" class="btn btn-dark" style="font-size: 13pt; width: 130px;">&nbsp;
					<input type="button" value="삭제하기" onClick="goDelete(${ bb.c_num },${pageNumber})" class="btn btn-dark" style="font-size: 13pt; width: 130px;">&nbsp;
					<input type="button" value="답글달기" onClick="goReply(${ bb.c_num },${ bb.c_ref },${ bb.c_re_step },${ bb.c_re_level },${pageNumber})" class="btn btn-dark" style="font-size: 13pt; width: 130px;">&nbsp;
				</center>
			</c:if>
			
		</form:form>
		
</article>



<%@ include file="./../views/footer.jsp" %>