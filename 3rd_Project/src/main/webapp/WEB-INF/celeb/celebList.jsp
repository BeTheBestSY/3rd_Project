<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/album/">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
#s {
	margin: 0 auto;
	width: 500px;
}

.celebNull {
	margin: 0 auto;
	margin-top: 10%;
	margin-bottom: 5%;
}
body {
	padding-top: 90px;
}
</style>
</head>
<%@ include file="../views/header.jsp" %>
<body>
<div id="wrap">
	
	<br><br>
<article id="center" style=" text-align:center; font-family: 'MaruBuri-Regular';" >
<main> 
<section>
<ul class="nav nav-underline justify-content-center">
  
 <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="celebList.cel?whatColumn=cl_color&keyword=봄" role="button" data-bs-toggle="dropdown" aria-expanded="false">
         봄
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="celebList.cel?whatColumn=cl_color&keyword=봄+라이트">봄 라이트</a></li>
            <li><a class="dropdown-item" href="celebList.cel?whatColumn=cl_color&keyword=봄+브라이트">봄 브라이트</a></li>
          </ul>
   </li>
  <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="celebList.cel?whatColumn=cl_color&keyword=여름" role="button" data-bs-toggle="dropdown" aria-expanded="false">
          여름
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="celebList.cel?whatColumn=cl_color&keyword=여름+라이트">여름 라이트</a></li>
            <li><a class="dropdown-item" href="celebList.cel?whatColumn=cl_color&keyword=여름+브라이트">여름 브라이트</a></li>
            <li><a class="dropdown-item" href="celebList.cel?whatColumn=cl_color&keyword=여름+뮤트">여름 뮤트</a></li>
          </ul>
   </li>
   <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="celebList.cel?whatColumn=cl_color&keyword=가을" role="button" data-bs-toggle="dropdown" aria-expanded="false">
          가을
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="celebList.cel?whatColumn=cl_color&keyword=가을+뮤트">가을 뮤트</a></li>
            <li><a class="dropdown-item" href="celebList.cel?whatColumn=cl_color&keyword=가을+스트롱">가을 스트롱</a></li>
            <li><a class="dropdown-item" href="celebList.cel?whatColumn=cl_color&keyword=가을+딥">가을 딥</a></li>
          </ul>
   </li>
  <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="celebList.cel?whatColumn=cl_color&keyword=겨울" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        겨울
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="celebList.cel?whatColumn=cl_color&keyword=겨울+브라이트">겨울 브라이트</a></li>
            <li><a class="dropdown-item" href="celebList.cel?whatColumn=cl_color&keyword=겨울+딥">겨울 딥</a></li>
          </ul>
   </li>
 
</ul>
</section>
<br><br>
   

  <div class="album py-5 bg-body-tertiary">
    <div class="container">
	
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
      
<c:if test="${fn:length(celebLists) == 0}">
	<div class="celebNull">
	 	<center>
			<b>등록된 연예인이 없습니다.</b><br><br>
	    </center>
	</div>
</c:if>
<c:if test="${fn:length(celebLists) != 0}">
<c:forEach var="cb" items="${ celebLists }">
        <div class="col">
          <div class="card shadow-sm">
         		 <img src="<%=request.getContextPath() %>/resources/uploadFolder/celeb/${cb.cl_image}"  height="480" >
            <div class="card-body">
              <p class="card-text">${cb.cl_name}</p>
              <div class="d-flex justify-content-between align-items-center">
              </div>
            </div>
          </div>
        </div>
 </c:forEach>
</c:if>
 
 
      </div>
    </div>
  </div>
  <center>
 	 ${pageInfo.pagingHtml}
  </center>
</main>
</div>
</article>
</body>
<%@ include file="../views/footer.jsp" %>
</html>