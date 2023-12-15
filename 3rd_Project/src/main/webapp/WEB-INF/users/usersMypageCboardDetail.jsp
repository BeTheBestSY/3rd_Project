<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
	#c_boardDetail{
		width: 95%;
	}
	#c_boardDetail th{
		text-align: center;
	}
	#c_boardDetail td{
		padding-left: 20px;
	}
</style>
    
<%@ include file="usersMypageMenuTop.jsp" %>

<div style="margin: 0px 0px 28px 5px; font-size: 10pt;">
	<a href="mypage.u" id="none_under">마이페이지</a> > 회원정보 > <a href="c_board.u" id="none_under">후기 게시판</a> > <a href="c_boardDetail.u?c_num=${cb.c_num}&pageNumber=${pageNumber}" id="none_under">게시글 조회</a>
</div>
<hr style="margin-bottom: 50px;">
				
<ul>
	<li><big><b>게시글 조회</b></big></li>
	<br>
	<div>
		<div style="width: 95%; text-align: right; margin-bottom: 5px;">
			<input type="button" value="목록으로">
		</div>
		<table id="c_boardDetail">
			<tr style="border-top: 1px solid #D5D5D5;">
				<th bgcolor="#F7F3ED" width="10%">제목</th>
				<td colspan="3" height="68">${cb.c_subject}</td>
			</tr>
			<tr style="border-top: 1px dotted #EAEAEA;">
				<th bgcolor="#F7F3ED" width="10%">작성자</th>
				<td height="68" width="38%">${ cb.c_writer}</td>
				<th bgcolor="#F7F3ED" width="14%">이메일</th>
				<td height="68">${cb.c_email}</td>
			</tr>
			<tr style="border-bottom: 1px solid #D5D5D5; border-top: 1px dotted #EAEAEA;">
				<th bgcolor="#F7F3ED" width="10%">내용</th>
				<td colspan="3" height="200" valign="top" style="padding-top: 20px;">${cb.c_content}
				</td>
			</tr>
		</table>
	</div>
</ul>
<br>

<%@ include file="usersMypageMenuBottom.jsp" %>