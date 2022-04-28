<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/js/html2canvas.min.js"></script>
<script type="text/javascript" src="/resources/js/html2pdf.bundle.min.js"></script>
<style>
.recordText{
	width : 100%;
	border : 0px;
}
.table-cell {
	border: 1px solid black;
}

td {
	border-right: 1px solid #dee2e6 !important;
	text-align: center;
}
</style>
</head>
<body>
	<%-- 	<p>"${recordPntList.toString()}"</p> --%>
	<div class="main_content_iner ">
		<div class="container-fluid p-0">
			<div class="row justify-content-center">
				<div class="col-md-3">
					<form id="RecordList" action="/operation/RecordPntList" method="post">
						<sec:csrfInput />
						<div class="email-sidebar">
							<h2>미완료</h2>
							<ul class="text-left">
								<c:forEach var="operationVO" items="${recordPntList}">
									<c:if test="${operationVO.operRecYn eq 0}">
										<li><a onclick="fn_loadRecord('${operationVO.pntCd}','${operationVO.operCd}')"><i class="ti-user"></i><span>${operationVO.pntNm}</span></a> <input type="hidden" value="${operationVO.operCd }"></li>
									</c:if>
								</c:forEach>
							</ul>
							<h2>완료</h2>
							<ul class="text-left">
								<c:forEach var="operationVO" items="${recordPntList }">
									<c:if test="${operationVO.operRecYn eq 1}">
										<li><a id="pntNmTag" onclick="fn_completeLoadRecord('${operationVO.pntCd}','${operationVO.operCd}','${operationVO.pntNm}')"><i class="ti-user"></i><span id="pntNmSpan">${operationVO.pntNm}</span> </a> <input type="hidden" value="${operationVO.operCd }"></li>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</form>
				</div>
				<div class="col-md-9 IncompletePnt" id="IncompletePnt" >
					<div class="white_box QA_section mb_30" >
						<div class="white_box_tittle list_header">
							<h2>수술 기록지</h2>
						</div>
						<div class="white_box mb_30"  style="position: relative;">
							<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">
								<table class="table lms_table_active dataTable no-footer dtr-inline collapsed" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info" style="width: 764px;">

									<tbody>
										<tr role="row" class="odd">
											<td width="16.667%" colspan="10" style="background-color: #EFF1F7">진료과</td>
											<td width="16.667%" colspan="10"><input type="text" class="recordText" id="secNm"value=""></td>
											<td width="16.667%" colspan="10" style="background-color: #EFF1F7">등록번호</td>
											<td width="16.667%" colspan="10"><input type="text" class="recordText" id="operCd"value=""></td>
											<td width="16.667%" colspan="10" style="background-color: #EFF1F7">의사</td>
											<td width="16.667%" colspan="10"><input type="text" class="recordText" id="empNm"value=""></td>
