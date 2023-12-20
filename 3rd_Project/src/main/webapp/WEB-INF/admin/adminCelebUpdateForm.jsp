<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminMenu.jsp"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/adminCompanyUpdate.css">

<style>
input[type="text"] {
  font-size: 15px;
  width: 300px;
  height:35px;
  border: none;
  border-bottom: solid #aaaaaa 1px;
  padding-bottom: 3px;
  padding-left: 10px;
  position: relative;
  background: #f8f9f7;
  z-index: 5;
  border-radius:5px;
}

#searchBtn{
margin-top:13px;
}

table th{
	text-align:left;
}
.board-table{
margin-top:20px;
}
</style>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function zipClick(){
		document.getElementById("searchBtn").click();
	}


		function init(){
			var elem = document.getElementById('keyword');
			elem.value = '';
		}
		
		function up(cl_num,pageNumber){
			if(confirm('수정하시겠습니까?')){
				location.href='celebUpdate.admin?cl_num='+cl_num+'&pageNumber='+pageNumber;
			}
		}
	
</script>

<article id="center" style=" text-align:center; font-family: 'MaruBuri-Regular';" >
	<div class="section">
		<div id="tag" style="margin-right:83%; font-size: 2em;">
			<h4>진단 회사 정보 수정</h4>
		</div>
		
	<div id="center" style="text-align: center;">
			<form action="celebUpdate.admin" method="post">
			<table class="board-table">
				<tr style="border-top: 1px solid #BDBDBD; padding:10px;">
					<th width="20%"><font color="red">*</font> 이름</th>
					<td width="80%">
						<input type="text" class="form-control" name="cl_name" style="width:20%;" value="${bb.cl_name }" required> 원
					</td>
				</tr>
				<tr style="border-top: 1px solid #BDBDBD; padding:10px;">
					<th width="20%"><font color="red">*</font> 이미지</th>
					<td width="80%">
						<input type="text" class="form-control" name="cl_image"  class="form-control"  value="${bb.cl_image }" required>
					</td>
				</tr>
				<tr style="border-top: 1px solid #BDBDBD; padding:10px;">
					<th width="20%"><font color="red">*</font> 퍼스널 컬러</th>
					<td width="80%">
						<input type="text" class="form-control" name="cl_color"  class="form-control"  value="${bb.cl_color}" required>
					</td>
				</tr>
					<td colspan="2" align="center">
						<br>
						<input type="submit" value="수정하기" class="btn btn-white" onClick="up(${bb.cl_num},${pageInfo.pageNumber})" style="margin-bottom:11px; height: 39px; width:150px;" id="subBtn">
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</article>