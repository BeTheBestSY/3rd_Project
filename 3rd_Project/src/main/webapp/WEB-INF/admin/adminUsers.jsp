<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminMenu.jsp"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/adminProduct.css">
<script type="text/javascript">
	window.onload = function(){
		const filter = document.getElementById("filter");
		const radios = document.querySelectorAll("input[name='filter_btn']");
	 	filter.addEventListener("change", (e) => {
	 		// 여기서부터 하기
	 	});
		radios.forEach((radio) => {
			radio.addEventListener("change", (e) => {
					var current = e.currentTarget;
					var whatColumn = document.getElementById('whatColumn');
					var keyword = document.getElementById('keyword');
					location.href='productList.admin?filter='+current.value+'&whatColumn='+whatColumn.value+'&keyword='+keyword.value;
				}
			);
		});
	};
	//filtering은 보류.. 너무 어렵다
	function filtering(){
		var filter = document.getElementById('filter');
		var filValue = filter.options[filter.selectedIndex].value;
		var filter_radio = document.querySelector('.filter_radio');
		
		switch (filValue) {
			case 'u_jointype':
				if(document.getElementById('a')){
					a.remove();
				}
				var div = document.createElement('div');
				div.setAttribute('id', 'a');
				div.setAttribute('style', 'display: inline-block;');
				div.innerHTML = 
				`
				<input type="radio" name="u_jointype" value="S" checked style="width:20px;height:18px;border:1px;">기본
				<input type="radio" name="u_jointype" value="N" style="width:20px;height:18px;border:1px;">네이버
				<input type="radio" name="u_jointype" value="K" style="width:20px;height:18px;border:1px;">카카오
				`;
				filter_radio.appendChild(div);
				
				break;
			case 'u_joindate':
				if(document.getElementById('a')){
					a.remove();
				}
				var div = document.createElement('div');
				div.setAttribute('id', 'a');
				div.setAttribute('style', 'display: inline-block;');
				div.innerHTML = 
				`
				<input type="radio" name="u_joindate" value="asc" checked style="width:20px;height:18px;border:1px;">오래된 순
				<input type="radio" name="u_joindate" value="desc" style="width:20px;height:18px;border:1px;">최근 가입 순
				`;
				filter_radio.appendChild(div);
				
				break;
			case 'u_color':
				if(document.getElementById('a')){
					a.remove();
				}
				var div = document.createElement('div');
				div.setAttribute('id', 'a');
				div.setAttribute('style', 'display: inline-block;');
				div.innerHTML = 
				`
				<input type="radio" name="u_color" value="spring" checked style="width:20px;height:18px;border:1px;">봄
				<input type="radio" name="u_color" value="summer" style="width:20px;height:18px;border:1px;">여름
				<input type="radio" name="u_color" value="fall" style="width:20px;height:18px;border:1px;">가을
				<input type="radio" name="u_color" value="winter" style="width:20px;height:18px;border:1px;">겨울
				`;
				filter_radio.appendChild(div);
				break;
			default:
				break;
		}
		// 함수 호출, 여기 안 됨 ㅜㅜ
		//var button = document.querySelector('input[type="radio"]');
		filter_radio.addEventListner('click', (e) => {
			alert(e.currentTarget.children[0]);
		})
		/* parent.addEventListener('click', (e) => {
	    	e.currentTarget.children[0].style.backgroundColor = 'green'
	  	}) */
	  	
		function init(){
			var elem = document.getElementById('search');
			elem.value = '';
		}
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
							<option value="all" <c:if test="${param.whatColumn eq 'all' || param.whatColumn eq ''}">selected</c:if>>전체검색</option>
							<option value="u_name" <c:if test="${param.whatColumn eq 'u_name'}">selected</c:if>>이름</option>
							<option value="u_id" <c:if test="${param.whatColumn eq 'u_id'}">selected</c:if>>아이디</option>
							<option value="u_phone" <c:if test="${param.whatColumn eq 'u_phone'}">selected</c:if>>휴대폰번호</option>
						</select>
						<input id="search" type="search" name="keyword" value="${param.keyword }" placeholder="검색어를 입력해주세요.">
						<button type="submit" class="btn btn-dark">검색</button>
					</form>
				</div>
				<div style="margin: auto; width: 80%; height: 6%;">
					<div class="filter_select" style="display: inline-block;"><!--  width: 80%; height: 6%;  -->
						<select id="filter" onChange="filtering()">
							<option value="u_jointype">가입유형</option>
							<option value="u_joindate">가입일</option>
							<option value="u_color">퍼스널컬러</option>
						</select>
					</div>
					<div class="filter_radio" style="display: inline-block; height: 6%;">
						<input type="radio" name="filter_btn" value="S" checked>기본
						<input type="radio" name="filter_btn" value="N">네이버
						<input type="radio" name="filter_btn" value="K">카카오
					</div>
					<div class="filter_radio" style="display: none; height: 6%;">
						<input type="radio" name="filter_btn" value="asc" checked>오래된 순
						<input type="radio" name="filter_btn" value="desc">최근 가입 순
					</div>
					<div class="filter_radio" style="display: none; height: 6%;">
						<input type="radio" name="filter_btn" value="spring" checked>봄
						<input type="radio" name="filter_btn" value="summer">여름
						<input type="radio" name="filter_btn" value="fall">가을
						<input type="radio" name="filter_btn" value="winter">겨울
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