<!-- 											<td style="display: none;"><a href="#" class="status_btn">Active</a></td> -->
										</tr>
										<tr role="row" class="even">
											<td width="16.667%" colspan="10" style="background-color: #EFF1F7">성명</td>
											<td width="16.667%" colspan="10"><input type="text" class="recordText" id="pntNm"value=""></td>
											<td width="16.667%" colspan="10" style="background-color: #EFF1F7">나이</td>
											<td width="16.667%" colspan="10"><input type="text" class="recordText" id="pntAge"value=""></td>
											<td width="16.667%" colspan="10" style="background-color: #EFF1F7">성별</td>
											<td width="16.667%" colspan="10"><input type="text" class="recordText" id="pntSex"value=""></td>
										</tr>
										<tr role="row" class="even">
											<td width="16.667%" colspan="10" style="background-color: #EFF1F7">병실</td>
											<td width="16.667%" colspan="10"><input type="text" class="recordText" id="opRoomNo"value=""></td>
											<td width="16.667%" colspan="10" style="background-color: #EFF1F7">수술일자</td>
											<td width="16.667%" colspan="10"><input type="text" class="recordText" id="operYmd"value=""></td>
											<td width="16.667%" colspan="10" style="background-color: #EFF1F7">보호자</td>
											<td width="16.667%" colspan="10"><input type="text" class="recordText" id="prtcrNm"value=""></td>
										</tr>
										<tr role="row" class="odd">
											<td colspan="8" style="background-color: #EFF1F7">병명</td>
											<td colspan="52"><input type="text" class="recordText" id="disNm"value=""></td>
										</tr>
										
										<tr role="row" class="even">
											<td colspan="8" style="background-color: #EFF1F7">수술코드</td>
											<td colspan="40" style="background-color: #EFF1F7">수술명</td>
											<td colspan="6" style="background-color: #EFF1F7">주수술</td>
											<td colspan="6" style="background-color: #EFF1F7">부수술</td>
										</tr>
										<tr role="row" class="even opcTable">
											<td colspan="8" class="opcCd"><input type="text" class="recordText" id="opcCd"value=""></td>
											<td colspan="40" class="opcNm"><input type="text" class="recordText" id="opcNm"value=""></td>
											<td colspan="6" class="mainOpc"><input type="checkbox" name="mainOpc"class="recordText" id="opcNo"></td>
											<td colspan="6" class="subOpc"><input type="checkbox" name="subOpc"class="recordText" id="opcNo"></td>
										</tr>
										<tr role="row" class="even opcTable">
											<td colspan="8"><input type="text" class="recordText" id="opcCd"value=""></td>
											<td colspan="40"><input type="text" class="recordText" id="opcNm"value=""></td>
											<td colspan="6"><input type="checkbox" name="mainOpc"class="recordText" id="opcNo"></td>
											<td colspan="6"><input type="checkbox" name="subOpc"class="recordText" id="opcNo"></td>
										</tr>
										<tr role="row" class="even opcTable">
											<td colspan="8"><input type="text" class="recordText" id="opcCd"value=""></td>
											<td colspan="40"><input type="text" class="recordText" id="opcNm"value=""></td>
											<td colspan="6"><input type="checkbox" name="mainOpc"class="recordText" id="opcNo"></td>
											<td colspan="6"><input type="checkbox" name="subOpc"class="recordText" id="opcNo"></td>
										</tr>
										<tr role="row" class="even opcTable">
											<td colspan="8"><input type="text" class="recordText" id="opcCd"value=""></td>
											<td colspan="40"><input type="text" class="recordText" id="opcNm"value=""></td>
											<td colspan="6"><input type="checkbox" name="mainOpc"class="recordText" id="opcNo"></td>
											<td colspan="6"><input type="checkbox" name="subOpc"class="recordText" id="opcNo"></td>
										</tr>
										<tr role="row" class="even opcTable">
											<td colspan="8"><input type="text" class="recordText" id="opcCd"value=""></td>
											<td colspan="40"><input type="text" class="recordText" id="opcNm"value=""></td>
											<td colspan="6"><input type="checkbox" name="mainOpc"class="recordText" id="opcNo"></td>
											<td colspan="6"><input type="checkbox" name="subOpc"class="recordText" id="opcNo"></td>
										</tr>
										<tr role="row" class="odd">
											<td colspan="30" style="background-color: #EFF1F7">재료처치</td>
											<td colspan="30" style="background-color: #EFF1F7">마취료</td>
										</tr>
										<tr role="row" class="even">
											<td colspan="24" style="background-color: #EFF1F7">재료</td>
											<td colspan="6" style="background-color: #EFF1F7">수량</td>
											<td colspan="8" style="background-color: #EFF1F7">마취시간</td>
											<td colspan="22"><input type="text" class="recordText" id="anesthesiaTime"value=""></td>
										</tr>
										<tr role="row" class="odd opcMat Anesthesia">
											<td colspan="24"><input type="text" class="recordText materials" id="materials"value=""></td>
											<td colspan="6"><input type="text" class="recordText quantity" id="quantity"value=""></td>
											<td colspan="8" rowspan="4" style="background-color: #EFF1F7">마취방법</td>
											<td colspan="22" style="text-align:left"><input type="checkbox" name="Anesthesis"> Anesthesis</td>
										</tr>
										<tr role="row" class="even opcMat Anesthesia">
											<td colspan="24"><input type="text" class="recordText materials" id="materials"value=""></td>
											<td colspan="6"><input type="text" class="recordText quantity" id="quantity"value=""></td>
											<td colspan="22" style="text-align:left"><input type="checkbox" name="SpinalAnesthesis"> Spinal Anesthesis</td>
										</tr>
										<tr role="row" class="even opcMat Anesthesia">
											<td colspan="24"><input type="text" class="recordText materials" id="materials"value=""></td>
											<td colspan="6"><input type="text" class="recordText quantity" id="quantity"value=""></td>
											<td colspan="22" style="text-align:left"><input type="checkbox"name="EpiduralAnesthesis"> Epidural Anesthesis</td>
										</tr>
										<tr role="row" class="even opcMat Anesthesia">
											<td colspan="24"><input type="text" class="recordText materials" id="materials"value=""></td>
											<td colspan="6"><input type="text" class="recordText quantity" id="quantity"value=""></td>
											<td colspan="22" style="text-align:left"><input type="checkbox"name="BPB"> BPB</td>
										</tr>
										<tr role="row" class="odd opcMat Anesthesia">
											<td colspan="24"><input type="text" class="recordText materials" id="materials"value=""></td>
											<td colspan="6"><input type="text" class="recordText quantity" id="quantity"value=""></td>
											<td colspan="8" rowspan="2" style="background-color: #EFF1F7">전신마취제</td>
											<td colspan="22" style="text-align:left"><input type="checkbox"name="Ethran"> Ethran</td>
										</tr>
										<tr role="row" class="even opcMat Anesthesia">
											<td colspan="24"><input type="text" class="recordText materials" id="materials"value=""></td>
											<td colspan="6"><input type="text" class="recordText quantity" id="quantity"value=""></td>
											<td colspan="22" style="text-align:left"><input type="checkbox"name="Forane"> Forane</td>
										</tr>
										<tr role="row" class="odd opcMat">
											<td colspan="24"><input type="text" class="recordText materials" id="materials"value=""></td>
											<td colspan="6"><input type="text" class="recordText quantity" id="quantity"value=""></td>
											<td colspan="8" rowspan="3" style="background-color: #EFF1F7">마취재료</td>
											<td colspan="22" rowspan="3"><textarea id="anesthesiaMaterials"cols ="50"rows="7"></textarea></td>
										</tr>
										<tr role="row" class="odd opcMat">
											<td colspan="24"><input type="text" class="recordText materials" id="materials"value=""></td>
											<td colspan="6"><input type="text" class="recordText quantity" id="quantity"value=""></td>
										</tr>
										<tr role="row" class="odd opcMat">
											<td colspan="24"><input type="text" class="recordText materials" id="materials"value=""></td>
											<td colspan="6"><input type="text" class="recordText quantity" id="quantity"value=""></td>
										</tr>
										<tr role="row" class="odd opcMat">
											<td colspan="24"><input type="text" class="recordText materials" id="materials"value=""></td>
											<td colspan="6"><input type="text" class="recordText quantity" id="quantity"value=""></td>
											<td colspan="8" rowspan="3" style="background-color: #EFF1F7">주사처방</td>
											<td colspan="22" rowspan="3"><textarea id="injectionPrescription" cols ="50"rows="7"></textarea></td>
										</tr>
										<tr role="row" class="odd opcMat">
											<td colspan="24"><input type="text" class="recordText materials" id="materials"value=""></td>
											<td colspan="6"><input type="text" class="recordText quantity" id="quantity"value=""></td>
										</tr>
										<tr role="row" class="odd opcMat">
											<td colspan="24"><input type="text" class="recordText materials" id="materials"value=""></td>
											<td colspan="6"><input type="text" class="recordText quantity" id="quantity"value=""></td>
										</tr>
									</tbody>
								</table>
							</div>
							<button type="button" id="recordSubmitBtn" class="btn btn-outline-primary" value="" style="float:right">작성</button>
						</div>
					</div>
				</div>
				<div class = "completePnt" style="display : none" id="completePnt">
					<div>
					
					</div>
					
						<button type="button" id="opendocxbtn" class="btn btn-outline-primary" value="" onclick="fn_openDocx()"style="float:right">문서열기</button>
					
				</div>
			</div>
		</div>
	</div>
	<div class="footer_part">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="footer_iner text-center">
						<p>
							2020 © Influence - Designed by <a href="#"> <i class="ti-heart"></i>
							</a><a href="#"> Dashboard</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
