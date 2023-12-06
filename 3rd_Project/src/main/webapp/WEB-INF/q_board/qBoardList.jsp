<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../views/header.jsp" %>

<style type="text/css">
	table{
		margin : auto;
		margin-top:30px;
		width:80%;
	}
table {
  border-collapse: collapse;
  border-spacing: 0;
}
section.notice {
  padding: 80px 0;
}

.page-title {
  margin-bottom: 60px;
}
.page-title h3 {
  font-size: 28px;
  color: #333333;
  font-weight: 400;
  text-align: center;
}

#board-search .search-window {
  padding: 15px 0;
  background-color: #f9f7f9;
}
#board-search .search-window .search-wrap {
  position: relative;
/*   padding-right: 124px; */
  margin: 0 auto;
  width: 80%;
  max-width: 564px;
}
#board-search .search-window .search-wrap input {
  height: 40px;
  width: 100%;
  font-size: 14px;
  padding: 7px 14px;
  border: 1px solid #ccc;
}
#board-search .search-window .search-wrap input:focus {
  border-color: #333;
  outline: 0;
  border-width: 1px;
}
#board-search .search-window .search-wrap .btn {
  position: absolute;
  right: 0;
  top: 0;
  bottom: 0;
  width: 108px;
  padding: 0;
  font-size: 16px;
}

.board-table {
  font-size: 13px;
  width: 100%;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}

.board-table a {
  color: #333;
  display: inline-block;
  line-height: 1.4;
  word-break: break-all;
  vertical-align: middle;
}


.board-table .th-num {
  width: 100px;
  text-align: center;
}

.board-table .th-date {
  width: 100px;
}
.board-table .th-title {
  width: 450px;
}
.board-table .th-readcount {
  width: 100px;
}
.board-table .th-writer {
  width: 100px;
}

.board-table th, .board-table td {
  padding: 14px 0;
  padding-left:30px;
}

.board-table tbody td {
  border-top: 1px solid #e7e7e7;
}

.board-table tbody th {
  padding-left: 28px;
  padding-right: 14px;
  border-top: 1px solid #e7e7e7;
}

.board-table tbody th p{
  display: none;
}

.board-table a:hover {
 background: transparent;
}

.btn {
  display: inline-block;
  padding: 0 30px;
  font-size: 15px;
  font-weight: 400;
  background: transparent;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
  touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  border: 1px solid transparent;
  text-transform: uppercase;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -ms-transition: all 0.3s;
  -o-transition: all 0.3s;
  transition: all 0.3s;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

.btn-white {
  background: #fff;
  color: #555;
  border-color: #373737;
  height:30px;
  width:100px;
  text-align:center;
  float:right;
  margin-top:10px;
  margin-bottom:10px;
  
}  

.btn-white:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

/* reset */

* {
  list-style: none;
  text-decoration: none;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}
.clearfix:after {
  content: '';
  display: block;
  clear: both;
}
.container {
  width: 1100px;
  margin: 0 auto;
}
.blind {
  position: absolute;
  overflow: hidden;
  clip: rect(0 0 0 0);
  margin: -1px;
  width: 1px;
  height: 1px;
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
            <br>
            
            <h3>의견 게시판</h3>
        </div>
    </div>
	
	  <div id="board-search">
        <div class="container">
            <div class="search-window">
                <form action="">
                    <div class="search-wrap">
		<form action="qBoardList.qb" method="get">
			 <input id="search" type="search" name="keyword" placeholder="검색어를 입력해주세요." value="">
			<button type="submit" class="btn btn-dark">검색</button>
		</form>
		   </form>
            </div>
        </div>
    </div>
</center>




 <div id="board-list">
        <div class="container">
        
<input type=button value="글쓰기" onClick="insert()" class="btn btn-white">
            <table class="board-table">

	
	<tr>
		<th scope="col" class="th-num" width="10%">번호</th>
		<th scope="col" class="th-title" width="30%">제목</th>
		<th width="15%" class="th-writer">작성자</th>
		<th  scope="col" class="th-date"width="17%">작성일</th>
		<th width="13%" class="th-readcount">조회수</th>
	</tr>
	<c:if test="${ !empty list }">
		<c:forEach var="bb" items="${ list }">
			<tr align=center>
				<td>${ bb.q_num }</td>
				<td align="left" >
					<c:set var="wid" value="0"/>
					<c:if test="${ bb.q_re_level > 0 }">
						<c:set var="wid" value="${bb.q_re_level * 20}"/>
						<img src="<%= request.getContextPath() %>/resources/image/level.gif" width="${wid}">
						<img src="<%= request.getContextPath() %>/resources/image/re.png" width="15px">
					</c:if>
						<a href="content.bd?q_num=${ bb.q_num }&pageNumber=${ pageInfo.pageNumber }">
							${ bb.q_subject }</a>
					<c:if test="${ bb.q_readcount >= 10 }">
						<img src="<%= request.getContextPath() %>/resources/image/hot.png">
					</c:if>
				</td>
				<td align="left">${ bb.q_writer }</td>
				<td align="left">
					<fmt:formatDate value="${bb.q_regdate}" pattern="yyyy-MM-dd"/>
				</td>
				<td>${ bb.q_readcount }</td>
			</tr>
		</c:forEach>
	</c:if>
	<c:if test="${ empty list }" >
		<tr align=center>
			<td colspan="8">작성된 글이 없습니다.</td>
		</tr>
	</c:if>
 </table>
        </div>
    </div>
<br>
<center>
	${pageInfo.pagingHtml}
</center> 
	
</article>



<%@ include file="./../views/footer.jsp" %>