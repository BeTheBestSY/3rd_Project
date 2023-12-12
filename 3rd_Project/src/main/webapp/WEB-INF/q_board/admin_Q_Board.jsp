<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin/adminMenu.jsp"%>
<article id="center" style=" text-align:center; font-family: 'MaruBuri-Regular';" >


	<div class="page-title">
        <div class="container" style="font-family: 'MaruBuri-Regular';">
            <br><br><br>
            <h3>퍼스널 컬러 진단 후기 게시판</h3>
        </div>
    </div>
	
	 <div id="board-search">
		<div class="container">
            <div class="search-window">
                <form action="">
				<div class="search-wrap">
		<form action="cBoardList.cb" method="get">
				<select name="whatColumn" id="whatColumn">
					<option>선택</option>
					<option value="all">전체검색</option>
					<option value="c_subject">제목</option>
					<option value="c_writer">작성자</option>
				</select>
			 	<input id="search" type="search" name="keyword" placeholder="검색어를 입력해주세요." value="">
			 	
			<button type="submit" class="btn btn-dark">검색</button>
            </div>
		   </form>
        </div>
    </div>

 <div id="board-list">
        <div class="container">
        
<input type=button value="글쓰기" onClick="insert()" class="btn btn-white">
<table class="board-table" style="font-size: 13pt; text-align: center;">

	
	<tr style="background: #EDE5D8   ;">
		<th scope="col" class="th-num" width="10%">번호</th>
		<th scope="col" class="th-title" width="30%">제목</th>
		<th width="15%" class="th-writer">작성자</th>
		<th scope="col" class="th-date" width="17%">작성일</th>
		<th width="13%" class="th-readcount">조회수</th>
	</tr>
	<c:if test="${ !empty list }">
	<c:set var="num" value="${pageInfo.totalCount-pageInfo.beginRow+1}" />
		<c:forEach var="bb" items="${ list }">
			<tr>
				<td>${num }
      <c:set var="num" value="${num -1}" /></td>
				<td align="left" >
					<c:set var="wid" value="0"/>
					<c:if test="${ bb.c_re_level > 0 }">
						<c:set var="wid" value="${bb.c_re_level * 20}"/>
						<img src="<%= request.getContextPath() %>/resources/image/level.gif" width="${wid}">
						<img src="<%= request.getContextPath() %>/resources/image/re.png" width="2%">
					</c:if>
						<a href="detail.cb?c_num=${ bb.c_num }&pageNumber=${ pageInfo.pageNumber }" id="noneHigtLight">
							${ bb.c_subject }&nbsp;</a>
					<c:if test="${ bb.c_readcount >= 10 }">
						<img src="<%= request.getContextPath() %>/resources/image/hot.png" width="2%">
					</c:if>
				</td>
				<td>${ bb.c_writer }</td>
				<td>
					<fmt:formatDate value="${bb.c_regdate}" pattern="yyyy-MM-dd"/>
				</td>
				<td>${ bb.c_readcount }</td>
			</tr>
		</c:forEach>
	</c:if>
	<c:if test="${ empty list }" >
		<tr>
			<td colspan="8">작성된 글이 없습니다.</td>
		</tr>
	</c:if>
 </table>
        </div>
    </div>
<br><br>
<center>
<div id="pagenation">
	${pageInfo.pagingHtml}
</div>
</center> 


</article>