var openParam = {};
function fn_loadRecord(pntCd, operCd){
	$(".recordText").val('');
// 	alert(pntCd);
// 	alert(operCd);
	console.log("${loginUser.empCd}")
	var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
	var csrfHeader = $("meta[name=_csrf_header]").attr("content");
	var csrfToken = $("meta[name=_csrf]").attr("content");
    var data = {};
    var empCd = "${loginUser.empCd}"
    data['pntCd'] = pntCd;
    data['operCd'] = operCd;
    data['empCd'] =empCd;
    data[csrfParameter]=csrfToken;
    console.log("data>>>",data)
    var loadRecord = "";
	$.ajax({
		type : 'post',
		url : '/operation/loadRecord',
		dataType : 'json',
		async : false,
		data : data,
		success : function(data){
			console.log("success데이터>>>>>>>>",data)
			console.log(data[0].secNm)
			$("#secNm").val(data[0].secNm);
			$("#operCd").val(data[0].operCd);
			$("#empNm").val(data[0].empNm);
			$("#pntNm").val(data[0].pntNm);
			$("#pntAge").val("만 "+data[0].pntAge+"세");
			$("#pntSex").val(data[0].pntSex);
			$("#opRoomNo").val(data[0].opRoomNo);
			$("#operYmd").val(data[0].operYmd);
			$("#prtcrNm").val(data[0].prtcrNm);
			$("#disNm").val(data[0].disNm);
		}
	})
	/*
	<tr role="row" class="even opcTable">
		<td colspan="8" class="opcCd"><input type="text" class="recordText" id="opcCd"value=""></td>
		<td colspan="40" class="opcNm"><input type="text" class="recordText" id="opcNm"value=""></td>
		<td colspan="6" class="mainOpc"><input type="checkbox" class="recordText" id="opcNo"></td>
		<td colspan="6" class="subOpc"><input type="checkbox" class="recordText" id="opcNo"></td>
	</tr>
	*/
	$.ajax({
		type : 'post',
		url : '/operation/loadRecordProc',
		dataType : 'json',
		async : false,
		data : data,
		success : function(data){
			console.log("PROCdata>>>>>>>",data);
			$.each(data,function(i,v){
				$($(".opcTable")[i]).children('td:eq(0)').children($("#opcCd")).val(data[i].opcCd);
				$($(".opcTable")[i]).children('td:eq(1)').children($("#opcNm")).val(data[i].opcNm);
				if(data[i].opcNo == 1){
					$($(".opcTable")[i]).children('td:eq(2)').children($('input[name="mainOpc"]')).prop("checked",true);
				}
				else if(data[i].opcNo != 1){
					$($(".opcTable")[i]).children('td:eq(3)').children($('input[name="subOpc"]')).prop("checked",true);
				}
			})
		}
	})
}

