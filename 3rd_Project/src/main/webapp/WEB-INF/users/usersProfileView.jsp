<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/usersProfileView.css?ver=2209998">
<head>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<!-- moment 라이브러리 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script>
		window.onload = function() {
			$(function() {
				$.ajax({
					url: 'postAjax.cb?c_writer=${c_writer}',
					success: function(post) { // 성공적으로 받아왔을 경우
						post.forEach(function(e){
							// *** 답글만 달고 글을 쓴 적 없는 사람도 고려해야함.
							if(e.c_num != null){
								var date = new Date(e.c_regdate);
								var now24Date = moment(date).format("YYYY-MM-DD");
								var html = '';
								
								html += '<tr>';
								html += '	<td width="3%" align="center">'+e.c_num+'</td>';
								html += '	<td width="10%"><a href="#">'+e.c_subject+'</a></td>';
								html += '	<td width="5%" align="center">'+now24Date+'</td>';
								html += '	<td width="5%" align="center">'+e.c_readcount+'</td>';
								html += '</tr>';
								$('#post-table').append(html);
							} else{
								if(e.pagingHtml === ''){
									$('#post-table').append('작성한 글이 없습니다.');
								} else{
									$('#post-list').append(e.pagingHtml);
								}
							}
						});
					}
				});
				// 댓글단 글을 불러오는 ajax 설정 
				$.ajax({
					url: 'commentAjax.cb?c_writer=${c_writer}',
					success: function(comment) { // 성공적으로 받아왔을 경우
						comment.forEach(function(e){
							if(e.c_num != null){
								var date = new Date(e.c_regdate);
								var now24Date = moment(date).format("YYYY-MM-DD");
								var html = '';
								
								html += '<tr>';
								html += '	<td width="3%" align="center">'+e.c_num+'</td>';
								html += '	<td width="10%"><a href="#">'+e.c_subject+'</a></td>';
								html += '	<td width="5%" align="center">'+now24Date+'</td>';
								html += '	<td width="5%" align="center">'+e.c_readcount+'</td>';
								html += '</tr>';
								$('#comment-table').append(html);
							} else{
								if(e.pagingHtml === ''){
									$('#comment-table').append('작성한 글이 없습니다.');
								} else{
									$('#comment-list').append(e.pagingHtml);
								}
							}
						});
					}
				});
			});
		};
		function convert(e, u_id, type){
			if(e.className === 'off'){
				document.querySelector('.on').className = 'off'; // 기존 'on'클래스를 'off'클래스로 클래스명 변경.
				e.className = 'on'; //  클릭이벤트가 발생한 e, 즉 'off'클래스를 'on'클래스로 클래스명 변경.
				
				if(type === 'post'){
					document.getElementById('post-list').style.display = 'block';
					document.getElementById('comment-list').style.display = 'none';
					
				} else{
					document.getElementById('comment-list').style.display = 'block';
					document.getElementById('post-list').style.display = 'none';
					
				}
			}
		}
	</script>
</head>
<body>
	<!-- border-dark-subtle: 테두리 색상 -->
	<!-- border border-5 border-dark-subtle  -->
	<!-- Today, 방문수, 작성글, 댓글단 글, 퍼스널컬러, 조인데이트, 자기소개, -->
	<div class="profile-container" style="border: 1px solid blue; width: 80%; height: 80%; margin: auto; position: relative; top: 10%;">
		<div class="main-container">
			<div class="img-box">
				<c:if test="${ub.u_profileimg eq null }">
					<img  src="resources/image/person.svg" class="rounded-circle">
				</c:if>
				<c:if test="${ub.u_profileimg ne null }">
					<img  src="${ub.u_profileimg }" class="rounded-circle">
				</c:if>
			</div>
			<div class="explain-box" style="font-family: 'RIDIBatang';">
				<h1>
					<c:if test="${ub.u_jointype eq 'N' }">네이버 연동 회원</c:if>
					<c:if test="${ub.u_jointype eq 'K' }">카카오 연동 회원</c:if>
					<c:if test="${ub.u_jointype eq 'S' }">${ub.u_id }</c:if>
				</h1>
				<font>${ub.u_color } </font>
				<c:if test="${fn:contains(ub.u_color, '봄')}">
					<img src="resources/image/spring-mainImg.png">
				</c:if>
				<c:if test="${fn:contains(ub.u_color, '여름')}">
					<img src="resources/image/summer-mainImg.png">
				</c:if>
				<c:if test="${fn:contains(ub.u_color, '가을')}">
					<img src="resources/image/fall-mainImg.png">
				</c:if>
				<c:if test="${fn:contains(ub.u_color, '겨울')}">
					<img src="resources/image/winter-mainImg.png">
				</c:if>
				<%-- <c:if test="${fn:contains(ub.u_color, '잘')}">
					여기는 물음표 이미지 구해와야함.
				</c:if> --%> <br>
				<font>방문 </font><b>5</b>&nbsp;&nbsp;<!-- user 칼럼에 방문 수 칼럼 추가해야.. -->
				<font>작성글 </font><b>33</b>&nbsp;&nbsp;<!-- 작성글 수 -->
				<font>댓글단 글 </font><b>2</b><br> <!-- 댓글단 글 수 -->
				<font style="font-family: 'MaruBuri-Regular';">${ub.u_intro }</font><br>
			</div>
		</div><hr>
		<!--  color="#7C81BB" -->
		<!-- <font face="RIDIBatang"></font> -->
		<%-- onclick="show(this,'${ub.u_id }')" --%>
		<div class="board-container" style="border: 1px solid fuchsia;">
			<p onclick="convert(this,'${ub.u_id }','post')" class="on" style="font-family:'RIDIBatang'; margin-left: 5%;">작성글</p>
			<p onclick="convert(this,'${ub.u_id }','comment')" class="off" style="font-family:'RIDIBatang'; margin-left: 3%;">댓글단 글</p>
			<div class="list-box" style="border: 1px solid black;">
				<div id="post-list" style="display: block;">
					<table id="post-table" border="1">
						<tr>
							<th></th>
							<th>제목</th>
							<th>작성일</th>
							<th>조회</th>
						</tr>
					</table>
				</div>
				<div id="comment-list" style="display: none;">
					<table id="comment-table" border="1">
						<tr>
							<th></th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회</th>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>

