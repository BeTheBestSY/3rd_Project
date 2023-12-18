<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminMenu.jsp"%>

<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/adminCeleb.css">

<script type="text/javascript">

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
											<td>${cb.cl_image}</td>
											<td style="padding-left:25%;">
												<a href="celebDelete.admin?cl_num=${cb.cl_num }&pageNumber=${pageInfo.pageNumber}">
													<input type="button" class="btn btn-white"  value="삭제하기">
												</a>
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
