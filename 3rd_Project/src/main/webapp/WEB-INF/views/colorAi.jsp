<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
body {
  font-family: sans-serif;
  background-color: #eeeeee;
}

.file-upload {
  background-color: #ffffff;
  width: 600px;
  margin: 0 auto;
  padding: 20px;
}

.file-upload-btn {
  width: 100%;
  margin: 0;
  color: #fff;
  background: #808080;
  border: none;
  padding: 10px;
  border-radius: 5px;
  border-bottom: 5px solid #b3b3b3;
  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
}

.file-upload-btn:hover {
  background: #4d4d4d;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}

.file-upload-btn:active {
  border: 0;
  transition: all .2s ease;
}

.file-upload-content {
  display: none;
  text-align: center;
}

.file-upload-input {
  position: absolute;
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  outline: none;
  opacity: 0;
  cursor: pointer;
}

.image-upload-wrap {
  margin-top: 20px;
  border: 4px dashed #cccccc;
  position: relative;
}

.image-dropping,
.image-upload-wrap:hover {
  background-color: #cccccc;
  border: 4px dashed #ffffff;
}

.image-title-wrap {
 
  color: #222;
}

.drag-text {
  text-align: center;
}

.drag-text h3 {
  font-size:15px;
  font-weight: 100;
  text-transform: uppercase;
  color: #808080;
  padding: 60px 0;
}

.file-upload-image {
  max-height: 200px;
  max-width: 200px;
  margin: auto;
  padding: 20px;
}

.remove-image {
  font-size:15px;
  width: 300px;
  margin: 0;
  color: #fff;
  background: #cd4535;
  border: none;
  padding: 10px;
  border-radius: 4px;
/*   border-bottom: 4px solid #b02818; */
  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
}

.remove-image:hover {
  background: #c13b2a;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}

.remove-image:active {
  border: 0;
  transition: all .2s ease;
}

  #label-container {
    width: 600px;
    background-color: #cccccc;
    font-size: 15px;
   
    border-radius: 10px;  
    border: 3px solid white;
    margin-bottom: 8%;
    }

#finish {
  width: 560px;
  margin: 0;
  color: #fff;
  background: #808080;
  border: none;
  padding: 10px;
  border-radius: 5px;
 /*  border-bottom: 5px solid #b3b3b3; */
  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
}

#finish:hover {
  background: #4d4d4d;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}
</style>

</head>

<!-- 저장용 -->
<!-- 저장용 -->

<%
String id = (String) session.getAttribute("id");
if(id==null){
%>
	<script type="text/javascript">
	alert("로그인 후 이용해주세요.")
	 window.location.href = "login.u";
	</script>
<%
};
%>

