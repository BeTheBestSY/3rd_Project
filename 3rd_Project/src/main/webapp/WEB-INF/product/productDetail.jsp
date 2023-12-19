<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%
	application.setAttribute("flag", false);
%>

<!doctype html>
<html>

<head>
<meta charset="UTF-8">
 <title>list</title>

<style type="text/css">
body {
margin: 0;
}

* {
box-sizing: border-box;
}

li {
margin: 0;
padding: 0;
}

ul {
margin: 0;
padding: 0;
display: flex;
list-style: none;
}

.container {
width: 900px;
margin: 10px auto;
} /*폭을 일정하게 담기 위한 css*/

.menu {
display: flex;
justify-content: space-between;
align-items: center;
height: 50px;

margin: 10px auto;
background-color: #cccccc;
} /* 상단 메뉴를 디자인하는 CSS */

.logo {

margin-top: 12px;
font-size: 30px;
text-decoration: none;
color: white;
margin-left: 15%;
font-weight: bold;
} /* Webucks font를 위한 CSS*/

li .menu-list {
margin-right: 10px;
padding: 10px;
color: black;
text-decoration: none;
color: gray;
} /* 상단 배너 내의 버튼들을 디자인해주는 CSS */

.first {
width: 50%;
margin-right: 5px;
} /* 화면을 이분할하기 위해 width에 50% 적용 */

.second {
width: 50%;
} /* 화면을 이분할하기 위해 width에 50% 적용 */

.left {
font-size: 20px;
font-weight: bold;
}

.coldbrew {
font-size: 23px;
font-weight: bold;
}

#one {
display: flex;
} /* container div중 하나를 선택하기 위한 id태그*/

#one img {
width: 95%;
}

.gray {
text-align: right;
color: gray;
font-size: 12px;
font-style: bold;
}

.coffeename {
font-size: 20px;
font-weight: bold;
margin-bottom: 0;
}

.coffeename2 {
font-size: 13px;
margin-top: 3px;
padding-bottom: 5px;
}

.seconddetail {
padding-top: 17px;
border-top: 3px solid black;
font-size: 13px;
font-weight: bold;
padding-bottom: 30px;
border-bottom: 1px solid lightgray;
margin: 0;
}

.productdetail {
display: flex;
justify-content: space-between;
border-bottom: 1px solid lightgray;
padding-top: 20px;
padding-bottom: 20px;
margin: 0;
}

.productdetail span {
margin-left: 12px;
margin-right: 12px;
font-size: 17px;
font-weight: bold;
margin-bottom: 0;
}
.productdetail2 {
display: flex;
justify-content: space-between;

padding-top: 20px;
padding-bottom: 20px;
margin: 0;
}
.boxone {
width: 100%;

}
.boxtwo {
width: 50%;
}

.productdetail2 ul {
display: flex;
flex-direction: column;
padding: 10px 5px 10px 3px;
margin: 0 15px 0 15px;
}

.productdetail2 li {
display: flex;
justify-content: space-between;
font-weight: bold;
margin-bottom: 5px;
} /* productdetail2 의 ul과 ㅣi 모두 화면과 같은 레이아웃을 적용해주기 위해 
위와 같이 Flex가 주된 css 적용*/

.allegy {

display: flex;
background-color: rgb(243, 240, 240);
height: 45px;
align-items: center;
padding-left: 10px;
border-radius: 3px;
font-weight: bold;
}
.reviewnav {
font-size: 20px;
font-weight: bold;
border-bottom: 1px solid lightgray;
padding-top: 10px;
padding-bottom: 15px;
}

.id {
font-weight: bold;
font-size: 13px;
}

.ment {
font-size: 13px;
margin-left: 5px;
}

.reviewcomment {
font-size: 13px;
font-weight: bold;
color: rgb(151, 143, 143);
background-color: rgb(243, 240, 240);
margin-top: 20px;
padding: 7px;
width: 100%;
border: 1px solid rgb(243, 240, 240);
} /* 리뷰 입력창을 위한 CSS*/

.bottomzone {
display: flex;
background-color: rgb(44, 40, 40);
padding: 30px;
justify-content: space-around;
color: white;
font-size: 13px;
padding-top: 40px;
} /* 최하단부의 배너를 포괄하는 div의 CSS*/

.bottomzone ul {
display: flex;
flex-direction: column;
margin-top: 0;
padding: 0;
}

.bottomzone li {
padding-bottom: 8px;
}
</style>
</head>
<%@ include file="../views/header.jsp" %>
<body>
    <nav> <!--최상단의 배너-->
        <div class="menu">
            <p class="logo">${pb.p_color}</p>
            
        </div>
    </nav>
