<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/receive/receiveCommon.css" type="text/css" />
<script src="/resources/js/receiveCommon.js"></script>
<script src="/resources/js/html2canvas.js"></script>
<script src="https://unpkg.com/@popperjs/core@2"></script>
<script src="https://unpkg.com/tippy.js@6"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> <!-- 이쁜 alert 창 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>

<style>
	#divHeading{
		display: inline-block;
		width: 100%;
		height:8%;
		text-align: center;
		font-weight: bold;
		font-size: 1.5em;
	}
	.gun{
		font-weight:bold;
	}
	.money{
		text-align: right;
	}
	.getMoney:hover{
		background-color:rgb(233, 233, 233);
		cursor: pointer;
	}
	input {
	  width: 500px;
	  height: 32px;
	  font-size: 15px;
	  border: 0;
	  border-radius: 15px;
	  outline: none;
	  padding-left: 10px;
	  background-color: rgb(233, 233, 233);
	}
</style>


<div id="chart">
	<div id="divHeading">
		진료별 금액
	</div>
	
	<table style="width:100%; height:85%; border-collapse:collapse;" border="1">
	<thead>
	  <tr>
	    <th colspan="2" class="title">환자등록번호</th>
	    <th class="title">환자명</th>
	    <th colspan="2" class="title">진료일</th>
	  </tr>
	</thead>
	<tbody>
	  <tr>
	    <td colspan="2" class="content">${param.pntCd}</td>
	    <td class="content" id="rpntNm">${vo1.pntNm}</td>
	    <td colspan="2"class="content">${vo1.treatDt}</td>
	  </tr>
	  <tr>
	    <td colspan="2" class="title">진료과</td>
	    <td class="title">질병명</td>
	    <td class="title">질병번호</td>
	    <td class="title">수납번호</td>
	  </tr>
	  <tr>
	    <td colspan="2" class="content">${vo1.secNm}</td>
	    <td class="content" id="disNm" style="text-align:left"></td>
	    <td class="content" id="disCd"></td>
	    <td class="content">${vo1.rcvCd}</td>
	  </tr>
	  <tr>
	    <td rowspan="6" class="title">기본항목</td>
	    <td colspan="4" class="title">항목</td>
	  </tr>
	  <tr>
	    <td class="title">진료비</td>
	    <td class="content money"></td>
	    <td class="title">담당의</td>
	    <td class="content">${vo1.chrDr}</td>
	  </tr>
	  <tr>
	    <td class="title">검사료</td>
	    <td class="content money getMoney" id="inspecAmt"></td>
	    <td class="title">검사명</td>
	    <td class="content" id="inspecNm" style="text-align:left;"></td>
	  </tr>
	  <tr>
	    <td class="title">투약료</td>
	    <td class="content money getMoney" id="injectAmt"></td>
	    <td class="title">투약명</td>
	    <td class="content" id="injectNm" style="text-align:left;"></td>
	  </tr>
	  <tr>
	    <td class="title">처치 및 수술료</td>
	    <td class="content money getMoney" id="operAmt"></td>
	    <td class="title">수술명</td>
	    <td class="content" id="operNm" style="text-align:left;"></td>
	  </tr>
	  <tr>
	    <td class="title">입원료</td>
	    <td class="content money getMoney">${vo1.entAmt}</td>
	    <td class="content"></td>
	    <td class="content"></td>
	  </tr>
	  <tr>
	    <td class="title" rowspan="3">입원상세</td>
	    <td class="title">입원일</td>
	    <td class="title" colspan="2">퇴원일</td>
	    <td class="title">일일 침상비</td>
	  </tr>
	  <tr>
	    <td class="content">${vo1.entDt}</td>
	    <td class="content" colspan="2">${vo1.levDt}</td>
	    <td class="content money">${vo1.entOnedayAmt}</td>
	  </tr>
	  <tr>
	    <td class="title">식대</td>
	    <td class="content money">${vo1.dietAmt}</td>
	    <td class="title">식단명</td>
	    <td class="content" style="text-align:left;">${vo1.dietNm}</td>
	  </tr>
	  <tr>
	    <td colspan="5" class="title">금액산정 내용</td>
	  </tr>
	  <tr>
	    <td rowspan="2" class="title">진료비</td>
	    <td class="title">납부금액</td>
	    <td class="title">잔여 금액</td>
	    <td colspan="2" class="title">진료비 총액</td>
	  </tr>
	  <tr>
	    <td class="content money" id="minusAmt"></td>
	    <td class="content money getMoney" id="nRcvAmt">${vo1.nRcvAmt}</td>
	    <td colspan="2" class="content money" id="rcvAmt">${vo1.rcvAmt}</td>
	  </tr>
	</tbody>
	</table>
