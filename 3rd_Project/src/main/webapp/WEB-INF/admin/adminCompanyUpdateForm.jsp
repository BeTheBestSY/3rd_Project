<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminMenu.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/adminCompanyUpdate.css">
<script>
	function zipClick(){
		document.getElementById("searchBtn").click();
	}
</script>
<article id="center" style=" text-align:center; font-family: 'MaruBuri-Regular';" >
<div class="section">
		<div id="tag" style="margin-right:83%; font-size: 2em;">
			<h4>진단 회사 관리</h4>
		</div>
		<br>
		
	<div id="center" style="text-align: center;">
			<form action="adminCompanyUpdate.admin" method="post">
			<table class="board-table">
				<tr style="border-top: 2px solid graytext; padding:10px;">
					<th width="20%"><font color="red">*</font> 회사명</th>
					<td width="80%">
						<input type="text" class="form-control" name="cmp_name" value="${bb.cmp_name }" >
					</td>
				</tr>
				<tr style="border-top: 1px solid #BDBDBD; padding:10px;">
					<th>&nbsp;&nbsp;주소</th>
					<td>
						<input type="text" class="form-control" style="width: 70%; display: inline; margin-bottom: 10px;" name="cmp_addr" value="${cb.cmp_addr eq '-' ? '': fn:split(cb.cmp_addr, ',')[0]}" id="sample4_postcode" placeholder="먼저 우편번호 찾기 버튼을 눌러주세요." onClick="zipClick()" >
						<input type="button" class="btn btn-white" onclick="sample4_execDaumPostcode()" style="margin-bottom:11px; height: 39px; width:150px;"  value="우편번호 찾기" id="searchBtn"><br>
						<input type="text" class="form-control" name="cmp_addr" value="${bb.cmp_addr eq '-' ? '': fn:split(cb.cmp_addr, ',')[1]}" id="sample4_roadAddress" placeholder="도로명주소" style="margin-bottom: 10px;" onClick="zipClick()" >
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" class="form-control" name="cmp_addr" value="${bb.cmp_addr eq '-' ? '': fn:split(cb.cmp_addr, ',')[2]}" id="sample4_detailAddress" placeholder="상세주소" >
					</td>
				</tr>
				<tr style="border-top: 1px solid #BDBDBD; padding:10px;">
					<th width="20%"><font color="red">*</font> 진단 비용</th>
					<td width="80%">
						<input type="text" class="form-control" name="cmp_price" value="${bb.cmp_price }" >
					</td>
				</tr>
				<tr style="border-top: 1px solid #BDBDBD; padding:10px;">
					<th width="20%"><font color="red">*</font> 지하철 역</th>
					<td width="80%">
						<input type="text" class="form-control" name="cmp_station"  class="form-control"  value="${bb.cmp_station }" >
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<br>
						<input type="submit" value="수정하기" class="btn btn-white" style="margin-bottom:11px; height: 39px; width:150px;" id="subBtn">
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</article>