<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
    <section> <!--중반부의 레이아웃-->

        <div class="container" id="one"> <!-- 중반부 전체를 감싸는 div 태그-->
            
            <div class="first"> <!--중반부 를 두개의 div태그로 나누어 왼쪽 절반의 구역으로 나눠줌-->
          
                <img  src="<%=request.getContextPath() %>/resources/uploadFolder/${pb.p_ttlimg }" alt="타이틀이미지">
            </div>

            <div class="second"> <!--중반부 를 두개의 div태그로 나누어 오른쪾 절반의 구역으로 나눠줌-->
                   
                

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
                                    <span class="l">배송비</span>
                                    <span>3,000원</span class="r">
                                </li>
                               
                                <li>
                                    <span class="l">수량</span>
                                    <span><input type="number" name="oqty" value="1" id="num" placeholder="단위(개)" oninput="updateTotalAmount()"></span class="r">
                                </li>
                            </ul>
                        </div>

                     

                    </div>

                    <div class="allegy"> 
	                   
	                   	 <fmt:formatNumber value="${pb.p_price }" pattern="#,###" />원
	                    
                    </div>
<br>

<button>장바구니</button>
<button>바로구매</button>
                  

       </section>
       <br><br>
    <hr>
    <br><br>
<center>
<img alt="상세이미지" src="<%=request.getContextPath() %>/resources/uploadFolder/${pb.p_dtlimg }">
                <img  src="<%=request.getContextPath() %>/resources/uploadFolder/product/${pb.p_ttlimg }" alt="타이틀이미지">
            </div>

            <div class="second"> <!--중반부 를 두개의 div태그로 나누어 오른쪾 절반의 구역으로 나눠줌-->
                   
                

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
                                    <span class="l">배송비</span>
                                    <span>3,000원</span class="r">
                                </li>
                               
                                <li>
                                    <span class="l">수량</span>
                                    <span><input type="number" name="oqty" value="1" id="num" placeholder="단위(개)" oninput="updateTotalAmount()"></span class="r">
                                </li>
                            </ul>
                        </div>

                     

                    </div>

                    <div class="allegy"> 
	                   
	                   	 <fmt:formatNumber value="${pb.p_price }" pattern="#,###" />원
	                    
                    </div>
<br>

<button>장바구니</button>
<button>주문하기</button>
                  

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