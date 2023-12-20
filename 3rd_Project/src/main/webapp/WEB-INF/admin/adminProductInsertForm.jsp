<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminMenu.jsp"%>
<style>
	table{
		margin: auto; 
		width: 800px;
		height: 650px;
		font-family: 'RIDIBatang';
	}
	th{
		background: #EAEAEA; 
		padding-left: 10px;
	}
	td{
		padding: 0px 10px 0px 10px;
	}
	#searchBtn{
		width: 120px;
		height: 35px;
		margin-left: 5px;
		background: #EAEAEA;
		border: none;
		border-radius: 3px;
		font-size: 11pt;
	}
	#searchBtn:hover{
		background: #BDBDBD;
		color: white;
	}
	#subBtn{
		width: 120px;
		height: 40px;
		margin-left: 5px;
		color: white;
		background: #8C8C8C;
		border: none;
		border-radius: 3px;
		font-size: 11pt;
	}
	#subBtn:hover{
		background: #EAEAEA;
		color: black;
	}
	#resetBtn{
		width: 120px;
		height: 40px;
		margin-left: 5px;
		background: #EAEAEA;
		border: none;
		border-radius: 3px;
		font-size: 11pt;
	}
	#resetBtn:hover {
		background: #BDBDBD;
		color: white;
	}
}
</style>

<div id="center" style="text-align: center;">
	<br><br><br><br>
	<div>
		<!--  enctype="multipart/form-data" -->
		<form action="productInsert.admin" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>브랜드</th>
				<td>
					<input type="text" class="form-control" name="p_brand" required>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" class="form-control" name="p_name" style="width: 55%;" required>
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>
					<input type="text" class="form-control" name="p_price" required>
				</td>
			</tr>
			<tr>
				<th>지급포인트</th>
				<td>
					<input type="text" class="form-control" name="p_point" required>
				</td>
			</tr>
			<tr>
				<th>재고수량</th>
				<td>
					<input type="text" class="form-control" name="p_stock" required>
				</td>
			</tr>
			<tr>
				<th>누적판매량</th>
				<td>
					<input type="text" class="form-control" name="p_salevolume" required>
				</td>
			</tr>
			<tr>
				<th>퍼스널컬러</th>
				<td>
					<input type="text" class="form-control" name="p_color" required>
				</td>
			</tr>
			<tr>
				<th>제품사진</th>
				<td>
					타이틀이미지: <input type="file" name="upload_ttl" accept="image/jpeg" required><br><br>
					디테일이미지: <input type="file" name="upload_dtl" accept="image/jpeg" required>
					<!-- 타이틀이미지:  <input type="file" name="p_ttlimg" accept="image/jpeg" required><br><br>
					디테일이미지: <input type="file" name="p_dtlimg" accept="image/jpeg" required>  -->
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<br><br>
					<input type="submit" value="추가하기" id="subBtn">
				</td>
			</tr>
		</table>
	</form>
	</div>
</div>