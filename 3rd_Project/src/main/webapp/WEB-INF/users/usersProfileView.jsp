<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/usersProfileView.css?ver=220619">
<head>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<!-- moment 라이브러리 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script>
		/* var link-on, link;
		window.onload = function() {
			link-on = document.querySelector('.link-on');
			link = document.querySelector('.link');
			//link-on.addEventListener('click', alert(1));
			link.addEventListener('click', () => {alert(1);});
		}; */
		function show(e, u_id, type){
			if(e.className === 'link'){
				// 기존 'link-on'클래스는 'link'로,
				document.querySelector('.link-on').className = 'link';
				// e의 'link'클래스는 'link-on'으로 수정
				e.className = 'link-on';
			}
			$(function() {
				alert(type);
				if(type === 'post'){
					$.ajax({
						url: 'cBoardAjax.cb?u_id='+u_id,
						success: function(data) { // 성공적으로 받아왔을 경우
							$(data).each(function() {
								var date = new Date(this.c_regdate);
								var now24Date = moment(date).format("YYYY-MM-DD HH:mm:ss");
								alert(this.c_num+"/"+this.c_subject+"/"+now24Date+"/"+this.c_readcount);
							});
						}
					});
				} else{ // 댓글단 글일 경우의 ajax 요청
					
				}
			});
		}
	</script>
</head>
<body>
	<!-- border-dark-subtle: 테두리 색상 -->
	<!-- Today, 방문수, 작성글, 댓글단 글, 퍼스널컬러, 조인데이트, 자기소개, -->
	<div class="profile-container" style="border: 1px solid blue; width: 70%; height: 80%; margin: auto; position: relative; top: 10%;">
		<h1 style="font-family: 'RIDIBatang';">${ub.u_id }의 프로필</h1>
		<div class="main-container" style="border: 1px solid green;">
			<div class="img-box" style="border: 1px solid red;">
				<c:if test="${ub.u_profileimg eq null }">
					<img  src="resources/image/person.svg" class="border border-5 border-dark-subtle rounded-circle">
				</c:if>
				<c:if test="${ub.u_profileimg ne null }">
					<img  src="${ub.u_profileimg }" class="border border-5 border-dark-subtle rounded-circle">
				</c:if>
			</div>
			<div class="explain-box" style="border: 1px solid black; font-family: 'MaruBuri-Regular';">
				방문: <br> <!-- user 칼럼에 방문 수 칼럼 추가해야.. -->
				작성글:<br> <!-- 작성글 수 -->
				댓글단 글:<br> <!-- 댓글단 글 수 -->
				퍼스널컬러: ${ub.u_color }<br>
				가입일: ${ub.u_joindate }<br>
				자기소개: ${ub.u_intro }<br>
			</div>
		</div>
		<!--  color="#7C81BB" -->
		<!-- <font face="RIDIBatang"></font> -->
		<%-- onclick="show(this,'${ub.u_id }')" --%>
		<div class="board-container" style="border: 1px solid fuchsia;">
			<p onclick="show(this,'${ub.u_id }','post')" class="link-on" style="font-family:'RIDIBatang'; margin-left: 5%;">작성글</p>
			<p onclick="show(this,'${ub.u_id }','comment')" class="link" style="font-family:'RIDIBatang'; margin-left: 3%;">댓글단 글</p>
			<div class="article-box" style="border: 1px solid black; margin-top: 2%;">
				<form>
				
				</form>
			</div>
		</div>
	</div>

</body>

