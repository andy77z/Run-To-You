<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="/resources/vendors/niceselect/css/nice-select.css" />
<link rel="stylesheet" href="/resources/css/ent/entCommon.css" type="text/css"/>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<script src="/resources/js/jquery-3.4.1.min.js"></script>
<script src="/resources/vendors/niceselect/js/jquery.nice-select.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> <!-- 이쁜 alert 창 -->

<style>
	.loding-center {
		width: 100%;
		position: relative;
		z-index: 1;
	}

	.spinner-border {
		display: block;
		position: fixed;
		top: calc(50% - (58px / 2));
		right: calc(50% - (58px / 2));
	}
</style>

<script>

	$(document).ready(function () {

		// 이전 페이지에서 받아온 파라미터
		var getParamRcptNo = '${param.rcptNo}';
		var getPramPntCd = '${param.pntCd}';
		var getPramRsvtNo = '${pram.rsvtNo}';

		$('.spinner-border').hide();
		if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
			navigator.mediaDevices.getUserMedia({ video: true }).then(function (stream) {
				var video = document.getElementById('video');
				video.srcObject = stream;
				video.play();
			});
		}
		var canvas = document.getElementById('canvas');
		var context = canvas.getContext('2d');
		var video = document.getElementById('video');

		$("#webcamBtn").click(function () {			
			context.drawImage(video, 0, 0, 320, 240);
			$('.spinner-border').show();
			$.ajax({
				'type': 'post'
				, 'data': {
					'base64img': canvas.toDataURL()
					, 'empCd': '${loginUser.empCd}'
					, 'rcptNo': getParamRcptNo
				}
				, 'url': '/medical/insertCam'
				, beforeSend: function (jqXHR, settings) {
					// ajax 사용시 헤더에 스프링시큐리티 토큰 설정
					var token = '${_csrf.token}'
					var header = '${_csrf.headerName}'
					jqXHR.setRequestHeader(header, token);
				}
			})

			.done((data) => {
				console.log('data');
				console.log(data);
				swal("성공", "촬영하였습니다.", "success");
				$('.spinner-border').hide();
			})

			.fail((data) => {
				console.log('fail');
				console.log(data);
				$('.spinner-border').hide();
			});

		});

		// 진료페이지 버튼 누를때
		/*$('#goTreatBtn').click(function () {

			var paramObj = new Object();
			paramObj.pntCd = getPramPntCd;
			paramObj.rsvtNo = getPramRsvtNo;
			paramObj.rcptNo = getParamRcptNo;

			var strParam = $.param(paramObj);
			location.href = "/medical/treat?" + strParam;

		});*/
		
		// 닫기 버튼 누를때
		$('#closeBtn').click(function () {
			opener.fnSelectListAllCam();
			window.close();
		});

	});

</script>

</head>

<body>
	<div class="loding-center">
		<div class="spinner-border" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>

	<video id="video" width="320" height="240" autoplay></video>
	<button type="button" class="btn btn-primary" id="webcamBtn">촬영하기</button>
<!-- 	<button type="button" class="btn btn-primary" id="goTreatBtn">진료페이지</button> -->
	<button type="button" class="btn btn-primary" id="closeBtn">닫기</button>

	<div class="page-header">
		<h4>촬영결과</h4>
	</div>
	
	<canvas id="canvas" width="320" height="240"></canvas>
</body>

</html>