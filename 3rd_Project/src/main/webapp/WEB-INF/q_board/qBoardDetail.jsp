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
        <h3 style="font-size: 25pt; font-weight: bold;">문의 게시판</h3>
        <input type=button value="목록" onClick="goList(${pageNumber})" class="btn btn-white"><br>
    </div>
</div>
<br><br><br><br><br>

<div id="board-list">
			
		<form:form commandName="bb" action="write.qb" method="post">
		       <table class="board-table" style="font-size: 13pt;">
				<tr >
					<th align="left" bgcolor="#D0D6CE" width="10%">제목</th>
					<td align="left" colspan="3" height="68">${ bb.q_subject }
					</td>
				</tr>
				<tr>
					<th align="left" bgcolor="#D0D6CE" width="10%">작성자</th>
					<td align="left" height="68" width="38%">
						${ bb.q_writer}					
					</td>
					<th align="left" bgcolor="#D0D6CE" width="14%" >이메일</th>
					<td align="left" height="68">
						${ bb.q_email }
					</td>
				</tr>
				<tr>
					<th align="left" bgcolor="#D0D6CE" width="10%" >내용</th>
					<td align="left" colspan="3" height="200" valign="top">
						${ bb.q_content}
					</td>
				</tr>
						
			 </table>
			 <br><br>
			  <!-- 세션이 작성자와 같거나 관리자가 아니면 수정, 삭제, 목록 버튼 보이게 -->
			<c:if test="${id==null}">
				 <center>
				 	답글달기는 로그인 후 이용 가능합니다.
				</center>
			</c:if>
			
			<!-- 접속한 id가 관리자가 아니고, 글 작성자랑 접속한 id랑 다른데 로그인은 되어있으면 답글달기만. -->
			<c:if test="${id != null && id !='admin' && id !=bb.q_writer}"> 
				<center>
					<input type="button" value="답글달기" onClick="goReply(${ bb.q_num },${ bb.q_ref },${ bb.q_re_step },${ bb.q_re_level },${pageNumber})" class="btn btn-dark" style="font-size: 13pt; width: 130px;">&nbsp;
				</center>
			</c:if>

			 
			 <!-- 세션이 작성자와 같거나 관리자가 아니면 수정, 삭제, 목록 버튼 보이게 -->
			<c:if test="${id == bb.q_writer && id!='admin'}">
				 <center>

					<input type="button" value="수정하기" onClick="goUpdate(${ bb.q_num },${pageNumber})" class="btn btn-dark" style="font-size: 13pt; width: 130px;">&nbsp;
					<input type="button" value="삭제하기" onClick="goDelete(${ bb.q_num },${pageNumber})" class="btn btn-dark" style="font-size: 13pt; width: 130px;">&nbsp;

					<input type="button" value="답글달기" onClick="goReply(${ bb.q_num },${ bb.q_ref },${ bb.q_re_step },${ bb.q_re_level },${pageNumber})" class="btn btn-dark" style="font-size: 13pt; width: 130px;">&nbsp;

				

				</center>
			</c:if>
			
			<!-- 접속한 id가 관리자일 땐 모든 게시물 수정 삭제 답글 가능 -->
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