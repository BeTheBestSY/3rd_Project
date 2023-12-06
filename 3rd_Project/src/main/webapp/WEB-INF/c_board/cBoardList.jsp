<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../views/header.jsp" %>

<center>

</center>
<article id="center" style="text-align: center; font-family: 'MaruBuri-Regular';" >
	<script type="text/javascript">

	function write() {
		location.href="write.cb"
	}

</script>
<body bgcolor="pink">

<center>
	<h2>게시판 목록(레코드 갯수 : ${ pageInfo.totalCount })</h2>
		<form action="cBoardList.cb" method="get">
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

	<tr>
		<th align=right colspan=8 bgcolor="pink">
			<input type=button value="글쓰기" onClick="write()">
		</th>
	</tr>
	<tr bgcolor="pink">
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>내용</th>
		<th>작성일</th>
		<th>이메일</th>
		<th>조회</th>
		<th>IP</th>
	</tr>
	<c:if test="${ !empty list }">
		<c:forEach var="bb" items="${ list }">
			<tr align=center>
				<td>${ bb.num }</td>
				<td align="left">
					<c:set var="wid" value="0"/>
					<c:if test="${ bb.re_level > 0 }">
						<c:set var="wid" value="${bb.re_level * 20}"/>
						<img src="<%= request.getContextPath() %>/resources/image/level.gif" width="${wid}">
						<img src="<%= request.getContextPath() %>/resources/image/re.png">
					</c:if>
						<a href="content.bd?num=${ bb.num }&pageNumber=${ pageInfo.pageNumber }">
							${ bb.subject }</a>
					<c:if test="${ bb.readcount >= 10 }">
						<img src="<%= request.getContextPath() %>/resources/image/hot.png">
					</c:if>
				</td>
				<td>${ bb.writer }</td>
				<td>${ bb.content }</td>
				<td>
					<fmt:formatDate value="${bb.reg_date}" pattern="yyyy-MM-dd"/>
				</td>
				<td>${ bb.email }</td>
				<td>${ bb.readcount }</td>
				<td>${ bb.ip }</td>
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
	${pageInfo.pagingHtml}
</center> 
</body>
	
</article>


<%@ include file="./../views/footer.jsp" %>