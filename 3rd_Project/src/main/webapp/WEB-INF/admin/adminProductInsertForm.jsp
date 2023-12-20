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
<script type="text/javascript">
	window.onload = function(){
		const realUpload_ttl = document.querySelector('input[name="upload_ttl"]');
		const realUpload_dtl = document.querySelector('input[name="upload_dtl"]');
		const upload_ttl = document.querySelector('.upload_ttl');
		const upload_dtl = document.querySelector('.upload_dtl');

		upload_ttl.addEventListener('click', () => realUpload_ttl.click());
		upload_dtl.addEventListener('click', () => realUpload_dtl.click());
		
		/* input에 파일이 업로드되면 change event 가 발생 */
		realUpload_ttl.addEventListener('change', getTitleImage); // getTitleImage 함수 등록
		realUpload_dtl.addEventListener('change', getDetailImage); // getDetailImage 함수 등록
		
		function getTitleImage(e) {
	     	const file = e.currentTarget.files[0];
	      	const reader = new FileReader(); // file을 담을 변수
	      	reader.readAsDataURL(file);
	      	reader.onload = (e) => {
	      		// 파일이 로드되면 이미지를 해당 파일로 고치기
	      		upload_ttl.setAttribute('src', e.target.result);
	        };
	    }
		
		function getDetailImage(e) {
	     	const file = e.currentTarget.files[0];
	      	const reader = new FileReader(); // file을 담을 변수
	      	reader.readAsDataURL(file);
	      	reader.onload = (e) => {
	      		// 파일이 로드되면 이미지를 해당 파일로 고치기
	      		upload_dtl.setAttribute('src', e.target.result);
	        };
	    }
	};
</script>
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
				<th>제품설명</th>
				<td>
					<textarea class="form-control" name="p_contents" placeholder="제품설명 입력" required></textarea>
				</td>
			</tr>
			<tr>
				<th>제품사진</th>
				<td height="50%">
					<input type="file" name="upload_ttl" accept="image/*" required style="display: none">
					<input type="file" name="upload_dtl" accept="image/*" required style="display: none">
					* 타이틀이미지 업로드<br>
					<img class="upload_ttl" alt="타이틀이미지" src="<%=request.getContextPath()%>/resources/image/no-image.jpg" style="border:1px solid black; width:15%; height: 35%; cursor:pointer;"><br><br>
					* 디테일이미지 업로드<br>
					<img class="upload_dtl" alt="디테일이미지" src="<%=request.getContextPath()%>/resources/image/no-image.jpg" style="border:1px solid black; width:15%; height: 35%; cursor:pointer;"><br><br>
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