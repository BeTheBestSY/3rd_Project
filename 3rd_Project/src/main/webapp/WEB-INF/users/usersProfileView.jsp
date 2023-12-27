<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<style>
		img{
			width: 100%;
			object-fit: cover;
		}
		.profile-container{
			display: flex;
			flex-direction: column;
		}
		.main-container{ /* profile-container의 flex item */
			display:flex;
			flex-wrap: wrap;
		}
		.board-container{ /* profile-container의 flex item */
			flex-basis: 70%;
		}
		.img-box{ /* main-container의 flex item */
			flex-basis: 40%;
		}
		.explain-box{ /* main-container의 flex item */
			flex-basis: 60%;
		}
		@font-face {
		    font-family: 'MaruBuri-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/MaruBuri-Regular.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		} 
		@font-face {
		    font-family: 'RIDIBatang'; 
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
	</style>
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
			<div class="explain-box" style="border: 1px solid black;">
				방문: <br> <!-- user 칼럼에 방문 수 칼럼 추가해야.. -->
				작성글:<br> <!-- 작성글 수 -->
				댓글단 글:<br> <!-- 댓글단 글 수 -->
				퍼스널컬러: ${ub.u_color }<br>
				가입일: ${ub.u_joindate }<br>
				자기소개: ${ub.u_intro }<br>
			</div>
		</div>
		<div class="board-container" style="border: 1px solid fuchsia;">
			<a href="#"><u>작성글</u></a>
			<a href="#"><u>댓글단 글</u></a>
		</div>
		<div>
		
		</div>
	</div>

</body>

