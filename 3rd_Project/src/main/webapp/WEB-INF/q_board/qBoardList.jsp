<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../views/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/qBoardList.css">

<link rel="stylesheet" href="selectbox.min.css">
<script src="selectbox.min.js"></script>
<style type="text/css">
	#noneHigtLight{
		text-decoration: none;
	}
	#noneHigtLight:hover{
		color: #7C81BB;
	}
</style>  
<script type="text/javascript">

	function insert() {
		location.href="write.qb"
	}

</script>


<article id="center" style="font-family: 'MaruBuri-Regular';" >

	  <div class="page-title">
        <div class="container">
            <br><br><br>
            <h3>의견 게시판</h3>
        </div>
    </div>
	
	  <div id="board-search">
        <div class="container">
            <div class="search-window">
                <form action="">
                    <div class="search-wrap">
		<form action="qBoardList.qb" method="get">
				<select name="whatColumn" id="whatColumn">
					<option>선택</option>
					<option value="all">전체검색</option>
					<option value="q_subject">제목</option>
					<option value="q_writer">작성자</option>
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

	
	<tr style="background: #f9f7f9;">
		<th scope="col" class="th-num" width="10%">번호</th>
		<th scope="col" class="th-title" width="30%">제목</th>
		<th width="15%" class="th-writer">작성자</th>
		<th scope="col" class="th-date" width="17%">작성일</th>
		<th width="13%" class="th-readcount">조회수</th>
	</tr>
	<c:if test="${ !empty list }">
		<c:forEach var="bb" items="${ list }">
			<tr>
				<td>${ bb.q_num }</td>
				<td align="left" >
					<c:set var="wid" value="0"/>
					<c:if test="${ bb.q_re_level > 0 }">
						<c:set var="wid" value="${bb.q_re_level * 20}"/>
						<img src="<%= request.getContextPath() %>/resources/image/level.gif" width="${wid}">
						<img src="<%= request.getContextPath() %>/resources/image/re.png" width="2%">
					</c:if>
						<a href="detail.qb?q_num=${ bb.q_num }&pageNumber=${ pageInfo.pageNumber }" id="noneHigtLight">
							${ bb.q_subject }&nbsp;</a>
					<c:if test="${ bb.q_readcount >= 10 }">
						<img src="<%= request.getContextPath() %>/resources/image/hot.png" width="2%">
					</c:if>
				</td>
				<td>${ bb.q_writer }</td>
				<td>
					<fmt:formatDate value="${bb.q_regdate}" pattern="yyyy-MM-dd"/>
				</td>
				<td>${ bb.q_readcount }</td>
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



<%@ include file="./../views/footer.jsp" %>