$("#recordSubmitBtn").on("click",function(){
	var array = [];
	var arr = {};
	var array2 = [];
	var arr2 = {};
	var array3 = [];
	var arr3 = {};
// 	var map = {}
	var data = {};
	var empCd = "${loginUser.empCd}"
	var secNm = $("#secNm").val();
	var operCd = $("#operCd").val();
	var empNm = $("#empNm").val();
	var pntNm = $("#pntNm").val();
	var pntAge = $("#pntAge").val();
	var pntSex = $("#pntSex").val();
	var opRoomNo = $("#opRoomNo").val();
	var operYmd = $("#operYmd").val();
	var prtcrNm = $("#prtcrNm").val();
	var disNm = $("#disNm").val();
	var anesthesiaTime = $("#anesthesiaTime").val();
	var injectionPrescription = $("#injectionPrescription").val();
	var anesthesiaMaterials = $("#anesthesiaMaterials").val();
	data['empCd'] = empCd;
	data['secNm'] = secNm;
	data['operCd'] = operCd;
	data['empNm'] = empNm;
	data['pntNm'] = pntNm;
	data['pntAge'] = pntAge;
	data['pntSex'] = pntSex;
	data['opRoomNo'] = opRoomNo;
	data['operYmd'] = operYmd;
	data['prtcrNm'] = prtcrNm;
	data['anesthesiaTime'] = anesthesiaTime;
	data['injectionPrescription'] = injectionPrescription;
	data['anesthesiaMaterials'] = anesthesiaMaterials;
	for(var i=0; i<$(".opcTable").length; i++){
		var opcTable = $(".opcTable")[i]
		
		var opcCd = $(opcTable).children('td:eq(0)').children().val();
		var opcNm = $(opcTable).children('td:eq(1)').children().val();
		var mainOpc_Check = $(opcTable).children('td:eq(2)').children().is(':checked');
		var subOpc_Check = $(opcTable).children('td:eq(3)').children().is(':checked');
		var mainOpc="";
		var subOpc="";
		if(mainOpc_Check == true){
			mainOpc = "O";
		}
		if(subOpc_Check == true){
			subOpc="O";
		}
// 		if(opcCd!=''){
			console.log("opcCd : " + opcCd);
			console.log("opcNm : " + opcNm);
// 			console.log("mainOpc : " + mainOpc);
// 			console.log("subOpc : " + subOpc);
// 			console.log(mainOpc.is(':checked'));
// 			console.log(subOpc.is(':checked'));
			arr = {};
			arr['opcCd'] = opcCd;
			arr['opcNm'] = opcNm;
			arr['mainOpc'] = mainOpc;
			arr['subOpc'] = subOpc;
	// 		console.log($($(".opcTable")[i]).children('td:eq(1)').children().val());
	// 		arr['opcCd'] = $("#opcCd").val();
	// 		arr['opcNm'] = $("#opcNm").val();
			console.log("arr>>>>",arr);
			array.push(arr);
// 		}
	}
	for(var j=0; j<$(".opcMat").length; j++){
		var opcMatTable = $(".opcMat")[j]
		console.log("opcMatTable>>>",opcMatTable)
		var opcMat = $(opcMatTable).children('td:eq(0)').children().val();
		var opcMatCnt = $(opcMatTable).children('td:eq(1)').children().val();
		console.log("opcMat>>>>>",opcMat);
		arr2 = {};
		arr2['opcMat'] = opcMat;
		arr2['opcMatCnt'] = opcMatCnt;
		array2.push(arr2);
	}
	var AnesthesiaItems = ["Anesthesis","Spinal Anesthesis","Epidural Anesthesis","BPB","Ethran","Forane"];
	for(var k=0; k<$(".Anesthesia").length; k++){
		var AnesthesiaTable = $(".Anesthesia")[k]
		var Anesthesia_Check = $(AnesthesiaTable).children().last().children().is(':checked');
		var Anesthesia ="";
		if(Anesthesia_Check == true){
			Anesthesia = AnesthesiaItems[k]+" (O)";
		}
		else if(Anesthesia_Check == false){
			Anesthesia = AnesthesiaItems[k]+" ( )"
		}
		arr3 ={};
		arr3['Anesthesia'] = Anesthesia;
		array3.push(arr3);
	}
	console.log("array>>>>>>>",array2)
	data['array'] = array
	data['array2'] = array2
	data['array3'] = array3
	
// 	array.push(data)
// 	array.push(arr)
	console.log("SubmitBtndata>>>>>>>>>>>>>>>>>>>>>",data)
// 	console.log("submitArray>>>>>>>>>>>>>>>>>>>>>>>>>",array)
	$.ajax({
		beforeSend : function(xhr){
			xhr.setRequestHeader(csrfHeader,csrfToken)
		},
		url : '/operation/submitRecord',
		type : 'post',
		accept: "application/json",
    	contentType: "application/json; charset=utf-8",	
		async : false,
		data : JSON.stringify({"recordParam":data}),
		success : function(data){
			console.log("성공했나?",data);
			
		}
	
	})
	data = {};
	data['operCd'] = operCd
	$.ajax({
		beforeSend : function(xhr){
			xhr.setRequestHeader(csrfHeader,csrfToken)
		},
		url : '/operation/updateRecordYN',
		type : 'post',
// 		accept: "application/json",
//     	contentType: "application/json; charset=utf-8",	
		async : false,
		data : data,
		success : function(data){
			console.log("업데이트 성공했나?",data);
		}
		
	})

	window.scroll(0,0); //스크롤의 위치에따라 canvas에 찍는 지점이 달라지므로 버튼을 누를시 스크롤을 상단으로 고정시킨다.
		html2canvas(document.getElementById("IncompletePnt"),{
			allowTaint : true,	//교차 출처 이미지가 캔버스를 오염시키는 것을 허용할지 여부
			useCORS : true,
			logging : false,

		}).then(function(canvas){
			data = {}
			
			var operRecImg = canvas.toDataURL('image/png');	//캔버스를 이미지로 변환
			console.log(operRecImg);
			data['operCd'] = operCd;
			data['empCd'] = empCd;
			data['operRecImg'] = operRecImg;
			console.log("캔버스할 때 data>>>",data)
			$.ajax({
				beforeSend : function(xhr){
					xhr.setRequestHeader(csrfHeader,csrfToken)
				},
				url : '/operation/insertOperRec',
				type : 'post',
				async : false,
				data : data,
				success : function(data){
					console.log("업데이트 성공했나?",data);
					swal("성공","기록지 작성 완료","success");
				}
			})
	})
// 	location.href= "/operation/operationRecord"
})
function fn_completeLoadRecord(pntCd, operCd, pntNm){
	console.log($(this))
	openParam = {};
	openParam['pntCd'] = pntCd;
	openParam['operCd'] = operCd;
	openParam['pntNm'] = pntNm;
	data = {};
	data['operCd'] = operCd;
	console.log("openParam",openParam);
	console.log(data);
	$.ajax({
		beforeSend : function(xhr){
			xhr.setRequestHeader(csrfHeader,csrfToken)
		},
		url : '/operation/completeLoadRecord',
		type : 'post',
		async : false,
		data : data,
		success : function(data){
			console.log("업데이트 성공했나?",data.operRecImg);
			var img = '<img src='+data.operRecImg+'>';
			$("#completePnt").children().first().html(img);
			$("#completePnt").css("display","inline-block");
			$("#IncompletePnt").css("display","none");
		}
		
	})
	
}
function fn_openDocx(){
	var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
	var csrfHeader = $("meta[name=_csrf_header]").attr("content");
	var csrfToken = $("meta[name=_csrf]").attr("content");
	var data = {};
	var empCd = "${loginUser.empCd}"
	    console.log(openParam)
	    
	    $.ajax({
	    	beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeader,csrfToken)
			},
			type : 'post',
			url : "/operation/openDocx",
			async : false,
			data : openParam,
			success : function(data){
				console.log("파일 열리나???",data)
			}
			
	    })    

}
</script>
</html>