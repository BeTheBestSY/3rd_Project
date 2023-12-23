<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminMenu.jsp"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/adminProduct.css?ver=2206102">
<script type="text/javascript">
	window.onload = function(){
		const radios = document.querySelectorAll("input[name='filter_btn']");
		radios.forEach((radio) => {
			radio.addEventListener("change", (e) => {
				var current = e.currentTarget;
				var whatColumn = document.getElementById('whatColumn');
				var keyword = document.getElementById('keyword');

				location.href='usersList.admin?filter='+current.value+'&whatColumn='+whatColumn.value+'&keyword='+keyword.value;
				
			});
		});
	};
	
	function init(){
		var elem = document.getElementById('search');
		elem.value = '';
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
					<form action="usersList.admin" method="post">
						<select name="whatColumn" id="whatColumn" onchange="init()" >
							<option value="all" <c:if test="${param.whatColumn eq 'all' || param.whatColumn eq null}">selected</c:if>>전체검색</option>
							<option value="u_name" <c:if test="${param.whatColumn eq 'u_name'}">selected</c:if>>이름</option>
							<option value="u_id" <c:if test="${param.whatColumn eq 'u_id'}">selected</c:if>>아이디</option>
							<option value="u_phone" <c:if test="${param.whatColumn eq 'u_phone'}">selected</c:if>>휴대폰번호</option>
						</select>
						<input type="search" id="keyword" name="keyword" <c:if test="${param.keyword ne null }">value="${param.keyword }"</c:if> placeholder="검색어를 입력해주세요.">
						<button type="submit" class="btn btn-dark">검색</button>
					</form>
				</div>
				<div class="filter_radio">
					<span style="position:relative;right:26%;bottom:40%;"><input type="radio" name="filter_btn" value="A" <c:if test="${param.filter eq 'A' || param.filter eq null || param.filter eq ''}">checked</c:if> style="width:20px;height:18px;"> 전체 회원</span>
					<span style="position:relative;right:21%;bottom:40%;"><input type="radio" name="filter_btn" value="S" <c:if test="${param.filter eq 'S'}">checked</c:if> style="width:20px;height:18px;"> 기본</span>
					<span style="position:relative;right:15%;bottom:40%;"><input type="radio" name="filter_btn" value="N" <c:if test="${param.filter eq 'N'}">checked</c:if> style="width:20px;height:18px;"> 네이버</span>
					<span style="position:relative;right:10%;bottom:40%;"><input type="radio" name="filter_btn" value="K" <c:if test="${param.filter eq 'K'}">checked</c:if> style="width:20px;height:18px;"> 카카오</span>
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
								<th scope="col" class="th-num" style="padding-right: 4%;">번호</th>
								<th scope="col" class="th-id" style="padding-right: 4%;">아이디</th>
								<th scope="col" class="th-name" style="padding-right: 12%;">이름</th>
								<th scope="col" class="th-phone" style="padding-right: 14%;">휴대폰번호</th>
								<th scope="col" class="th-address" style="padding-left: 11.5%;">주소</th>
								<th scope="col" class="th-point" style="padding-left: 13.5%;">보유 포인트</th>
								<th scope="col" class="th-pay" style="padding-left: 11.8%;">결제 수단</th>
								<th scope="col" class="th-personalc" style="padding-left: 9.5%;">퍼스널컬러</th>
								<th scope="col" class="th-jointype" style="padding-left: 9%;">가입유형</th>
								<th scope="col" class="th-joindate" style="padding-left: 7%;">가입일</th>
								<th scope="col" class="th-delete"></th>
								<th scope="col" class="th-update"></th>
							</tr>
						</table>
						<div class="middlebox">
							<div class="box2 scrollnone">
								<table class="colr_table2" style="font-size: 13pt; text-align: center;">
									<c:if test="${empty usersLists }">
										<tr>
											<td colspan="12">존재하지 않는 회원 입니다.</td>
										</tr>
									</c:if>
									
									<c:set var="u_num" value="${fn:length(usersLists) }"/>
									<c:forEach var="ub" items="${usersLists }">
										<tr>
											<td width="6%">
												${u_num }
												<c:set var="u_num" value="${u_num-1 }"/>
											</td>
											<td width="10%">
												<c:if test="${ub.u_jointype eq 'N' }">
													네이버 연동 회원
												</c:if>
												<c:if test="${ub.u_jointype eq 'K' }">
													카카오 연동 회원
												</c:if>
												<c:if test="${ub.u_jointype eq 'S' }">
													${ub.u_id }
												</c:if>
											</td>
											<td width="8%">${ub.u_name }</td>
											<td width="17%">${ub.u_phone }</td>
											<td width="18%">${ub.u_address }</td>
											<td width="8%">${ub.u_point }</td>
											<td width="8%">${ub.u_pay }</td>
											<td width="10%">${ub.u_color }</td>
											<c:if test="${ub.u_jointype eq 'S'}">
												<td width="8%">기본</td>
											</c:if>
											<c:if test="${ub.u_jointype eq 'N'}">
												<td width="8%">네이버</td>
											</c:if>
											<c:if test="${ub.u_jointype eq 'K'}">
												<td width="8%">카카오</td>
											</c:if>
											<td width="17%">${ub.u_joindate }</td>
											<td>
												<c:if test="${ub.u_jointype eq 'N' || ub.u_jointype eq 'K'}">
													<a href="#">
														<input type="button" class="btn btn-white"  value="연동해제">
													</a>
												</c:if>
												<c:if test="${ub.u_jointype eq 'S'}">
													<a href="usersDelete.admin?u_id=${ub.u_id }">
														<input type="button" class="btn btn-white"  value="삭제하기">
													</a>
												</c:if>
												<a href="usersUpdate.admin?u_id=${ub.u_id }">
													<input type="button" class="btn btn-white"  value="수정하기">
												</a>
							 				</td>
										</tr>
									</c:forEach>
								</table>
								${pageInfo.pagingHtml }
							</div>
						</div>
							
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</article>


