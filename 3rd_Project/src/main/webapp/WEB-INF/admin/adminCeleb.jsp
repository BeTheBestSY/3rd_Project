<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminMenu.jsp"%>
<<<<<<< HEAD
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
		<h4>상품 관리</h4>
	</div>
	<div id="board-search">
		<div class="container">
			<div class="search-window">
				<div class="search-wrap">
					<form action="productList.admin" method="post">
						<select name="whatColumn" id="whatColumn" onchange="init()" >
							<option value="all" <c:if test="${param.whatColumn eq 'all' || param.whatColumn eq ''}">selected</c:if>>전체검색</option>
							<option value="p_brand" <c:if test="${param.whatColumn eq 'p_brand'}">selected</c:if>>브랜드</option>
							<option value="p_color" <c:if test="${param.whatColumn eq 'p_color'}">selected</c:if>>퍼스널컬러</option>
							<option value="p_name" <c:if test="${param.whatColumn eq 'p_name'}">selected</c:if>>상품명</option>
						</select>
						<input type="search" id="keyword" name="keyword" value="${param.keyword }" placeholder="검색어를 입력해주세요.">
						<button type="submit" class="btn btn-dark">검색</button>
					</form>
				</div>
				<div class="filter_radio" style="margin: auto; width: 80%; height: 40px;">
					<span style="position:relative;right:350px; bottom: 20px;"><input type="radio" name="filter_btn" value="standard" <c:if test="${param.filter eq 'standard' || param.filter eq null}">checked</c:if> style="width:20px;height:18px;"> 기본&nbsp;</span>
					<span style="position:relative;right:300px; bottom: 20px;"><input type="radio" name="filter_btn" value="p_stock" <c:if test="${param.filter eq 'p_stock'}">checked</c:if> style="width:20px;height:18px;"> 재고임박순&nbsp;</span>
					<span style="position:relative;right:250px; bottom: 20px;"><input type="radio" name="filter_btn" value="p_salevolume" <c:if test="${param.filter eq 'p_salevolume'}">checked</c:if> style="width:20px;height:18px;"> 누적판매량순&nbsp;</span>
					<span style="position:relative;right:200px; bottom: 20px;"><input type="radio" name="filter_btn" value="p_priceDesc" <c:if test="${param.filter eq 'p_priceDesc'}">checked</c:if> style="width:20px;height:18px;"> 고가순&nbsp;</span>
					<span style="position:relative;right:150px; bottom: 20px;"><input type="radio" name="filter_btn" value="p_priceAsc" <c:if test="${param.filter eq 'p_priceAsc'}">checked</c:if> style="width:20px;height:18px;"> 저가순&nbsp;</span>
					<!-- 출고일(혹은 입고일) 칼럼을 넣어야 할까.. -->
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
								<th scope="col" class="th-id" width="8%">브랜드</th>
								<th scope="col" class="th-name" width="25%">이름</th>
								<th scope="col" class="th-phone">가격</th>
								<th scope="col" class="th-point">재고수량</th>
								<th scope="col" class="th-paint">누적판매량</th>
								<th scope="col" class="th-personalc">퍼스널컬러</th>
								<th scope="col" class="th-delete"></th>
								<th scope="col" class="th-update"></th>
							</tr>
							
						</table>
						<div class="middlebox">
							<div class="box2 scrollnone">
								<table class="colr_table2" style="font-size: 13pt; text-align: center;">
									<c:if test="${empty prodLists }">
										<tr>
											<td colspan="12">존재하지 않는 상품 입니다.</td>
										</tr>
									</c:if>
									
									<c:forEach var="pb" items="${prodLists }">
										<tr>
											<td>${pb.p_num }</td>
											<td>${pb.p_brand }</td>
											<td>${pb.p_name }</td>
											<td>${pb.p_price }</td>
											<td>${pb.p_stock }</td>
											<td>${pb.p_salevolume }</td>
											<td>${pb.p_color }</td>
											<td>
												<a href="productDelete.admin?p_num=${pb.p_num }">
													<input type="button" class="btn btn-white"  value="삭제하기">
												</a>
												<a href="productUpdate.admin?p_num=${pb.p_num }">
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
=======
>>>>>>> branch 'master' of https://github.com/BeTheBestSY/3rd_Project.git

<<<<<<< HEAD
</article>


=======
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/adminCeleb.css">

<script type="text/javascript">

	function init(){
		var elem = document.getElementById('keyword');
		elem.value = '';
	}
	
	function del(cl_num,pageNumber){
		if(confirm('정말로 삭제하시겠습니까?')){
			location.href='celebDelete.admin?cl_num='+cl_num+'&pageNumber='+pageNumber;
		}
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
					<form action="celebList.admin" method="post">
						<select name="whatColumn" id="whatColumn">
							<option value="all">전체검색</option>
							<option value="cl_name">이름</option>
							<option value="cl_color">퍼스널컬러</option>
						</select>
					 	<input id="search" type="search" name="keyword" placeholder="검색어를 입력해주세요." value="">
					<button type="submit" class="btn btn-dark">검색</button>
				   </form>
				</div>
				<div class="filter_radio" style="margin: auto; width: 90%; height: 40px;">
					<span style="position:relative; left: 437px; "><input type="button" class="btn btn-white" value="＋추가하기" onClick="location.href='celebInsert.admin'"></span>
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
								<th class="th-num" width="10%" style="padding-left:4%;">번호</th>
								<th width="5%" align="left" style="padding-left:7%;">이름</th>
								<th width="10%" align="left" style="padding-left:13%;">퍼스널 컬러</th>
								<th width="10%" align="left" style="padding-left:24%;">이미지 파일</th>
								<th></th>
							</tr>
							
						</table>
						<div class="middlebox">
							<div class="box2 scrollnone">
								<table class="colr_table2" style="font-size: 13pt; text-align: center;">
									<c:if test="${empty celebLists }">
										<tr>
											<td colspan="12">존재하지 않습니다.</td>
										</tr>
									</c:if>
									
									<c:forEach var="cb" items="${celebLists }">
										<tr style="border-bottom:1px solid #eee;">
											<td style="padding-left:4%;">${cb.cl_num}</td>
											<td style="padding-left:6%;">${cb.cl_name}</td>
											<td>${cb.cl_color}</td>
											<td>${cb.cl_image}&nbsp;&nbsp;
												<span class="prd-img" title="연예인 이미지">
													<font color="#C98BA4">
														<ion-icon name="image-outline"></ion-icon>
													</font>
												</span>
											</td>
											
											<td style="padding-left:25%;">
												<input type="button" class="btn btn-white"  value="삭제하기" onClick="del(${cb.cl_num},${pageInfo.pageNumber})">
												<a href="celebUpdate.admin?cl_num=${cb.cl_num }&pageNumber=${pageInfo.pageNumber}">
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
>>>>>>> branch 'master' of https://github.com/BeTheBestSY/3rd_Project.git
