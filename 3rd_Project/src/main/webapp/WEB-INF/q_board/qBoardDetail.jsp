<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../product/productHeader.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/qBoardWrite.css">
<style type="text/css">
	#btn{
		font-size: 13pt; 
		width: 130px; 
		color: black; 
		background: white; 
		border: 1px solid #D5D5D5;
		border-radius: 5px;
	}
	#btn:hover {
		background: #D0D6CE;
		color: white;
	}
	body{
		padding-top: 140px;
	}
</style>  
<script type="text/javascript">
	function goReply(q_num, q_ref, q_re_step, q_re_level, pageNumber, whatColumn, keyword){
		location.href="qReply.qb?q_ref="+q_ref+"&q_re_step="+q_re_step+"&q_re_level="+q_re_level+"&pageNumber="+pageNumber+"&q_num="+q_num+"&whatColumn="+whatColumn+"&keyword="+keyword;
	}
</script>
<%
	application.setAttribute("flag",false);
%>

<br>
<article id="center" style=" text-align:center; font-family: 'RIDIBatang';">


<div class="page-title">
    <div class="container">
        <br><br>
        <h3 style="font-size: 25pt; font-weight: bold;">문의 게시판</h3>
        <input type=button value="목록" onClick="location.href='qBoardList.qb?pageNumber=${pageNumber}&whatColumn=${whatColumn}&keyword=${keyword}'" class="btn btn-white"><br>
    </div>
</div>
<br><br><br><br><br>

 <div id="board-list">
	
		<form:form commandName="bb" action="write.qb" method="post">
		      <table class="board-table" style="font-size: 13pt;">
				<tr >
					<th align="left" bgcolor="#EDE5D8" width="10%">제목</th>
					<td align="left" colspan="3" height="68">${ bb.q_subject }
					</td>
				</tr>
				<tr>
					<th align="left" bgcolor="#EDE5D8" width="10%">작성자</th>
					<td align="left" height="68" width="38%">
						${ bb.q_writer}					
					</td>
					<th align="left" bgcolor="#EDE5D8" width="14%" >이메일</th>
					<td align="left" height="68">
						${ bb.q_email }
					</td>
				</tr>
				<tr>
					<th align="left" bgcolor="#EDE5D8" width="10%" >내용</th>
					<td align="left" colspan="3" height="200" valign="top" style="padding-top: 25px;">
						${ bb.q_content}
					</td>
				</tr>
						
			 </table>
			 <br><br>
			 
			 <!-- 세션이 작성자와 같거나 관리자가 아니면 수정, 삭제, 목록 버튼 보이게 -->
			<c:if test="${loginInfo.u_id  == bb.q_writer && loginInfo.u_id !='admin'}">
				 <center>
					<input type="button" value="수정하기" id="btn" onClick="location.href='qUpdate.qb?q_num=${bb.q_num}&pageNumber=${pageNumber}&whatColumn=${whatColumn}&keyword=${keyword}'" class="btn btn-dark" style="font-size: 13pt; width: 130px;">&nbsp;
					<input type="button" value="삭제하기" id="btn" onClick="location.href='qDelete.qb?q_num=${bb.q_num}&pageNumber=${pageNumber}&whatColumn=${whatColumn}&keyword=${keyword}'" class="btn btn-dark" style="font-size: 13pt; width: 130px;">&nbsp;
				</center>
			</c:if>
			
			<!-- 접속한 id가 관리자일 땐 모든 게시물 수정 삭제 답글 가능 -->
			<c:if test="${loginInfo.u_id == 'admin'}"> 
				<center>
					<input type="button" value="수정하기" id="btn" onClick="location.href='cUpdate.qb?q_num=${bb.q_num}&pageNumber=${pageNumber}&whatColumn=${whatColumn}&keyword=${keyword}'" class="btn btn-dark" style="font-size: 13pt; width: 130px;">&nbsp;
					<input type="button" value="삭제하기" id="btn" onClick="location.href='cDelete.qb?q_num=${bb.q_num}&pageNumber=${pageNumber}&whatColumn=${whatColumn}&keyword=${keyword}'" class="btn btn-dark" style="font-size: 13pt; width: 130px;">&nbsp;
					<input type="button" value="답글달기" id="btn" onClick="goReply(${ bb.q_num },${ bb.q_ref },${ bb.q_re_step },${ bb.q_re_level },${pageNumber}, '${whatColumn}', '${keyword}')" class="btn btn-dark" style="font-size: 13pt; width: 130px;">&nbsp;
				</center> 
			</c:if>
		</form:form>
</article>

</div>


<%@ include file="./../views/footer.jsp" %>