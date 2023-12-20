<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../product/productHeader.jsp" %>

<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">

<style type="text/css">
#container {
  max-width: 1100px;
  margin: auto;
  padding-top: 60px;
  font-family: 'RIDIBatang';
}
.tab-wrapper {
  position: relative;
  height: 300px;
  clear: both;
  padding: 6px 15px 0;
  overflow: hidden;
}

.tab-item {
  float: left;
  
  [type="radio"] {
    display: none;
    
    &:checked ~ .tab-label {
      background: #fff;
      border-bottom: 1px solid #fff;
      color: #2a2b39;
      z-index: 55;
      
      & ~ .tab-content {
        z-index: 50;  
      }
    }
  }
}

.tab-label {
  display: flex;
  align-items: center;
  position: relative;
  left: 1px;
  bottom: 2px;
  height: 36px;
  padding-right: 24px;
  padding-left: 24px;
  background: #d9dbe6;
  border: 1px solid #caccdb;
  margin-left: 2px;
  border-top-left-radius: 2px;
  border-top-right-radius: 2px;
  font-weight: bold;
  cursor: pointer;
  font-size: 12px;
  color: #666;
}

.tab-content {
  position: absolute;
  top: 41px;
  right: 0;
  left: 0;
  bottom: 0;
  padding: 15px;
  background: #fff;
  border-top: 1px solid #caccdb;
  overflow: auto;
}
body{
	padding-top: 140px;
}
</style>

<script src="../assets/js/color-modes.js"></script>
<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/checkout/">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

	<div id="container">
		<main>
			<div class="row g-5">
			
				<div class="col-md-5 col-lg-4 order-md-last">
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="text-primary"><b>주문 상품</b></span>
					</h4>
					<ul class="list-group mb-3">
						<li class="list-group-item d-flex justify-content-between lh-sm">
							<div style="margin: 0 !important;">
								<span>${pb.p_name }</span>
								<br>
								<span style="line-height: 220%; color: graytext; font-size: 10pt;">수량 : ${tc.cart_qty}개</span>
							</div>
						</li>
						<li class="list-group-item d-flex justify-content-between lh-sm">
							<span>상품 금액</span>
							<strong>
								<fmt:formatNumber value="${tc.cart_qty * pb.p_price}" pattern="#,###"/>원
							</strong>
						</li>
						<li class="list-group-item d-flex justify-content-between lh-sm">
							<span>배송비</span>
							<strong>
								<fmt:formatNumber value="${deli}" pattern="#,###"/>원
							</strong>
						</li>
						<li class="list-group-item d-flex justify-content-between lh-sm">
							<span>총 결제 금액</span>
							<strong>
								<fmt:formatNumber value="${total}" pattern="#,###"/>원
							</strong>
						</li>
					</ul>
				</div>

				<div class="col-md-7 col-lg-8">
					<h3 class="mb-3"><b>주문 정보 입력</b></h3>
					<br>
					<form class="needs-validation" action="orderCompleted.mall" novalidate>
						<input type="hidden" name="cart_num" value="<%=session.getId()%>">
						
						<div class="row g-3">
							<div class="col-sm-6">
								<label class="form-label">아이디</label> 
								<input type="text" class="form-control" name="u_id" value="${id}" readonly>
							</div>
							<div class="col-sm-6">
								<label class="form-label">수령인 이름</label> 
								<input type="text" class="form-control" name="o_name" id="lastName" value="${name}" required>
							</div>
						</div>
						<br><br>
						
						<div class="row g-3">
							<div class="col-sm-6">
								<label class="form-label">수령인 전화번호</label>
								<br>
								<c:set var="firstList">010, 011, 016, 017, 018, 019</c:set>
								<select name="o_phone1" class="form-select" style="width: 29%; display: inline;" required>
									<c:forEach var="first" items="${firstList}">
										<option value="${first}" <c:if test="${fn:split(phone, '-')[0] eq first }">selected</c:if>>${first }</option>
									</c:forEach>
								</select>
								-
								<input type="text" class="form-control" style="width: 29%; display: inline; text-align: center;" name="o_phone2" value="${fn:split(phone, '-')[1]}" maxlength="4" required>
								-
								<input type="text" class="form-control" name="o_phone3" style="width: 30%; display: inline; text-align: center;" value="${fn:split(phone, '-')[2]}" maxlength="4" required>
							</div>
							<div class="col-sm-6">
								<label class="form-label">전달 사항</label> 
								<c:set var="msgs">전달사항 없음,문 앞에 놓아주세요,경비실에 맡겨주세요,선물 포장해주세요 (+2000원)</c:set>
								<select class="form-select" name="o_message">
									<c:forEach var="msg" items="${msgs}"> 
										<option value="${msg}">${msg}
									</c:forEach> 
								</select>
							</div>
						</div>
						<br><br>

						<div class="col-12">
							<label for="address" class="form-label">수령 주소</label><br> <input
								type="button" onclick="sample4_execDaumPostcode()"
								value="우편번호 찾기"><br>
							<div class="row g-3">
								<div class="col-sm-6">
									<input type="text" name="addr1" class="form-control"
										id="sample4_postcode" id="lastName" placeholder="우편번호"
										required>
								</div>
								<div class="col-sm-6">
									<input type="text" name="addr2" class="form-control"
										id="sample4_roadAddress" id="lastName" placeholder="도로명주소"
										required>
								</div>
							</div>
							<br>
							<div class="row g-3">
								<div class="col-sm-6">
									<input type="text" name="addr3" class="form-control"
										id="sample4_jibunAddress" id="lastName" placeholder="지번주소"
										required>
								</div>
								<span id="guide" style="color: #999; display: none"></span>
								<div class="col-sm-6">
									<input type="text" name="addr4" class="form-control"
										id="sample4_extraAddress" id="lastName" placeholder="참고항목">
								</div>
							</div>
							<br> <input type="text" name="addr5" class="form-control"
								id="sample4_detailAddress" id="lastName" placeholder="상세주소"> 
						</div>
						<br>
						<h4 class="mb-3">지불 방법</h4>


						<div class="tab-wrapper">

							<div class="tab-item">
								<input type="radio" id="tab1" value="무통장 입금" name="way"
									checked="checked"> <label for="tab1" class="tab-label">무통장
									입금</label>

								<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>




								<div class="tab-content">
									<br>
									<div class="col-md-5">
										<label for="country" class="form-label">입금 은행</label> <select
											class="form-select" name="pay_bank" required>
											<option value=""></option>
											<option value="sc제일은행">sc제일은행</option>
											<option value="하나은행">하나은행</option>
											<option value="국민은행">국민은행</option>

										</select>

									</div>
									<br>
									<br>
									<div class="row gy-3">

										<div class="col-12">
											<label for="address" class="form-label">입금자명</label> <input
												type="text" class="form-control" name="pay_name" required>

										</div>

									</div>

								</div>
							</div>




							<div class="tab-item">
								<input type="radio" id="tab2" name="way" value="카카오페이">
								<label for="tab2" class="tab-label">카카오페이</label>
								<div class="tab-content">
									카카오 페이 결제 방법을 선택하셨습니다.<br> 결제 상품 확인 후 주문완료 버튼을 클릭해 주세요.
								</div>
							</div>

						</div>


						<hr class="my-4">

						<button class="w-100 btn btn-primary btn-lg" type="submit">주문
							완료</button>
					</form>
				</div>
			</div>
		</main>
	</div>
	<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
