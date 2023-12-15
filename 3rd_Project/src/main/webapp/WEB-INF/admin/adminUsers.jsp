<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminMenu.jsp"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/admin_Q_Board.css">
<script type="text/javascript">
	function init(){
		var elem = document.getElementById('search');
		elem.value = '';
	}
	
	function filtering(){
		var filter = document.getElementById('filter');
		var filValue = filter.options[filter.selectedIndex].value;
		var dtl_filter = document.getElementById('dtl_filter');
		
		switch (filValue) {
			case 'u_jointype':
				//p.setAttribute('style','display: inline');
				if(document.getElementById('a')){
					a.remove();
				}
				var p = document.createElement('p');
				p.setAttribute('id', 'a');
				p.innerHTML = 
				`
				<input type="radio" name="u_jointype" value="S" checked>기본
				<input type="radio" name="u_jointype" value="N">네이버
				<input type="radio" name="u_jointype" value="K">카카오
				`;
				dtl_filter.appendChild(p);
				
				break;
			case 'u_joindate':
				if(document.getElementById('a')){
					a.remove();
				}
				var p = document.createElement('p');
				p.setAttribute('id', 'a');
				p.innerHTML = 
				`
				<input type="radio" name="u_joindate" value="asc" checked>오래된 순
				<input type="radio" name="u_joindate" value="desc">최근 가입 순
				`;
				dtl_filter.appendChild(p);
				
				break;
			case 'u_color':
				if(document.getElementById('a')){
					a.remove();
				}
				var p = document.createElement('p');
				p.setAttribute('id', 'a');
				p.innerHTML = 
				`
				<input type="radio" name="u_color" value="spring" checked>봄
				<input type="radio" name="u_color" value="summer">여름
				<input type="radio" name="u_color" value="fall">가을
				<input type="radio" name="u_color" value="winter">겨울
				`;
				dtl_filter.appendChild(p);
				break;
			default:
				break;
		}
		// 함수 호출, 여기 안 됨 ㅜㅜ
		var button = document.querySelector('input[type="radio"]');
		button.onClick = function (event){
			alert(1);
		};
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
						<select name="whatColumn" id="whatColumn" onchange="init()" >
							<option value="all" <c:if test="${param.whatColumn eq 'all' || param.whatColumn eq ''}">selected</c:if>>전체검색</option>
							<option value="u_name" <c:if test="${param.whatColumn eq 'u_name'}">selected</c:if>>이름</option>
							<option value="u_id" <c:if test="${param.whatColumn eq 'u_id'}">selected</c:if>>아이디</option>
							<option value="u_phone" <c:if test="${param.whatColumn eq 'u_phone'}">selected</c:if>>휴대폰번호</option>
						</select>
						<input id="search" type="search" name="keyword" value="${param.keyword }" placeholder="검색어를 입력해주세요.">
						<button type="submit" class="btn btn-dark">검색</button>
					</form>
					<select id="filter" onChange="filtering()">
						<option value="u_jointype">가입유형</option>
						<option value="u_joindate">가입일</option>
						<option value="u_color">퍼스널컬러</option>
					</select>
					<!-- <div id="dtl_filter" style="display: inline;"> -->
					<div id="dtl_filter">
						<p id="a">
							<input type="radio" name="u_jointype" value="S" checked>기본
							<input type="radio" name="u_jointype" value="N">네이버
							<input type="radio" name="u_jointype" value="K">카카오
						</p>
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
						<table class="board-table" style="font-size: 13pt; text-align: center; table-layout:fixed;">
							<tr style="background: #f4f4f4;">
								<th scope="col" class="th-num">번호</th>
								<th scope="col" class="th-id" width="8%">아이디</th>
								<th scope="col" class="th-name">이름</th>
								<th scope="col" class="th-phone">휴대폰번호</th>
								<th scope="col" class="th-address" width="30%">주소</th>
								<th scope="col" class="th-point">보유 포인트</th>
								<th scope="col" class="th-paint">결제 수단</th>
								<th scope="col" class="th-personalc">퍼스널컬러</th>
								<th scope="col" class="th-jointype">가입유형</th>
								<th scope="col" class="th-joindate">가입일</th>
								<th scope="col" class="th-delete"></th>
								<th scope="col" class="th-update"></th>
							</tr>
<<<<<<< HEAD
							<c:if test="${empty usersLists }">존재하지 않는 회원 입니다.</c:if>
							<c:set var="u_num" value="${fn:length(usersLists)}"/>
							<c:forEach var="ub" items="${usersLists}" varStatus="status">
								<tr>
									<td>
										${u_num }
										<c:set var="u_num" value="${u_num-1}"/>
=======
							<c:if test="${empty usersLists }">
								<tr>
									<td colspan="12">존재하지 않는 회원 입니다.</td>
								</tr>
							</c:if>
							
							<c:set var="u_num" value="${fn:length(usersLists) }"/>
							<c:forEach var="ub" items="${usersLists }" varStatus="status">
								<tr>
									<td>
										${u_num }
										<c:set var="u_num" value="${u_num-1 }"/>
									</td>
									<td>
										<c:if test="${ub.u_jointype eq 'N' }">
											네이버 연동 회원
										</c:if>
										<c:if test="${ub.u_jointype eq 'K' }">
											카카오 연동 회원
										</c:if>
										<c:if test="${ub.u_jointype eq 'S' }">
											${ub.u_id }
										</c:if>
>>>>>>> 3f1b063dd1001cd8d14a1d38cc18fb3a043f0802
									</td>
									<td>${ub.u_name }</td>
									<td>${ub.u_phone }</td>
									<td>${ub.u_address }</td>
									<td>${ub.u_point }</td>
									<td>${ub.u_pay }</td>
									<td>${ub.u_color }</td>
									<c:if test="${ub.u_jointype eq 'S'}">
										<td>기본</td>
									</c:if>
									<c:if test="${ub.u_jointype eq 'N'}">
										<td>네이버</td>
									</c:if>
									<c:if test="${ub.u_jointype eq 'K'}">
										<td>카카오</td>
									</c:if>
									<td>${ub.u_joindate }</td>
									<td>
										<c:if test="${ub.u_jointype eq 'N' || ub.u_jointype eq 'K'}">
											<a href="#">
												<input type="button" class="btn btn-white"  value="연동해제">
											</a>
										</c:if>
										<c:if test="${ub.u_jointype eq 'S'}">
											<a href="adminUsersDelete.admin?u_id=${ub.u_id }">
												<input type="button" class="btn btn-white"  value="삭제하기">
											</a>
										</c:if>
										<a href="adminUsersUpdate.admin?u_id=${ub.u_id }">
											<input type="button" class="btn btn-white"  value="수정하기">
										</a>
					 				</td>
								</tr>
							</c:forEach>
						</table>
					</div>
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