<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@latest/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@latest/dist/teachablemachine-image.min.js"></script>
<script type="text/javascript">

      const URL = "https://teachablemachine.withgoogle.com/models/L1G8-g-Oz/";

      let model, webcam, labelContainer, maxPredictions;
  
      async function init() {
        const modelURL = URL + "model.json";
        const metadataURL = URL + "metadata.json";

        model = await tmImage.load(modelURL, metadataURL);
        maxPredictions = model.getTotalClasses();

        labelContainer = document.getElementById("label-container");
        for (let i = 0; i < maxPredictions; i++) { // and class labels
          labelContainer.appendChild(document.createElement("div"));
        }
      }

      async function predict() {
        var image = document.getElementById("face-image")
        const prediction = await model.predict(image, false);
        
        let maxProbabilityIndex = 0;
        let maxProbability = prediction[0].probability;
        
        for (let i = 0; i < maxPredictions-1; i++) {
           if (prediction[i].probability > maxProbability) {
                maxProbability = prediction[i].probability;
                maxProbabilityIndex = i;
            }
        }
        
        let resultText = "<br><br><table style='margin-left:35%; width:40%; height:300px;'>";
        for (let i = 0; i < maxPredictions; i++) {
            var classPrediction = "<tr><td width='40%'>" + prediction[i].className + "</td><td width='10%'> : </td><td width='40%' align='left'>" + (prediction[i].probability ).toFixed(2)*1000/10+"%</td><tr>";
            resultText += classPrediction;
        }
        
        labelContainer.childNodes[1].innerHTML = resultText +"</tr></table>";
        
        if (maxProbability >= 0.3) {
            switch (prediction[maxProbabilityIndex].className) {
            case "봄 라이트":
                labelContainer.childNodes[0].innerHTML = "<br><br><big><b>' 봄 라이트 '</b> 입니다.</big><br><br><br>";
                break;
            case "봄 브라이트":
                labelContainer.childNodes[0].innerHTML = "<br><br><big><b>' 봄 브라이트 '</b> 입니다.</big><br><br><br>";
                break;
            case "여름 라이트":
                labelContainer.childNodes[0].innerHTML = "<br><br><big><b>' 여름 라이트 '</b> 입니다.</big><br><br><br>";
                break;
            case "여름 브라이트":
                labelContainer.childNodes[0].innerHTML = "<br><br><big><b>' 여름 브라이트 '</b> 입니다.</big><br><br><br>";
                break;
            case "여름 뮤트":
                labelContainer.childNodes[0].innerHTML = "<br><br><big><b>' 여름 뮤트 '</b> 입니다.</big><br><br><br>";
                break;
            case "가을 뮤트":
                labelContainer.childNodes[0].innerHTML = "<br><br><big><b>' 가을 뮤트 '</b> 입니다.</big><br><br><br>";
                break;
            case "가을 스트롱":
                labelContainer.childNodes[0].innerHTML = "<br><br><big><b>' 가을 스트롱 '</b> 입니다.</big><br><br><br>";
                break;
            case "가을 딥":
                labelContainer.childNodes[0].innerHTML = "<br><br><big><b>' 가을 딥 '</b> 입니다.</big><br><br><br>";
                break;
            case "겨울 브라이트":
                labelContainer.childNodes[0].innerHTML = "<br><br><big><b>' 겨울 브라이트 '</b> 입니다.</big><br><br><br>";
                break;
            case "겨울 딥":
                labelContainer.childNodes[0].innerHTML = "<br><br><big><b>' 겨울 딥 '</b> 입니다</big><br><br><br>";
                break;
            case "그 외":
                labelContainer.childNodes[0].innerHTML = "<br><br><big>이 사진으로는 측정할 수 없어요!<br> 다른 사진을 넣어 주시겠어요?</big><br><br>";
                break;
                }
        }
        else {
            labelContainer.childNodes[0].innerHTML = "<br><br><big>이 사진으로는 측정할 수 없어요!<br> 다른 사진을 넣어 주시겠어요?</big><br><br>";
        }
    }
      
      $(function(){
         $("#finish").click(function(){
            $("#elseArea").show();
            $("#label-container").show(); 
         });
      });
      
    </script>

 <script>
      function readURL(input) {
        if (input.files && input.files[0]) {

          var reader = new FileReader();

          reader.onload = function (e) {
            $('.image-upload-wrap').hide();

            $('.file-upload-image').attr('src', e.target.result);
            $('.file-upload-content').show();

            $('.image-title').html(input.files[0].name);
          };

          reader.readAsDataURL(input.files[0]);

        } else {
          removeUpload();
        }
      }

      function removeUpload() {
        $('.file-upload-input').replaceWith($('.file-upload-input').clone());
        $('.file-upload-content').hide();
        $('.image-upload-wrap').show();
      }
      $('.image-upload-wrap').bind('dragover', function () {
        $('.image-upload-wrap').addClass('image-dropping');
      });
      $('.image-upload-wrap').bind('dragleave', function () {
        $('.image-upload-wrap').removeClass('image-dropping');
      });





      <!-- 지우기 버튼을 클릭하면 지금 나와있는 결과의 내용도 삭제해야됨 아마 캐쉬 삭제? -->






    </script>

<body onload="init()">
<%@ include file="header.jsp" %>
	<!--
	<center>
	 <button id="start" type="button" onclick="init()">시작</button>
	</center>
	<div class="mb-3">
	 <input class="form-control" type="file" id="formFile" style="width: 500px;">
	</div>
	 -->
     <br><br>
	
	<script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
      <div class="file-upload">
        <button class="file-upload-btn" type="button" onclick="$('.file-upload-input').trigger( 'click' )"
          style="font-family: 'Dovemayo_gothic';">이미지 선택
        </button>

        <div class="image-upload-wrap">
          <input class="file-upload-input" type='file' onchange="readURL(this);" accept="image/*" />
          <div class="drag-text">
            <h3>이미지 드래그</h3>
          </div>
        </div>
        <div class="file-upload-content">
          <img class="file-upload-image" id="face-image" src="#" alt="your image" />
          <div class="image-title-wrap">
            <button type="button" onclick="removeUpload()" class="remove-image">지우기
            </button>
          </div>
        </div>

      </div>
      <center>
        <button type="button" onclick="predict()" id="finish">완료</button>

        <div id="webcam-container"></div>  
        <div id="label-container"></div>
       <a href="company.cmp" class="nav-link px-2 link-body-emphasis">회사</a>
      </center>
      
    
						
<%@ include file="footer.jsp" %>
</body>
</html>