<script>
$(document).ready(function() {
  // 초기에는 유효성 메시지를 숨깁니다
  $('.validation-message').hide();

  // 양식 제출 시 양식 유효성을 검사하는 함수
  $('form').submit(function() {
    var payBank = $('[name="pay_bank"]').val();
    var payName = $('[name="pay_name"]').val();

    // 무통장 입금을 선택하고 입금자명이 비어 있는 경우
    if (payBank === '무통장 입금' && payName === '') {
      // 유효성 메시지를 표시합니다
      $('.validation-message').show();
      return false; // 양식 제출을 막습니다
    }

    // 유효성 메시지를 숨깁니다
    $('.validation-message').hide();
    return true; // 양식 제출을 허용합니다
  });

  // 결제 방법 변경 시 처리하는 함수
  $('[name="way"]').change(function() {
    var payBank = $(this).val();
    var payNameInput = $('[name="pay_name"]');
    var payBankInput = $('[name="pay_bank"]');
    var validationMessage = $('.validation-message');

    // 입력값을 재설정하고 유효성 메시지를 숨깁니다
    payNameInput.val('');
    validationMessage.hide();

    // 결제 방법에 따라 입력 활성화 또는 비활성화
    if (payBank == '무통장 입금') {
      payNameInput.prop('required', true);
      payBankInput.prop('required', true);
    } else {
      payNameInput.prop('required', false);
      payBankInput.prop('required', false);
    }
  });
});






 
}

 
</script>
   
<script type="text/javascript">
//Example starter JavaScript for disabling form submissions if there are invalid fields
(() => {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  const forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }

      form.classList.add('was-validated')
    }, false)
  })
})()





</script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
<%@ include file="../views/footer.jsp" %>
</html>