<br>
 <%
 	UsersBean ub = (UsersBean)session.getAttribute("loginInfo");
 	String cart_num = session.getId();
 
 	if(ub == null){ 
 		response.sendRedirect("login.u"); 
 	}
 	
 %>
  <script type="text/javascript">
	       function goCart(pnum){
	    	   
	    	ovalue = document.f.oqty.value;
	    	if(ovalue < 1 || ovalue ==""){
	    		alert("1이상 입력하세요.");
	    		return false;
	    	} 
	
	    	/*
	    	document.f.action=	"cartAdd.jsp?pnum=" + pnum + "&ovalue=" + ovalue;
	    	document.f.submit(); 
	    	window.location.href = "cart.mall";
	    	*/
	    
	    	document.f.action="cart.mall";
	    	document.f.submit();   
	    	}
	       
	       
	       function goOrder(pnum) {
	           ovalue = document.f.oqty.value;
	           if (ovalue < 1 || ovalue == "") {
	               alert("1이상 입력하세요.");
	               return false;
	           }
	           
	           // 사용자가 로그인했는지
	           <%-- if (<%=id%> == null) {
	               alert("로그인 후 이용해주세요.");
	               return document.f.action = "login.u";
	           } --%>
	           
	            //주문 처리
	           document.f.action="order.mall";
	           document.f.submit();   
	           
	        
	       }
	       
	    
</script>
	   	 
<script type="text/javascript">
    function updateOrderAmount() {
        var quantity = document.getElementById('num').value;
        var unitPrice = ${pb.p_price }; // 서버 측 데이터에서 단가 가져오기

        // 주문 금액 계산
        var orderAmount = quantity * unitPrice;

        // 배송비 계산
        var deliveryFee = orderAmount >= 30000 ? 0 : 3000;

        // 총액 계산
        var totalAmount = orderAmount + deliveryFee;

        // 표시된 배송비 및 총액 업데이트
        document.getElementById('deliveryFee').innerText =  new Intl.NumberFormat().format(deliveryFee) + '원';
        document.getElementById('totalAmount').innerText = '총액: ' + new Intl.NumberFormat().format(totalAmount) + '원';
    }
</script>
	   	    
	       
<c:set var="ub" value="<%=ub%>" />

	<section> <!--중반부의 레이아웃-->

        <div class="container" id="one"> <!-- 중반부 전체를 감싸는 div 태그-->
            
            <div class="first"> <!--중반부를 두개의 div태그로 나누어 왼쪽 절반의 구역으로 나눠줌 -->
          
                <img  src="<%=request.getContextPath() %>/resources/uploadFolder/product/${pb.p_ttlimg }" alt="타이틀이미지">
            </div>

            <div class="second"> <!--중반부 를 두개의 div태그로 나누어 오른쪾 절반의 구역으로 나눠줌-->
<form name="f">
 <input type="hidden" name="p_num" value="${pb.p_num}">
 <input type="hidden" name="id" value="${ub.u_id}">
 <input type="hidden" name="cart_num" value="<%=cart_num%>">                   
                

                    <div id="fifth">
                        <div class="emojiright">
                            <p class="coffeename">${pb.p_name}</p>
                            <p class="coffeename2">${pb.p_brand}</p>
                        </div>
                       
                    </div>

                    <p class="seconddetail">${pb.p_contents}</p>

                    <div class="productdetail">
                        <span>판매가</span>
                        <span><fmt:formatNumber value="${pb.p_price }" pattern="#,###" />원</span>
                    </div>

                    <div class="productdetail2"> <!--영양정보를 담아주는 div 태그-->
                        <div class="boxone"> <!--영양 정보를 좌우로 반반 나눠주었으며, 왼쪽에 해당하는 div 태그-->
                            <ul>
                                <li>
                                    <span class="l">배송비( 30,000 원 이상 무료배송 )</span>
                                    <span id="deliveryFee" class="r">3,000원</span>
                                    
                                </li>
                               
                                <li>
                                    <span class="l">수량</span>
                                    <span  class="r"><input type="number" name="oqty" value="1" id="num" placeholder="단위(개)" oninput="updateOrderAmount()"></span>
                                </li>
                            </ul>
                        </div>

                     

                    </div>

                    <div class="allegy"> 
	                   <span id="totalAmount">총액: <fmt:formatNumber value="${pb.p_price }" pattern="#,###" />원</span>
	                    
                    </div>
<br>
</form>  
	  
		<button onclick="return goCart('${pb.p_num}')">장바구니</button>
  		<button onclick="return goOrder('${pb.p_num}')">주문하기</button>
  		</div>
  		</div>
	</section>       
  
       <br><br>
    <hr>
    <br><br>
<center>
<img alt="상세이미지" src="<%=request.getContextPath() %>/resources/uploadFolder/product/${pb.p_dtlimg }">
<%=request.getContextPath() %>/resources/uploadFolder/product/${pb.p_dtlimg }
</center>
</body>
<%@ include file="../views/footer.jsp" %>

</html>