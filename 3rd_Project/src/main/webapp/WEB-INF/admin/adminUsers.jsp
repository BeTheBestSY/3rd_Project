<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminMenu.jsp"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/adminProduct.css?ver=2206105">
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
<style>
	#btn{
		width: 80px;
		font-family: 'RIDIBatang';
		font-size: 10pt;
	}
</style>
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
				<div class="filter_radio" style="font-family: 'RIDIBatang'; font-size: 11pt;">
					<span style="position:relative;right:26%;bottom:40%;"><input type="radio" name="filter_btn" value="A" style="padding-top: 6px;" <c:if test="${param.filter eq 'A' || param.filter eq null || param.filter eq ''}">checked</c:if> style="width:20px;height:18px;"> 전체 회원</span>
					<span style="position:relative;right:21%;bottom:40%;"><input type="radio" name="filter_btn" value="S" style="padding-top: 6px;" <c:if test="${param.filter eq 'S'}">checked</c:if> style="width:20px;height:18px;"> 기본</span>
					<span style="position:relative;right:15%;bottom:40%;"><input type="radio" name="filter_btn" value="N" style="padding-top: 6px;" <c:if test="${param.filter eq 'N'}">checked</c:if> style="width:20px;height:18px;"> 네이버</span>
					<span style="position:relative;right:10%;bottom:40%;"><input type="radio" name="filter_btn" value="K" style="padding-top: 6px;" <c:if test="${param.filter eq 'K'}">checked</c:if> style="width:20px;height:18px;"> 카카오</span>
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
								<th scope="col" style="width: 68px;"> 
									<div style="left: -11px; position: relative; display: inline;">번호</div>  
								</th>
								<th scope="col" style="width: 131px;"> 
									<div style="left: -5px; position: relative; display: inline;">아이디</div>
								</th>
								<th scope="col" style="width: 123px;"> 
									<div style="left: -8px; position: relative; display: inline;">이름</div>
								</th>
								<th scope="col" style="width: 160px;">
									<div style="left: -6px; position: relative; display: inline;">휴대폰번호</div> 
								</th> 
								<th scope="col" style="width: 343px;">
									<div style="left: -6px; position: relative; display: inline;">주소</div>
								</th>
								<th scope="col" style="width: 108px; background: red;">
									<div style="left: -18px; position: relative; display: inline;">보유 포인트</div> 
								</th>
								<th scope="col" style="width: 108px;">
									<div style="left: -18px; position: relative; display: inline;">퍼스널 컬러</div> 
								</th>
								<th scope="col">가입유형</th>
								<th scope="col">가입일</th>
								<th scope="col">회원상태</th>
								<th scope="col"></th>
							</tr>
						</table>
						<div class="middlebox">
							<div class="box2 scrollnone">
								<table class="colr_table2" style="font-size: 11pt; text-align: center; font-family: 'RIDIBatang';">
									<c:if test="${empty usersLists }">
										<tr>
											<td colspan="12">존재하지 않는 회원 입니다.</td>
										</tr>
									</c:if> 
									
									<c:set var="u_num" value="${fn:length(usersLists)}"/> 
									<c:forEach var="ub" items="${usersLists}">
										<tr style="height: 30px;"> 
											<td width="4.4%">
												${u_num }
												<c:set var="u_num" value="${u_num-1 }"/> 
											</td>
											<td width="8.2%">
												<c:if test="${ub.u_jointype eq 'N' }">
													네이버 연동 회원
												</c:if>
												<c:if test="${ub.u_jointype eq 'K' }">
													카카오 연동 회원
												</c:if>
												<c:if test="${ub.u_jointype eq 'S' }">
													${ub.u_id}
												</c:if>
											</td>
											<td width="8%">${ub.u_name}</td>
											<td width="10%">${ub.u_phone}</td> 
											<td width="21%">${ub.u_address}</td> 
											<td width="8%" style="background: red;">
												<fmt:formatNumber value="${ub.u_point}" pattern="#,###" />
											</td>
											<td width="8%">${ub.u_color}</td> 
											<c:if test="${ub.u_jointype eq 'S'}">
												<td width="6%">기본</td> 
											</c:if>
											<c:if test="${ub.u_jointype eq 'N'}">
												<td width="6%">네이버</td>
											</c:if>
											<c:if test="${ub.u_jointype eq 'K'}">
												<td width="6%">카카오</td>
											</c:if>
											<td width="9%">${ub.u_joindate }</td>
											<td width="7%">
												<c:if test="${ub.u_report > 5}">정지</c:if>
												<c:if test="${ub.u_report <= 5}">-</c:if>
											</td>
											<td width="18%">
												<a href="usersDelete.admin?u_id=${ub.u_id }&u_jointype=${ub.u_jointype}">
													<input type="button" id="btn" class="btn btn-white" 
														<c:if test="${ub.u_jointype eq 'N' || ub.u_jointype eq 'K'}">
															value="연동해제"
														</c:if>
														<c:if test="${ub.u_jointype eq 'S'}">
															value="삭제하기"
														</c:if>
													>
												</a>
												<a href="usersUpdate.admin?u_id=${ub.u_id }">
													<input type="button" id="btn" class="btn btn-white"  value="수정하기">
												</a>
												<a href="#">
													<input type="button" id="btn" class="btn btn-white" style="color: red;" value="정지해제">
												</a>
							 				</td>
										</tr>
									</c:forEach>
								</table>
								${pageInfo.pagingHtml}
							</div>
						</div>
							
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</article>


