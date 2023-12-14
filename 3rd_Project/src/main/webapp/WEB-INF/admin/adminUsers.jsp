<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/admin_Q_Board.css">
<%@ include file="adminMenu.jsp"%>
<script type="text/javascript">
	
	function goDelete(q_num,pageNumber){
		location.href="qBoardDelete.admin?q_num="+q_num+"&pageNumber="+pageNumber;
	}
	
</script>
<article id="center" style=" text-align:center; font-family: 'MaruBuri-Regular';" >
<div class="section">
	<div class="tag">
		<h4>회원 관리</h4>
	</div>
	<div id="board-search">
		<div class="container">
			<div class="search-window">
				<div class="search-wrap">
					<form action="adminUsersList.admin" method="post">
						<select name="whatColumn" id="whatColumn">
							<option value="all">전체검색</option>
							<option value="u_name">이름</option>
							<option value="u_id">아이디</option>
							<option value="u_address">주소</option>
						</select>
						<input id="search" type="search" name="keyword" placeholder="검색어를 입력해주세요.">
						<button type="submit" class="btn btn-dark">검색</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="board-list" >
	<div class="container" >
		<div class="row">
			<div class="whole1">
				<div class="topbox1">
					<input type="hidden" name="q_num" value="${ bb.q_num }">
					<input type="hidden" name="pageNumber" value="${ pageInfo.pageNumber}">
					<table class="board-table" style="font-size: 13pt; text-align: center; table-layout:fixed;">
						<tr style="background: #f4f4f4;">
							<th scope="col" class="th-num" width="10%">번호</th>
							<th scope="col" class="th-id" width="24%" align="left">아이디</th>
							<th width="10%" class="th-name">이름</th>
							<th width="10%" class="th-phone">휴대폰번호</th>
							<th scope="col" class="th-address" width="10%">주소</th>
							<th width="10%" class="th-point">보유 포인트</th>
							<th width="10%" class="th-paint">결제 수단</th>
							<th width="10%" class="th-personalc">퍼스널컬러</th>
							<th width="10%" class="th-jointype">가입유형</th>
							<th width="10%" class="th-joindate">가입일</th>
						</tr>
						<c:if test="${empty usersLists }">존재하지 않는 회원 입니다.</c:if>
						<c:forEach var="ub" items="${usersLists }" varStatus="status">
							<tr>
								<td>${status.index }</td>
								<td>${ub.u_id }</td>
								<td>${ub.u_name }</td>
								<td>${ub.u_phone }</td>
								<td>${ub.u_address }</td>
								<td>${ub.u_point }</td>
								<td>${ub.u_pay }</td>
								<td>${ub.u_color }</td>
								<td>${ub.u_jointype }</td>
								<td>${ub.u_joindate }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<%-- <div class="middlebox">
	<div class="box2 scrollnone">
		<div class="box2 scrollnone">
			<table class="colr_table2"  style="font-size: 13pt; text-align: center; ">
				<c:set var="num" value="${pageInfo.totalCount-pageInfo.beginRow+1}" />
				<c:forEach var="bb" items="${ list }">
					<tr style="border-bottom:1px solid #eee;">
						<td width="11%">
							${num }
							<c:set var="num" value="${num -1}" />
						</td>
						<td align="left" style=" width:48%;  text-align: left;">
							<c:set var="wid" value="0"/>
							<c:if test="${ bb.q_re_level > 0 }">
								<c:set var="wid" value="${bb.q_re_level * 20}"/>
								<img src="<%= request.getContextPath() %>/resources/image/re.png" width="2%">
							</c:if>
								<a href="detail.qb?q_num=${ bb.q_num }&pageNumber=${ pageInfo.pageNumber }" id="noneHigtLight">
									${ bb.q_subject }&nbsp;</a>
							<c:if test="${ bb.q_readcount >= 10 }">
								<img src="<%= request.getContextPath() %>/resources/image/hot.png" width="2%">
							</c:if>
						</td>
						<td width="11%">${ bb.q_writer }</td>
						<td width="11%">${ bb.q_email }</td>
						<td width="10%">
							<fmt:formatDate value="${bb.q_regdate}" pattern="yyyy-MM-dd"/>
						</td>
						<td>
							<a href="qBoardDelete.admin?q_num=${bb.q_num}&pageNumber=${pageInfo.pageNumber}">
								<input type="button" class="btn btn-white"  value="삭제하기">
							</a>
		 				</td>
					</tr>
				</c:forEach>
				<c:if test="${ empty list }" >
				<tr>
					<td colspan="8">작성된 글이 없습니다.</td>
				</tr>
			</c:if>
			</table>
		</div>
	</div>
</div> --%>
</article>


