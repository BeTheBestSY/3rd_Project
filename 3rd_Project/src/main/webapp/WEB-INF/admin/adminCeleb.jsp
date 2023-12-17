<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminMenu.jsp"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/adminProduct.css">
<script type="text/javascript">
	window.onload = function(){
		const radios = document.querySelectorAll("input[name='filter_btn']");
	 	
		radios.forEach((radio) => {
			radio.addEventListener("change", (e) => {
				const current = e.currentTarget;
				if(current.checked){
					var whatColumn = document.getElementById('whatColumn');
					var keyword = document.getElementById('keyword');
					//alert(column.value+','+keyword.value);
					location.href='productList.admin?filter='+current.value+'&whatColumn='+whatColumn.value+'&keyword='+keyword.value;
				}
			});
		});
	};
	
	// 기존 검색어 지우기
	function init(){
		var elem = document.getElementById('keyword');
		elem.value = '';
	}
	
</script>
<article id="center" style=" text-align:center; font-family: 'MaruBuri-Regular';" >
<div class="section">
	<div class="tag">
		<h4>연예인 관리</h4>
	</div>
	<div id="board-search">
		<div class="container">
			<div class="search-window">
				<div class="search-wrap">
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
								<th scope="col" class="th-name">이름</th>
								<th scope="col" class="th-personalc">퍼스널 컬러</th>
								<th scope="col" class="th-delete"></th>
								<th scope="col" class="th-update"></th>
							</tr>
							
						</table>
						<div class="middlebox">
							<div class="box2 scrollnone">
								<table class="colr_table2" style="font-size: 13pt; text-align: center;">
									<c:if test="${empty celebLists }">
										<tr>
											<td colspan="12">존재하지 않는 상품 입니다.</td>
										</tr>
									</c:if>
									
									<c:forEach var="cb" items="${celebLists }">
										<tr>
											<td>${cb.cl_num}</td>
											<td align="center">${cb.cl_name}</td>
											<td>${cb.cl_color}</td>
											<td>
												<a href="celebDelete.admin?cl_num=${cb.cl_num }">
													<input type="button" class="btn btn-white"  value="삭제하기">
												</a>
												<a href="celebDelete.admin?cl_num=${cb.cl_num }">
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
	</div>
</div>

</article>
