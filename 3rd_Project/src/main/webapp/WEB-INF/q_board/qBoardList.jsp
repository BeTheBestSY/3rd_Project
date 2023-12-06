<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../views/header.jsp" %>

<style type="text/css">
	table{
		margin : auto;
		margin-top:30px;
		width:80%;
	}
</style>  
<script type="text/javascript">

	function write() {
		location.href="write.qb"
	}

</script>


<article id="center" style="text-align: center; font-family: 'MaruBuri-Regular';" >

<center>
	<h2>의견 게시판</h2>
		<form action="list.bd" method="get">
			<select name="whatColumn">
				<option value="all">전체검색</option>
				<option value="writer">작성자</option>
				<option value="email">이메일</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="keyword">
			<input type="submit" value="검색">
		</form>
</center>

<table border=1>

	<tr align=right>
		<th colspan=8 bgcolor="yellow">
			<input type=button value="글쓰기" onClick="insert()">
		</th>
	</tr>
	<tr bgcolor="pink">
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>내용</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<c:if test="${ !empty list }">
		<c:forEach var="bb" items="${ list }">
			<tr align=center>
				<td>${ bb.q_num }</td>
				<td align="left">
					<c:set var="wid" value="0"/>
					<c:if test="${ bb.q_re_level > 0 }">
						<c:set var="wid" value="${bb.re_level * 20}"/>
						<img src="<%= request.getContextPath() %>/resources/image/level.gif" width="${wid}">
						<img src="<%= request.getContextPath() %>/resources/image/re.png" width="15px">
					</c:if>
						<a href="content.bd?num=${ bb.num }&pageNumber=${ pageInfo.pageNumber }">
							${ bb.q_subject }</a>
					<c:if test="${ bb.q_readcount >= 10 }">
						<img src="<%= request.getContextPath() %>/resources/image/hot.png">
					</c:if>
				</td>
				<td>${ bb.q_writer }</td>
				<td>${ bb.q_content }</td>
				<td>
					<fmt:formatDate value="${bb.q_regdate}" pattern="yyyy-MM-dd"/>
				</td>
				<td>${ bb.q_readcount }</td>
			</tr>
		</c:forEach>
	</c:if>
	<c:if test="${ empty list }" >
		<tr align=center bgcolor="pink">
			<td colspan="8">작성된 글이 없습니다.</td>
		</tr>
	</c:if>
</table>
<center>
<br>
	${pageInfo.pagingHtml}
</center> 
	
</article>



<%@ include file="./../views/footer.jsp" %>