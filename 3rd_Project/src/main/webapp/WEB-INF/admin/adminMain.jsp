<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/adminMain.css">
<%@ include file="adminMenu.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/emn178/chartjs-plugin-labels/src/chartjs-plugin-labels.js"></script>

<body>

<article id="center" style=" text-align:center; font-family: 'MaruBuri-Regular';" >
	<div class="section">
		<div id="userInfo" style="float:left; width:700px; height:400px; border: 1px solid #373737; margin-left:4%; margin-top:2%;">
			 <div class="userCount" style="float:left; width:220px; height:200px; border: 1px solid #373737; ">
			 	회원 수
			 </div>
			 <div class="newUserCount" style="float:left; width:220px; height:200px; border: 1px solid #373737; ">
			 	신규 회원 수
			 </div>
			 <div class="visitCount" style="float:left; width:258px; height:200px; border: 1px solid #373737; ">
			 	방문자 수
			 </div>
			  <div class="visitCount" style="float:left; width:698px; height:200px; border: 1px solid #373737; ">
			 	피드백
			 </div>
		</div>
		<div id="orderInfo" style="float:right; margin-right:4%; margin-top:2%; border: 1px solid #373737;">
			<canvas id="myChart" width="800" height="400"></canvas>
		</div>
		<br>
		<div style="float:left; width:92%; height:300px; margin-left:4%; margin-top:2%; border: 1px solid #373737; ">
			상품 관리 테이블
		</div>
	</div>
</article>





<script>
	var config = new Chart(document.getElementById("myChart").getContext('2d'),{
		type: 'line',   // 차트의 종류를 선언한다.
		data: {
			labels: ['봄 라이트', '봄 브라이트', '여름 라이트', '여름 브라이트', '여름 뮤트', '가을 뮤트', '가을 스트롱', '가을 딥','겨울 브라이트','겨울 딥'],
			datasets: [{                             // datasets 값의 배열을 추가하면 그림2와 같이 하나의 canvas에 두가지 데이터를 출력할 수 있다.
				label: '수량'   
				, backgroundColor: 'rgba(255, 99, 132, 0.2)'
				, borderColor: 'rgb(255, 99, 132)'
				, data: [51, 33, 60, 25, 80, 40, 77, 100, 50, 34]
				, fill: true
			}]
		},
		options: {
			responsive: false,    // 차트의 반응형 여부를 정하는 옵션. false일 때, canvas태그에 사이즈 속성을 주면 해당 값으로 고정형 차트가 출력된다. default = true = 반응형.
			title: {
				display: true,              
				text: '퍼스널 컬러 별 주문 수량' 
			},
			scales: {
				xAxes: [{                     
					display: true,                // x축 표시 여부.
					scaleLabel: {                 // 축 라벨에 대한 옵션.
						display: true,        // 라벨 표시 여부.
						labelString: 'Personal Color'  // 라벨 이름.
					}
				}],
				yAxes: [{
					display: true,
					scaleLabel: {
						display: true,
						labelString: 'count'
					},
					ticks: {
						beginAtZero: false,   // true일 경우 y축 값이 0부터 시작한다.
	                                                      stepSize: 10          // y축 값의 간격을 지정한다.
					}
				}]
			}
		}
	});
</script>

</body>
 