</div>

<div style="width:100%; height:80px; padding-top:18px;">
	<div style="height:100%; width: 20%; float:right;">
		<button type="button" id="directInsert" class="btn btn-secondary">직접입력</button>
		<button type="button" id="RCV" class="btn btn-success">수납</button>
	</div>

	<input type="text" id="moneyAmt" readonly style="float:right; margin-right:20px; text-align:right; padding-right:3%;" placeholder="0"/>
	<button type="button" id="imgDown" class="btn btn-info" style=" margin-left:1%;">다운로드</button>
</div>

<script>
	
function iamport(){
		var pntNm = $("#rpntNm").text();
		var money = $("#moneyAmt").val();
		var disNm = $("#disNm").text();
		var treatCd = "${param.treatCd}";
		
		console.log(pntNm);
		console.log(money);
		var data = {"nRcvAmt":money, "treatCd":treatCd};
		
		var IMP = window.IMP;	
		IMP.init('imp72264124');
	IMP.request_pay({
	    pg : 'inicis',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : disNm, //결제창에서 보여질 이름
	    amount : money, //실제 결제되는 가격
	    buyer_name : pntNm,
	}, function(rsp) {
	    if (rsp.success) {
			$.ajax({
				url : '/receive/minusRCV',
				method : 'get',
				data : data,
				success : function(res){
					if(res > 0){
						swal({
							title: '',
							text: '결제 완료',
							icon: 'success',
							buttons: {
								confirm: {
									text: '확인',
									value: true,
									className: 'btn btn-success'
								}
							}
						}).then(() => {
							location.reload();
						});
					}
				}
			})
			
	    } else {
			// 실패
			swal("", "결제 실패!!", "warning");
	    }
	});
	}
	
	
	nRcvAmt = "${vo1.nRcvAmt}"; 
	rcvAmt = "${vo1.rcvAmt}";
	minusAmt = rcvAmt.replace(",", "") - nRcvAmt.replace(",", "")
	$("#minusAmt").html(minusAmt); 

	$("#directInsert").on("click", function(){
		$("#moneyAmt").attr("readonly", false);
	})
	
	$("#RCV").on("click", function(){
		var writeMon = $("#moneyAmt").val();
		var nAmt = parseInt(nRcvAmt.replace(",", ""));
		if(parseInt(writeMon) > nAmt){
			console.log(writeMon);
			console.log(nRcvAmt.replace(",", ""));
			swal("", "수납금액이 미수납금액보다 클 수 없습니다.", "warning");
			return false;
		}
		iamport();
	})

	$(".getMoney").on("click", function(){
		var getM = $(this).text();
		getM = getM.replace(",", "");
		
		var getW = $("#moneyAmt").val();
		getW = getW.replace(",", "");
		
		if(getW == ''){
			getW = 0;
		}
		
		
		console.log(getM)
		console.log(getW)
		$("#moneyAmt").val(parseInt(getM) + parseInt(getW));
		
	})
	
	var treatCd = "${vo1.treatCd}";
	data = {"treatCd":treatCd};
	
	$.ajax({
		url : '/receive/getDigRCV',
		method : 'POST',
		data : data,
		beforeSend: function (jqXHR, settings) {
			var token = '${_csrf.token}'
			var header = '${_csrf.headerName}'
			jqXHR.setRequestHeader(header, token);
		},
		success : function(res){
			if(res.length >= 1){
				$("#disCd").append(res[0].disCd);
				$("#disNm").append(res[0].disNm);
				
				if(res.length > 1){
					$("#disCd").append("<span class='gun'>..및 " + res.length + "건</span>");
					$("#disNm").append("<span class='gun'>..및 " + res.length + "건</span>");
				}
				
				var p = "";
				var p2 = "";
 				$.each(res, function(i, v){
 					p += "<p>"+ (i + 1) + ". " + v.disCd + "</p>";
 					p2 += "<p>"+ (i + 1) + ". " + v.disNm + "</p>";
				})
				tippy("#disCd", {
					content : p
					,allowHTML : true
					,offset : [0, -20]
				})
				tippy("#disNm", {
					content : p2
					,allowHTML : true
					,offset : [0, -20]
				})
			}
		}
	})
	// 투약
	$.ajax({
		url : '/receive/getInjectRCV',
		method : 'POST',
		data : data,
		beforeSend: function (jqXHR, settings) {
			var token = '${_csrf.token}'
			var header = '${_csrf.headerName}'
			jqXHR.setRequestHeader(header, token);
		},
		success : function(res){
			if(res.length > 0){
				$("#injectAmt").append(res[0].injAmt);
				$("#injectNm").append(res[0].drugNm);
				
				if(res.length > 1){
					var sum = 0;
					for(var i = 0; i < res.length; i++){
						sum += parseInt(res[i].injAmt.replace(",", ""));
					}
					$("#injectAmt").html(comma(sum));
					$("#injectNm").append("<span class='gun'>..및 " + res.length + "건</span>");
				}
				
				var p = "";
				$.each(res, function(i, v){
					p += "<p>"+ (i + 1) + ". " + v.drugNm + " : " + v.injAmt +"원</p>";
				})
				tippy("#injectNm", {
					content : p
					,allowHTML : true
					,offset : [0, -20]
				})
			}
		}
	})
	// 수술
	$.ajax({
		url : '/receive/getOperRCV',
		method : 'POST',
		data : data,
		beforeSend: function (jqXHR, settings) {
			var token = '${_csrf.token}'
			var header = '${_csrf.headerName}'
			jqXHR.setRequestHeader(header, token);
		},
		success : function(res){
			if(res.length >= 1){
				console.log("sdfsd");

				
				
				$("#operAmt").append(res[0].opcAmt);
				$("#operNm").append(res[0].opcNm);
				
				if(res.length > 1){
					var sum = 0;
					for(var i = 0; i < res.length; i++){
						sum += parseInt(res[i].opcAmt.replace(",", ""));
					}
					
					$("#operAmt").html(comma(sum));
					$("#operNm").append("<span class='gun'>..및 " + res.length + "건</span>");
				}
				var p = "";
				$.each(res, function(i, v){
					p += "<p>"+ (i + 1) + ". " + v.opcNm + " : " + v.opcAmt +"원</p>"
				})
				tippy("#operNm", {
					content : p
					,allowHTML : true
					,offset : [0, -20]
				})
			}
		}
	})
	
	// 검사
	$.ajax({
		url : '/receive/getInspecRCV',
		method : 'POST',
		data : data,
		beforeSend: function (jqXHR, settings) {
			var token = '${_csrf.token}'
			var header = '${_csrf.headerName}'
			jqXHR.setRequestHeader(header, token);
		},
		success : function(res){
			console.log(res);
			if(res.length >= 1){
				
				$("#inspecAmt").append(res[0].sgAmt);
				$("#inspecNm").append(res[0].sgNm);
				
				if(res.length > 1){
					var sum = 0;
					for(var i = 0; i < res.length; i++){
						sum += parseInt(res[i].sgAmt.replace(",", ""));
					}
					$("#inspecAmt").html(comma(sum));
					$("#inspecNm").append("<span class='gun'>..및 " + res.length + "건</span>");
				}
				var p = "";
				$.each(res, function(i, v){
					p += "<p>"+ (i + 1) + ". " + v.sgNm + " : " + v.sgAmt +"원</p>";
				})
				tippy("#inspecNm", {
					content : p
					,allowHTML : true
					,offset : [0, -20]
				})
			}
		}
	})
	
	$("#imgDown").on("click", function(){
		var pntNm = $("#rpntNm").text();
		
		savePDF(pntNm);
	})
	
	
  function savePDF(nm){
	
    //저장 영역 div id
    html2canvas($('#chart')[0] ,{	
      //logging : true,		// 디버그 목적 로그
      //proxy: "html2canvasproxy.php",
      allowTaint : true,	// cross-origin allow 
      useCORS: true,		// CORS 사용한 서버로부터 이미지 로드할 것인지 여부
      scale : 2			// 기본 96dpi에서 해상도를 두 배로 증가
      
    }).then(function(canvas) {	
      // 캔버스를 이미지로 변환
      var imgData = canvas.toDataURL('image/png');

      var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
      var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
      var imgHeight = canvas.height * imgWidth / canvas.width;
      var heightLeft = imgHeight;
      var margin = 10; // 출력 페이지 여백설정
      var doc = new jsPDF('p', 'mm');
      var position = 0;

      // 첫 페이지 출력
      doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
      heightLeft -= pageHeight;

      // 한 페이지 이상일 경우 루프 돌면서 출력
      while (heightLeft >= 20) {			// 35
      position = heightLeft - imgHeight;
      position = position - 20 ;		// -25

      doc.addPage();
      doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
      heightLeft -= pageHeight;
      }

      // 파일 저장
      doc.save(nm + '환자 수납내역.pdf');
    });
  }

</script>

