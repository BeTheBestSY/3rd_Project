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
		<form action="productUpdate.admin" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th width="20%">브랜드</th>
				<td width="80%">
					<input type="text" class="form-control" name="p_brand" value="${pb.p_brand }" readonly>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" class="form-control" name="p_name" value="${pb.p_name }" readonly style="width: 55%;">
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>
					<input type="text" class="form-control" name="p_price" value="${pb.p_price }" required>
				</td>
			</tr>
			<tr>
				<th>지급포인트</th>
				<td>
					<input type="text" class="form-control" name="p_point" value="${pb.p_point }" required>
				</td>
			</tr>
			<tr>
				<th>재고수량</th>
				<td>
					<input type="text" class="form-control" name="p_stock" value="${pb.p_stock }" required>
				</td>
			</tr>
			<tr>
				<th>누적판매량</th>
				<td>
					<input type="text" class="form-control" name="p_salevolume" value="${pb.p_salevolume }" required>
				</td>
			</tr>
			<tr>
				<th>퍼스널컬러</th>
				<td>
					<input type="text" class="form-control" name="p_color" value="${pb.p_color }" required>
				</td>
			</tr>
			<tr>
				<th>제품사진</th>
				<td>
					<!-- 새로 올릴 타이틀이미지 -->
					타이틀이미지: <input type="file" name="p_ttlimg" accept="image/jpeg" required><br><br>
					<!-- 기존 타이틀이미지 -->
					<input type="hidden" name="p_ttlimg" value="${pb.p_ttlimg }" accept="image/jpeg" required><br><br>
					<img src="<%=request.getContextPath() %>/resources/uploadFolder/product/${pb.p_ttlimg  }" style="width: 10%; height: 10%;"/>
					
					<!-- 새로 올릴 디테일이미지 -->
					디테일이미지: <input type="file" name="p_dtlimg" accept="image/jpeg" required> 
					<!-- 기존 디테일이미지 -->
					<input type="hidden" name="p_dtlimg" value="${pb.p_dtlimg }" accept="image/jpeg" required><br><br>
					<img src="<%=request.getContextPath() %>/resources/uploadFolder/product/${pb.p_dtlimg  }" style="width: 10%; height: 15%;"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<br><br>
					<input type="submit" value="수정하기" id="subBtn">
				</td>
			</tr>
		</table>
	</form>
	</div>
</div>