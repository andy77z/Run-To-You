<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="/resources/js/html2canvas.js"></script>
<script>
var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
var csrfHeader = $("meta[name=_csrf_header]").attr("content");
var csrfToken = $("meta[name=_csrf]").attr("content");

//스냅샷 리스트
var snapList = [];
function partShot() {
	//특정부분 스크린샷
	html2canvas(document.getElementById("mirrored"))
	//id container 부분만 스크린샷
	.then(function (canvas) {
		//찍을때마다 리스트에 보관
		snapList.push(canvas);
		//jpg 결과값
		drawImg(canvas.toDataURL('image/jpeg'));
		//이미지 저장
		//이미지 이름을 환자코드 + 날짜 + 순번 .jpg 이런식으로 하면 될듯
// 		saveAs(canvas.toDataURL(), 'file-name.jpg');
	}).catch(function (err) {
		console.log(err);
	});
}

function drawImg(imgData) {
	  return new Promise(function reslove() {
		  var captureBody = document.querySelector("#captureBody");
		  
		  //내가 결과 값을 그릴 canvas 부분 설정
		  var canvas = document.getElementById('mirrored');
		  var ctx = canvas.getContext('2d');
		  //canvas의 뿌려진 부분 초기화
		  ctx.clearRect(0, 0, canvas.width, canvas.height);
		  
		  var imageObj = new Image();
		  imageObj.onload = function () {
			  ctx.drawImage(imageObj, 0, 0,canvas.width,canvas.height);
			  //canvas img를 그리겠다.
		  };
		  imageObj.src = imgData;
		  imageObj.className = "snapImag";
		  //그릴 image데이터를 넣어준다.
		  captureBody.appendChild(imageObj);
	
	  }, function reject() { 
	  		
	  });
}

//사진 다운로드
function savePic(){
	var list = [];
	var today = new Date();
	var year = today.getFullYear(); 
	var month = today.getMonth() + 1; 
	var date = today.getDate();

	var dayInfo = `\${year}\${month >= 10 ? month : '0' + month}\${date >= 10 ? date : '0' + date}`
	
	for(var i = 0; i < snapList.length; i++){
		var map = {
				"uri":snapList[i].toDataURL('image/jpeg')
				,"fileNm": i+1 + "_" + dayInfo + "_PNT00001.jpg"
				,"pntCd": "PNT00001"
				,"treatCd": "TRT00001"
				,"fileNo": i+1
				,"empCd": "EMP00001"
				,"fileCls": "환부사진"
			}
		list.push(map);
	}
	
	$.ajax({
		url: '/downloadSnapImg',
		type: 'post',
		data: JSON.stringify(list),
		contentType: 'application/json',
		beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			xhr.setRequestHeader(csrfHeader, csrfToken);
        },
		success: function(data){
			if(data){
				alert("저장완료");
			}
		}
	})
}

//사진 눌러서 삭제
$(document).on("click",".snapImag",function(){
	for(var i = 0; i < snapList.length; i++){
		var src = snapList[i].toDataURL('image/jpeg');
		if(src == this.src){
			snapList.splice(i, 1);
		}
	}
	$(this).remove();
})
	 
// 캠 찍어서 좌우반전 canvas에 뿌리기
document.addEventListener("DOMContentLoaded", () => {
	  new App();
})

class App {
  constructor() {
    const video = document.querySelector("#videoElement");

    if (navigator.mediaDevices.getUserMedia) {
      navigator.mediaDevices.getUserMedia({ video: true })
        .then( (stream) => { // function 의 this와 화살표 함수의 this 가 다름
          video.srcObject = stream;
        })
        .catch(function (error) {
          console.log("Something went wrong!");
          console.log(error);
          return;
        });
    }

    video.addEventListener( "loadedmetadata", () => {
      window.requestAnimationFrame(this.draw.bind(this));
    });
  }
  
  draw(t) {
    window.requestAnimationFrame(this.draw.bind(this));
    
    const canvas = document.querySelector("#mirrored");
    const video = document.querySelector("#videoElement");
    canvas.width = video.videoWidth;
    canvas.height = video.videoHeight;

    const ctx = canvas.getContext('2d');
    ctx.translate(video.videoWidth, 0);
    ctx.scale(-1,1);
    ctx.drawImage(video, 0, 0, 
    	video.videoWidth, 
        video.videoHeight);  
  }
  
}

$(function(){
	$.ajax({
		url: '/snapLog',
		type: 'get',
		data: {"treatCd": "TRT00001",
			   "pntCd": "PNT00001"},
		dataType : "html", 
		success: function(res){
			var html = $("<div>").html(res);
			var contents = html.find("div#snapLog").html();
			$("#snapLog").html(contents);
		}
	})
})
</script>

<style>
#videoElement, #mirrored{
	width: 300px;
	height: 200px;
	background-color: #666;
  	display: inline-block;
}
#videoElement{
	display: none;
}
#captureBody, #snapLog{
	display: flex;
	justify-content: flex-start;
	align-content: flex-start;
	background-color: #666;
	height: 300px;
	flex-wrap: wrap;
	overflow-y: auto;
}
#captureBody img, #snapLog img{
	margin: 15px;
	width: 150px;
	height: 100px;
	cursor: pointer;
	filter: xray;
}
</style>


	<video autoplay="true" id="videoElement"></video>
	<canvas class="canvas" id="mirrored"></canvas>
	<input type=button id="getPic" onclick="partShot()" value="촬영">
	<input type=button id="savePic" onclick="savePic()" value="저장">
	<div id="captureBody"></div>
	<div id="snapLog"></div>