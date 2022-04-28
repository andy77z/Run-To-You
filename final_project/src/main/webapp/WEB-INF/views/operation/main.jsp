<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link href='/resources/css/main.css' rel='stylesheet' />
<link rel="stylesheet" href="/resources/vendors/niceselect/css/nice-select.css">
<link rel="stylesheet" href="/resources/vendors/select2/css/select2.min.css">
<link rel="stylesheet" href="/resources/css/gantt.css" type="text/css"/>
<link rel="stylesheet" href="/resources/datatimepicker-master/jquery.datatimepicker.css"/>
<script src="/resources/js/gantt.js"></script>
<script src="/resources/datetimepicker-master/build/jquery.datetimepicker.full.min.js"></script>
<script src="/resources/js/initialize-gantt.js"></script>
<script>

</script>
<script src="/resources/js/main.js"></script>

<script src="/resources/vendors/niceselect/js/jquery.nice-select.min.js"></script>

<style>
/* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
  .fc-header-toolbar {
    padding-top: 1em;
    padding-left: 1em;
    padding-right: 1em;
  }
  .table-cell{
  	text-align : center;
  	font-size : 1.2em;
  }
  .table-cell2{
  	text-align : center;
  	font-size : 1.2em;
  }
  .opertable{
  	text-align : left;
  	font-size : 1.2em;
  }
  .color{
  	background-color: white;
  }
  .opRoomStyle{
  	display:inline-block;
  	width:210px;
  	height:220px;
  	border : 3px solid black;
  }
  
</style>
<script>
$(function(){
	$("#searchBtn1").on("click", function(){
		$("#myModal2").show();
	});
	$("#searchBtn2").on("click",function(){
		$("#myModal3").show();
	})
	$("#searchBtn5").on("click",function(){
		$("#myModal4").show();
		getOperRoom();
		getSgCode();
		getTreatCode();
		$('.reservation').children('div:eq(2)').attr("id","disDiv");
	})
	$("#searchBtn4").on("click",function(){
		$(".opttbl").empty();
// 		$("#operTeamList").children().remove();
	})
	$("#myModalClose").on("click",function(){
		$("#myModal2").hide();
	})
	$("#myModalClose2").on("click",function(){
		$("#myModal3").hide();
	})
	$("#myModalClose3").on("click",function(){
		$("#myModal4").hide();
		$("#selectRoomNo").get(0).selectedIndex = 0;
		$("#selectSgCode").get(0).selectedIndex = 0;
		$("#dateTimeStart").val("");
		$("#dateTimeEnd").val("");
		$(".restbl").remove();
	})
	$(".closebtn").on("click",function(){
		$("#myModal2").hide();
	})
	$(".closebtn2").on("click",function(){
		$("#myModal3").hide();
	})
	$("#modifyBtn").on("click",function(){
		$(".nice-select").prop("hidden",true);
		$("#modifyModal").show();
	})
	$("#modifyModalCloseBtn").on("click",function(){
		$(".nice-select").prop("hidden",true);
		$(".modihide").prop("hidden",true);
		$("#modifyModal").modal("hide");
		$("#modifyOperation_submit").attr("style","display:none")
		$("#modifyOperation").attr("style","display:inline-block")
	})
	$("#modifyOperation").on("click",function(){
		$(".nice-select").prop("hidden",false);
		$(".modihide").prop("hidden",false);
		$("#modifyOperation_submit").attr("style","display:inline-block")
		$("#modifyOperation").attr("style","display:none")
		$("#deleteOperation").attr("style","display:none")
// 		$("#modifyOperation").prop("hidden",true)
		getOperRoom2();
		getSgCode2();
	})
	$("#deleteOperation").on("click",function(){
// 		$(".nice-select").prop("hidden",false);
		$(".deletehide").prop("hidden",false);
		$("#modifyOperation").attr("style","display:none")
		$("#deleteOperation").attr("style","display:none")
		$("#deleteOperation_submit").attr("style","display:inline-block")
	})
	$(document).on("click","#RoomNoDiv2",function(){
		var roomNo = $("#RoomNoSpan2").text();
		if(roomNo != "수술방 검색"){
			
		}
	})
	$("#selectTreatCode").on("change",function(){
		var treatCd = this.value;
		getDis(treatCd);
	})
	

	var start;
	var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
	var csrfHeader = $("meta[name=_csrf_header]").attr("content");
	var csrfToken = $("meta[name=_csrf]").attr("content");
    var data = {};
    
    data[csrfParameter]=csrfToken;

	$.ajax({
		type: 'post',
		dataType : 'json',
		data: data,
		url: '/operation/chart',
// 		traditional: true,
		async:false,
		success: function(data){
			
			var chart="";
			var cnt= 0;
			var prevOpRoomNo = data[0].opRoomNo;
			console.log("prevOpRoomNo>>>>>>>>>>>>>>>>>>>>",prevOpRoomNo)
			var prevChartStart = 0;
			var prevBarWidth = 0;
			var pixel = 4.166666666666667;
			
			$.each(data,function(i,v){
				console.log(cnt);
				console.log("v.opRoomNo>>>>>>>>>>>>>",v.opRoomNo);
				console.log("prevOpRoomNo>>>>>>>>>>>>>>>>>>>>",prevOpRoomNo)
				console.log("v.pntNm>>>>>>>>>>>",v.pntNm)
				if(prevOpRoomNo == v.opRoomNo && cnt == 0){
					chart =
						  '<div class="gfb-gantt-row" style="grid-template-columns: 90px repeat(24, 1fr)">'
						+ '<div class="gfb-gantt-sidebar-header">'+v.opRoomNo+'</div>'
						+ '<div style="grid-column:2/26;grid-row:1;display:flex;align-items:center">'
						+ '<div class="gfb-gantt-sub-row-wrapper">'
						+ '<div style="width:' + (pixel*v.chartStart) + '%";></div>'
						+ '<a class="gfb-gantt-row-entry" id="gantt'+i+'" style="width:' + pixel*(v.chartEnd-v.chartStart) +'%;height: 20;margin-top: -3;text-align:center" href="/operation/detail?operCd='+v.operCd+'&pntCd='+v.pntCd+'" data-index="1-0"></a>'
					if(v.pntNm != null){
						$(".gfb-gantt-row-entry").text(v.pntNm);
					}
					prevChartStart = pixel*v.chartStart;
					prevBarWidth = pixel*(v.chartEnd-v.chartStart);
					console.log("prevChartStart>>>>>>>>>>>>>",prevChartStart);
					console.log("prevBarWidth>>>>>>>>>>>",prevBarWidth);
					cnt++;
				}else if(prevOpRoomNo == v.opRoomNo && (cnt > 0 && cnt < data.length -1)){
					console.log("prevChartStart1111>>>>>>>>>>>>>",prevChartStart);
					console.log("prevBarWidth11111>>>>>>>>>>>",prevBarWidth);
					chart +=
						  '<div style="width:' + ((pixel*v.chartStart) - (prevChartStart+prevBarWidth)) + '%";></div>'
						+ '<a class="gfb-gantt-row-entry" id="gantt'+i+'" style="width:' + pixel*(v.chartEnd-v.chartStart) +'%;height: 20;margin-top: -3;text-align:center" href="/operation/detail?operCd='+v.operCd+'&pntCd='+v.pntCd+'" data-index="1-0"></a>'
					prevChartStart += (pixel*v.chartStart) - (prevChartStart+prevBarWidth)
					prevBarWidth = pixel*(v.chartEnd-v.chartStart);
						console.log("pixel*v.chartStart>>>>>>>>>",(pixel*v.chartStart))
						console.log("prevChartStart2222>>>>>>>>>>>>>",prevChartStart);
						console.log("prevBarWidth2222>>>>>>>>>>>",prevBarWidth);	
					prevChartStart = pixel*v.chartStart;
					cnt++;
				}else if(prevOpRoomNo != v.opRoomNo){
					cnt = 0;
					prevOpRoomNo = v.opRoomNo;
					chart +=
						  '</div>'
						+ '</div>'
						+ '</div>'
						+ '<div class="gfb-gantt-row" style="grid-template-columns: 90px repeat(24, 1fr)">'
						+ '<div class="gfb-gantt-sidebar-header">'+v.opRoomNo+'</div>'
						+ '<div style="grid-column:2/26;grid-row:1;display:flex;align-items:center">'
						+ '<div class="gfb-gantt-sub-row-wrapper">'
						+ '<div style="width:' + (pixel*v.chartStart) + '%";></div>'
						+ '<a class="gfb-gantt-row-entry" id="gantt'+i+'" style="width:' + pixel*(v.chartEnd-v.chartStart) +'%;height: 20;margin-top: -3;text-align:center" href="/operation/detail?operCd='+v.operCd+'&pntCd='+v.pntCd+'" data-index="1-0"></a>'
					
					prevChartStart = pixel*v.chartStart;
					prevBarWidth = pixel*(v.chartEnd-v.chartStart);
				}
				if(v.pntNm != null){
					console.log(v.pntNm)
// 					$("#gantt"+i).val(v.pntNm);
				}
				if(i == data.length-1){
					console.log("마지막");
					chart +=
						  '</div>'
						+ '</div>'
						+ '</div>'
				}
			})
			$('#chart2').append(chart);
			chart = "";
		}
	})
});

function getDis(treatCd){
	$.ajax({
		type : 'post',
		url : '/operation/selectDis',
		async : false,
		data : {"treatCd":treatCd},
		 beforeSend: function (jqXHR, settings) {
				/* ajax 사용시 헤더에 스프링시큐리티 토큰 설정 */
				var token = '${_csrf.token}'
				var header = '${_csrf.headerName}'
				jqXHR.setRequestHeader(header, token);
			},
		success : function(data){
			var selectDis="";
			$.each(data,function(i,v){
				selectDis += '<option value="'+v.digCls+'">'+'['+v.disCd+'] '+v.disNm+'</option>';
			});
			$("#selectDis").append(selectDis);
			$("#selectDis").niceSelect('update');
			$(".nice-select").css("display","block");
			console.log($(".reservation").children("#selectDis"));
			$('.reservation').children('div:eq(2)').attr("id","disDiv");
			$("#disDiv").children('span').attr("id","disSpan");
// 			$("#treatCodeSpan").attr("onchange","change_treatCode()");
			console.log("span태그내용>>>>",$("#treatCodeSpan").text())
		}
	})
}

function fn_submit(k_index){
	
	document.forms[k_index].submit();
}
//===================================차트 생성 끝=====================================
</script>
<script defer="defer">
//===============================환자 검색 후 리스트 생성 =================================
$(function(){
	
	$("#searchBtn3").on("click",function(){
// 		$("#pntList").remove();
		$(".pnttbl").remove();
		var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
		var csrfHeader = $("meta[name=_csrf_header]").attr("content");
		var csrfToken = $("meta[name=_csrf]").attr("content");
	    var data = {};
	    
	    data[csrfParameter]=csrfToken;
	    data['pntNm']=$('#search').val();
		$.ajax({
			type : 'post',
			dataType : 'json',
			data: data,
			url: '/operation/search',
	// 		traditional: true,
			async:false,
			success: function(data){
				console.log(data)
				var pntList ="";
				$.each(data,function(i,v){
// 					if(v.opRoomNo)
					pntList +='<div class="table-row pnttbl" id="tbl_row'+i+'" style="display: table-row;" onclick="pntSubmit(\'' + v.pntCd + '\')">'
					pntList +='<div class="table-cell table-cell2" id="tbl_cell" style="display: table-cell; width: 10%;">'+ v.pntNm+'</div>';
 					pntList +='<div class="table-cell table-cell2" id="tbl_cell" style="display: table-cell; width: 20%;">'+v.pntPrno+'</div>';
 					pntList +='<div class="table-cell table-cell2" id="tbl_cell" style="display: table-cell; width: 10%;">'+v.pntSex+'</div>';
 					pntList +='<div class="table-cell table-cell2" id="tbl_cell" style="display: table-cell; width: 20%;">'+v.pntHp+'</div>';
 					pntList +='<div class="table-cell table-cell2" id="tbl_cell" style="display: table-cell; width: 40%;">'+v.pntAddr+'</div>';

					pntList +='</div>';
// 					else if()
						
				});
					
// 				$('.table-cell2').empty();
				$('#pntList').append(pntList);
			}
		})
	})
})
//===============================환자 검색 후 리스트 생성 =================================
</script>
<script>
//======================수술코드 불러오기===================================
$(function(){
	var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
	var csrfHeader = $("meta[name=_csrf_header]").attr("content");
	var csrfToken = $("meta[name=_csrf]").attr("content");
    var data = {};
    
    data[csrfParameter]=csrfToken;
	$.ajax({
		type : 'post',
		url : '/operation/operCd',
		datatype : 'json',
		data : data,
		async : false,
		success : function(data){
			
			$(".operCd").html(data.operCd)
		}
	})
})
//======================수술코드 불러오기===================================
</script>
<script>
//=====================환자 검색 후 모달에 불러오기 ==============================
function pntSubmit(t){
	$("input[name='pntCd']").attr("value",t);
	var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
	var csrfHeader = $("meta[name=_csrf_header]").attr("content");
	var csrfToken = $("meta[name=_csrf]").attr("content");
    var data = {};
    console.log("pntCd",t)
    data['pntCd']=t;
    console.log(data['pntCd'])
    data[csrfParameter]=csrfToken;
    var writePntInfo ="";
//     $("#table-cell3").remove();
    $.ajax({
    	type:'post',
    	url : '/operation/writeOperPnt',
    	dataType : 'json',
    	data : data,
    	async : false,
    	success : function(data){
    		console.log("data.index>>>",data);
    		writePntInfo += '<div class="table-row" id="infotbl_row" style="display: table-row;" onclick="closePntList()">'
    		writePntInfo +='<input type="hidden" id="operPntCd" name="operPntCd" value='+data.pntCd+'>'
    		writePntInfo +='<div class="table-cell table-cell3" id="tbl_cell" style="display: table-cell; width: 10%;">'+ data.pntNm+'</div>';
    		writePntInfo +='<div class="table-cell table-cell3" id="tbl_cell" style="display: table-cell; width: 20%;">'+data.pntPrno+'</div>';
    		writePntInfo +='<div class="table-cell table-cell3" id="tbl_cell" style="display: table-cell; width: 10%;">'+data.pntSex+'</div>';
    		writePntInfo +='<div class="table-cell table-cell3" id="tbl_cell" style="display: table-cell; width: 20%;">'+data.pntHp+'</div>';
    		writePntInfo +='<div class="table-cell table-cell3" id="tbl_cell" style="display: table-cell; width: 40%;">'+data.pntAddr+'</div>';
    		writePntInfo +='</div>';
//     		$('.table-cell3').empty();
    		$("#writePntInfo").html(writePntInfo);
    	}
    })
    		$("#myModal2").hide();
}
//=====================환자 검색 후 모달에 불러오기 ==============================
</script>
<script type="text/javascript">
function getOperRoom(){
	console.log("getOperRoom");
	var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
	var csrfHeader = $("meta[name=_csrf_header]").attr("content");
	var csrfToken = $("meta[name=_csrf]").attr("content");
    var data = {};
    var selectOperRoom="";
    let operatorModal = document.querySelector(".operator");
    data[csrfParameter]=csrfToken;
	$.ajax({
		type : 'post',
		url : '/operation/selectOperRoom',
		dataType : 'json',
		async : false,
		data : data,
		success : function(data){
			console.log(data)
			$.each(data,function(i,v){
				selectOperRoom += '<option value="'+i+'">'+v.opRoomNo+'</option>';
			});
			$("#selectRoomNo").empty();
			$("#selectRoomNo").append(selectOperRoom);
			$("#selectRoomNo").niceSelect('update');
			$(".nice-select").css("display","block");
			$('.reservation').children('div:eq(0)').attr("id","RoomNoDiv");
			$("#RoomNoDiv").children('span').attr("id","RoomNoSpan");
			console.log("RoomNoDiv",$("#RoomNoDiv").children('span').text())
		}
	})
}
</script>
<script type="text/javascript">
function getSgCode(){
	console.log("getSgCode");
	var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
	var csrfHeader = $("meta[name=_csrf_header]").attr("content");
	var csrfToken = $("meta[name=_csrf]").attr("content");
    var data = {};
    var selectSgCode="";
    
    let childFirst = document.querySelector(".reservation");
    data[csrfParameter]=csrfToken;
	$.ajax({
		type : 'post',
		url : '/operation/selectSgCode',
		dataType : 'json',
		async : false,
		data : data,
		success : function(data){
			console.log("수가코드 데이터 >>>>",data);
			
			$.each(data,function(i,v){
				selectSgCode += '<option value="'+v.sgCd+'">'+v.sgNm+'</option>';
			});
			$("#selectSgCode").append(selectSgCode);
			$("#selectSgCode").niceSelect('update');
			$(".nice-select").css("display","block");
			$('.reservation').children('div:eq(3)').attr("id","sgCodeDiv");
			$("#sgCodeDiv").children('span').attr("id","sgCodeSpan");
// 			$("#sgCodeSpan").attr("onchange","change_SgCode()");
			console.log("asdasd",$("#sgCodeSpan").text());
		}
	})
}
function getTreatCode(){
	console.log("getTreatCode");
	var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
	var csrfHeader = $("meta[name=_csrf_header]").attr("content");
	var csrfToken = $("meta[name=_csrf]").attr("content");
    var data = {};
    var selectTreatCode="";
    var pntNm = $("#infotbl_row").children('div:eq(1)').text();
    var pntCd = $("#operPntCd").val();
    data['pntNm'] = pntNm;
    data['pntCd'] = pntCd;
    console.log("ajax전",data)

    data[csrfParameter]=csrfToken;
	$.ajax({
		
		type : 'post',
		url : '/operation/selectTreatCode',
		dataType : 'json',
		async : false,
		data : data,
		success : function(data){
			console.log("진료코드 데이터 >>>>",data);
			$.each(data,function(i,v){
				console.log("v>>>>",v)
				selectTreatCode += '<option value="'+v.treatCd+'">'+'['+v.treatCd+'] '+v.treatOp+'</option>';
			});
			$("#selectTreatCode").append(selectTreatCode);
			$("#selectTreatCode").niceSelect('update');
			$(".nice-select").css("display","block");
			console.log($(".reservation").children("#selectTreatCode"));
			$('.reservation').children('div:eq(1)').attr("id","treatCodeDiv");
			$("#treatCodeDiv").children('span').attr("id","treatCodeSpan");
// 			$("#treatCodeSpan").attr("onchange","change_treatCode()");
			console.log("span태그내용>>>>",$("#treatCodeSpan").text())
		}
	})
}
</script>
<script>
$(function(){
	var operRegFlags = [false,false,false,false,false,false];
	
	var opRoomNo ="";
	var treatOp="";
	var sgName="";
	var startDate ="";
	var endDate ="";
	var startTime = "";
	var endTime="";
	var writeReservation ="";
	var treatOp ="";
	var disNm="";
	var writeReservation="";
	function fn_checkNWrite(){
		var submit_reserv="";
		var cnt = 0;
		for(var i = 0; i < operRegFlags.length; i++){
			var flag = operRegFlags[i];
			if(flag){
				cnt++
				console.log(cnt)
			}
		}
// 		if(cnt < 6){
// 			submit_reserv ="";
// 			$(".restbl").remove();
// 		}
		if(cnt == 6){
// 			$(".restbl").remove();
			submit_reserv ="";
			submit_reserv+='<div class="table-row restbl" style="display: table-row;">'
			submit_reserv+='<div class="table-cell" style="display: table-cell; width: 10%;">'+opRoomNo+'</div>'
			submit_reserv+='<div class="table-cell" style="display: table-cell; width: 10%;">'+treatOp+'</div>'
			submit_reserv+='<div class="table-cell" style="display: table-cell; width: 20%;">'+disNm+'</div>'
			submit_reserv+='<div class="table-cell" style="display: table-cell; width: 20%;">'+sgName+'</div>'
			
// 			if(startDate != endDate){
				submit_reserv+='<div class="table-cell" style="display: table-cell; width: 20%;">'+startDate+'</div>'
				submit_reserv+='<div class="table-cell" style="display: table-cell; width: 20%;">'+endDate+'</div>'
// 			}
// 			else{
// 				submit_reserv+='<div class="table-cell" style="display: table-cell; width: 10%;">'+startDate +'</div>'
// 				submit_reserv+='<div class="table-cell" style="display: table-cell; width: 10%;">'+startTimce +'~'+endTime+'</div>'
// 			}
			submit_reserv+='</div>'
			
		}
		
// 		$("#reserv").empty();
		$("#reserv").html(submit_reserv);
		console.log($("#reserv").html());
		writeReservation = $("#reserv").html();
		
	}
	$("#reservBtn").on("click",function(){
		console.log('writeReservation:  '+writeReservation);
		console.log('reserv:  '+$("#reserv").html());
		$("#writeReservation").append(writeReservation)
	})
	
	var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
	var csrfHeader = $("meta[name=_csrf_header]").attr("content");
	var csrfToken = $("meta[name=_csrf]").attr("content");
    var data = {};
    data[csrfParameter]=csrfToken;
	
    $(document).on("click","#sgCodeDiv",function(){
    	operRegFlags[0] = false;
		sgName = $("#sgCodeSpan").text();
		if(sgName != "수술법명 검색"){
			operRegFlags[0] = true;
			data['sgNm'] = sgName;
			fn_checkNWrite();
		}
	})
	$(document).on("click","#RoomNoDiv",function(){
		operRegFlags[1] = false;
		opRoomNo = $("#RoomNoSpan").text();
		if(opRoomNo != "수술방 검색"){
			operRegFlags[1] = true;
			data['opRoomNo']=opRoomNo;
			fn_checkNWrite();
		}
	})
	$(document).on("click","#treatCodeDiv",function(){
		operRegFlags[2] = false;
		treatOp = $("#treatCodeSpan").text();
		if(treatOp != '진료 목록'){
			operRegFlags[2] = true;
			data['treatOp']=treatOp;
			fn_checkNWrite();
		}
	})
	$(document).on("click","#disDiv",function(){
		operRegFlags[3] = false;
		disNm = $("#disSpan").text();
		var digcls = $("#selectDis").val();
		if(disNm != '병명'){
			operRegFlags[3] = true;
			data['disNm']=disNm;
			fn_checkNWrite();
		}
	})
	$(document).on("change","#dateTimeStart",function(){
		
		operRegFlags[4] = false;
		console.log("START",this.value);
		startDate = (this.value).substring(0,10) + "  " +(this.value).substring(11)
		console.log("startDate>>>>>",startDate)
// 		startTime = (this.value).substring(11)
// 		console.log("startTime>>>>>>>",startTime)
		fn_checkNWrite();
		operRegFlags[4] = true;
		data['startDate'] = startDate;
// 		data['startTime'] = startTime;
		fn_checkNWrite();
	})
	$(document).on("change","#dateTimeEnd",function(){
		operRegFlags[5] = false;
// 		console.log
		console.log("END",this.value);
		endDate = (this.value).substring(0,10) + "  " + (this.value).substring(11) 
		console.log("endDate>>>>>>>",endDate);
// 		endTime = (this.value).substring(11)
// 		console.log("endTime>>>>>>>>>>",endTime);
		fn_checkNWrite();
		operRegFlags[5] = true;
		data['endDate'] = endDate;
// 		data['endTime'] = endTime;
		fn_checkNWrite();
	})
})







</script>



<div class="main_content_iner">
	<div class="white_box QA_section mb_30" >
	<div class="container-fluid p-0">
		<div class="row justify-content-center">
			<div class="col-lg-12">
				<div class="single_element">
					<div class="quick_activity">
						<div class="row no-gutters">
							<div class="col-12">
								<div class="white_box calout" style="width : 66%;display:inline-block;">
									<div class="box_header border_bottom_1px  ">
										<div class="main-title">
											<h3 class="mb_15">수술방 리스트</h3>
										</div>
									</div>
									<div style="display:inline-block">

									 <c:forEach var="operationVO" items="${list}" varStatus="stat">
									<form id="detail${stat.index}" method="get" action="/operation/detail" style="width:210px; display:inline-block;margin:0px;padding:0">
<%-- 										<sec:csrfInput/> --%>
									 
									          <input type="hidden" name="operCd" value="${operationVO.operCd}" />
									          <input type="hidden" name="pntCd" value="${operationVO.pntCd}" />
									<div class="opRoomStyle" >
								        <c:if test="${operationVO.operIng eq 'Y' }">
								        <div class="card-body p-0 pb-3 text-center color " id="operDetail" onclick="document.getElementById('detail${stat.index}').submit()"style="cursor:pointer">
											<div class="table" style="display: table;" id="operList">
										        <div class="table-row opertable" style="display: table-row;">
								           			<div class="table-cell" style="display: table-cell; width: 25%;">${operationVO.opRoomNo }</div>
								           		</div>	
								           	    <div class="table-row opertable" style="display: table-row;">	
										   			<div class="table-cell" style="display: table-cell; width: 25%;">환자 명 : <span class ="pntNm">${operationVO.pntNm }</span></div>
										   		</div>	
										   		<div class="table-row opertable" style="display: table-row;">
										   			<div class="table-cell" style="display: table-cell; width: 25%;">수술 명 : <span class ="operNm">${operationVO.opcList[0].opcNm}</span></div>
										   		</div>
										   		<div class="table-row opertable" style="display: table-row;">	
										   			<div class="table-cell" style="display: table-cell; width: 25%;"><span class ="operStart">
										   				<fmt:parseDate var="dateString" value="${operationVO.operBgnTm }" pattern="yyyyMMddHHmmss" />
										   				<fmt:formatDate value="${dateString}" pattern="yyyy.MM.dd HH:mm:ss" />
										   			</span></div>
									  		   </div>
									  		   <div class="table-row opertable" style="display: table-row;">	
										   			<div class="table-cell" style="display: table-cell; width: 25%;"><span class="operEnd">
										   				<fmt:parseDate var="dateString" value="${operationVO.operEndTm }" pattern="yyyyMMddHHmmss" />
										   				<fmt:formatDate value="${dateString}" pattern="yyyy.MM.dd HH:mm:ss" />
													</span></div>
									  		   </div>
									  		</div>
								        </div>
								        </c:if>
								        <c:if test="${operationVO.operIng eq null }">
								        <div class="color" id="operDetail" style="height:100%">
											<div class="table" style="display: table;" >
										        <div class="table-row opertable" style="display: table-row;">
								           			<div class="table-cell" style="display: table-cell; width: 25%;">${operationVO.opRoomNo }</div>
								           		</div>	
								           	    <div class="table-row opertable" style="display: table-row;">	
										   			<div class="table-cell" style="display: table-cell; width: 25%;">공실</div>
										   		</div>	
										   		
									  		</div>
								        </div>
								        
								        </c:if>

								   		</div>
								   		
								   		</form>
									</c:forEach>
									</div>
								</div>
								<div class="white_box calout" id="myOperation" style="width : 35%;display :inline-block;position : absolute;margin-top : -20;padding-top:0;">
									<div class="box_header border_bottom_1px" style="margin-top : 50">
										<div class="main-title">
											<h3 class="mb_15">${loginUser.empNm}님의 오늘 수술리스트</h3>
										</div>
									</div>
									<table class="table dataTable no-footer" id="yeyakTb" role="grid" aria-describedby="yeyakTb_info" style="width: 673px;">
										<thead>
											<tr role="row">
												<th scope="col" class="text-center sorting" tabindex="0" aria-controls="yeyakTb" rowspan="1" colspan="1" aria-label="예약시각: activate to sort column ascending" style="width: 60px;">환자명</th>
												<th scope="col" class="text-center sorting" tabindex="0" aria-controls="yeyakTb" rowspan="1" colspan="1" aria-label="성함: activate to sort column ascending" style="width: 300px;">수술명</th>
												<th scope="col" class="text-center sorting_asc" tabindex="0" aria-controls="yeyakTb" rowspan="1" colspan="1" aria-label="생년월일: activate to sort column descending" style="width: 100px;" aria-sort="ascending">시작일시</th>
											</tr>
										</thead>
										<tbody>
											<tr class="odd" id="myOperationTr">
<!-- 												<td valign="top" colspan="3" class="dataTables_empty"></td> -->
											</tr>
										</tbody>
									</table>
								</div>
									<div class="box_header border_bottom_1px" style="margin-top : 50">
										<div class="main-title">
											<h3 class="mb_15">수술실 예약 차트</h3>
										</div>
									</div>
									<div id="chart" style="margin-bottom : 20;margin-top : 20">
										<div class="gfb-gantt-wrapper">
											<div class="gfb-gantt-lines-container" style="grid-template-columns: 90px repeat(24, 1fr)">
												<div class="gfb-gantt-sidebar-template"></div>
												<div class="gfb-gantt-line"></div>
												<div class="gfb-gantt-line"></div>
												<div class="gfb-gantt-line"></div>
												<div class="gfb-gantt-line"></div>
												<div class="gfb-gantt-line"></div>
												<div class="gfb-gantt-line"></div>
												<div class="gfb-gantt-line"></div>
												<div class="gfb-gantt-line"></div>
												<div class="gfb-gantt-line"></div>
												<div class="gfb-gantt-line"></div>
												<div class="gfb-gantt-line"></div>
												<div class="gfb-gantt-line"></div>
												<div class="gfb-gantt-line"></div>
												<div class="gfb-gantt-line"></div>
												<div class="gfb-gantt-line"></div>
												<div class="gfb-gantt-line"></div>
												<div class="gfb-gantt-line"></div>
												<div class="gfb-gantt-line"></div>
												<div class="gfb-gantt-line"></div>
												<div class="gfb-gantt-line"></div>
												<div class="gfb-gantt-line"></div>
												<div class="gfb-gantt-line"></div>
												<div class="gfb-gantt-line"></div>
												<div class="gfb-gantt-line"></div>
											</div>
											<div class="gfb-gantt-content">
												<div class="gfb-gantt-headers" style="grid-template-columns: 90px repeat(24, 1fr)">
												<div class="gfb-gantt-header-spacer"></div>
												<div class="gfb-gantt-header">0:00 AM</div>
												<div class="gfb-gantt-header">1:00 AM</div>
												<div class="gfb-gantt-header">2:00 AM</div>
												<div class="gfb-gantt-header">3:00 AM</div>
												<div class="gfb-gantt-header">4:00 AM</div>
												<div class="gfb-gantt-header">5:00 AM</div>
												<div class="gfb-gantt-header">6:00 AM</div>
												<div class="gfb-gantt-header">7:00 AM</div>
												<div class="gfb-gantt-header">8:00 AM</div>
												<div class="gfb-gantt-header">9:00 AM</div>
												<div class="gfb-gantt-header">10:00 AM</div>
												<div class="gfb-gantt-header">11:00 AM</div>
												<div class="gfb-gantt-header">12:00 AM</div>
												<div class="gfb-gantt-header">1:00 PM</div>
												<div class="gfb-gantt-header">2:00 PM</div>
												<div class="gfb-gantt-header">3:00 PM</div>
												<div class="gfb-gantt-header">4:00 PM</div>
												<div class="gfb-gantt-header">5:00 PM</div>
												<div class="gfb-gantt-header">6:00 PM</div>
												<div class="gfb-gantt-header">7:00 PM</div>
												<div class="gfb-gantt-header">8:00 PM</div>
												<div class="gfb-gantt-header">9:00 PM</div>
												<div class="gfb-gantt-header">10:00 PM</div>
												<div class="gfb-gantt-header">11:00 PM</div>
											</div>
											<div class="gfb-gantt-row-container" id="chart2">
											</div>
										</div>
									</div>
								</div>
								<button type="button" id="modalBtn" class="btn btn-outline-secondary" value="${waitPnt.pntCd}" data-toggle="modal" data-target="#myModal">수술 일정 등록</button>
								<button type="button" id="modifyBtn" class="btn btn-outline-primary" value="${waitPnt.pntCd}" data-toggle="modal" data-target="#modifyModal">수술 일정 수정</button>
								<button type="button" id="deleteBtn" class="btn btn-outline-danger" value="${waitPnt.pntCd}" data-toggle="modal" data-target="#deleteModal" onclick="location.href='/operation/operationRecord'">수술기록지 작성</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>

<script>
$(function(){
	var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
	var csrfHeader = $("meta[name=_csrf_header]").attr("content");
	var csrfToken = $("meta[name=_csrf]").attr("content");
	var data = {};
	data['empCd'] = '${loginUser.empCd}'
	myOperation = "";
	$.ajax({
		beforeSend : function(xhr){
			xhr.setRequestHeader(csrfHeader,csrfToken)
		},
		url : '/operation/myOperation',
		type : 'post',
		async : false,
		data : data,
		success : function(data){
			console.log("MYOPERATIONdata>>>>>>>>",data)
			if(data.length == 0){
				myOperation += '<td colspan="3" style="text-align:center;">오늘 수술예정인 환자가 존재하지 않습니다.</td>';
				$("#myOperationTr").append(myOperation);
			}
			$.each(data,function(i,v){
				if(data.length != 0){
				myOperation += '<td style="width: 60px;text-align:center;">'+v.pntNm+'</td>'
				myOperation += '<td style="width: 300px;text-align:center;">'+v.opcNm+'</td>'
				myOperation += '<td style="width: 100px;text-align:center;">'+v.operBgnTm+'</td>'
				
				$("#myOperationTr").append(myOperation);
				}
				
			})
		}
	})
})
</script>


<!-- ===================================================== 환자 리스트 모달 ====================================================================== -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true" style="display:none; z-index:1050">
  <div class="modal-dialog modal-lg modal-dialog-slideout" role="document">
    <div class="modal-content" style="width: 1200px; height: 900px;">
    
    <div class="modal" id="myModal2" aria-hidden="true" style="display: none; z-index: 1060;">
   	<div class="modal-dialog modal-lg">
         <div class="modal-content">
           <div class="modal-header">
             <h4 class="modal-title">환자 리스트</h4>
             <button type="button" id="myModalClose" class="btn btn-danger" data-dismiss="myModal2" aria-hidden="true">×</button>
           </div>

           <div class="container">
            	<div id="dataTable_filter" class="dataTables_filter">
					        <label>Search:
					        	<input type="search" id="search"name="keyWord" class="form-control form-control-sm" placeholder="" aria-controls="dataTable" />
					        </label>
					        <div style="display:inline;">
				        		<button id="searchBtn3"type="button" class="mb-2 btn btn-sm btn-info mr-1">검색</button>
				    	</div>
			    </div>
           </div>
           <div class="modal-body" >
		       <div class="table" style="display: table;">
			       <div class="table-row" style="display: table-row;">
	           			<div class="table-cell" style="display: table-cell; width: 10%;">이름</div>
			   			<div class="table-cell" style="display: table-cell; width: 20%;">주민번호</div>
			   			<div class="table-cell" style="display: table-cell; width: 10%;">성별</div>
			   			<div class="table-cell" style="display: table-cell; width: 20%;">전화번호</div>
			   	   		<div class="table-cell" style="display: table-cell; width: 40%;">주소</div>
		  		   </div>
		  		</div>
		  		<div class="table" style="display:table;" id="pntList">
		  		
		  		</div>
           </div>

           <div class="modal-footer">
           </div>
         </div>
       </div>
</div>
<!-- =================================================================================================================================================== -->

<!--================================================================ OPER TEAM LIST MODAL================================================================-->
    <div class="modal" id="myModal3" aria-hidden="true" style="display: none; z-index: 1070;">
   	<div class="modal-dialog modal-lg">
         <div class="modal-content">
           <div class="modal-header">
             <h4 class="modal-title">OPER-TEAM</h4>
             <button type="button" id="myModalClose2" class="btn btn-danger" data-dismiss="myModal3" aria-hidden="true">×</button>
           </div>

           <div class="container">
            	<div id="dataTable_filter" class="dataTables_filter">
					        <label>Search:
					        	<input type="search" id="oper_search"name="keyWord" class="form-control form-control-sm" placeholder="" aria-controls="dataTable" />
					        </label>
					        <div style="display:inline;">
				        		<button id="searchBtn4"type="button" class="mb-2 btn btn-sm btn-info mr-1" onclick="getOperTeamList(1, 6);">검색</button>
				    	</div>
			    </div>
           </div>
           <div class="modal-body " >
		       <div class="table" style="display: table;" >
			       <div class="table-row" style="display: table-row;">
	           			<div class="table-cell" style="display: table-cell; width: 25%;">이름</div>
			   			<div class="table-cell" style="display: table-cell; width: 25%;">분류</div>
			   			<div class="table-cell" style="display: table-cell; width: 25%;">부서</div>
			   			<div class="table-cell" style="display: table-cell; width: 25%;">과</div>
		  		   </div>
		  		</div>
		  		<div class="table" style="display:table;" id="operTeamList">
		  		
		  		</div>
           </div>
			
           <div class="modal-footer">
           	 <div class="dataTables_paginate paging_simple_numbers" id="operteam_pagenation">
           	 	<a class="paginate_button previous disabled" aria-controls="DataTables_Table_0" data-dt-idx="0" tabindex="0" id="DataTables_Table_0_previous">
           	 		<i class="ti-arrow-left"></i>
           	 	</a>
           	 	<span><a class="paginate_button current" aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0">1</a></span>
           	 	<a class="paginate_button next disabled" aria-controls="DataTables_Table_0" data-dt-idx="2" tabindex="0" id="DataTables_Table_0_next">
           	 		<i class="ti-arrow-right"></i>
           	 	</a>
           	 </div>
           </div>
         </div>
       </div>
</div>
<script>
function fn_reservBtn(){
	$("#myModal4").hide();
// 	$("#selectRoomNo").get(0).selectedIndex = 0;
// 	$("#selectSgCode").get(0).selectedIndex = 0;
// 	$("#dateTimeStart").val("");
// 	$("#dateTimeEnd").val("");
// 	$(".restbl").remove();
}
</script>
<!--========================================================================수술법명, 예약 모달=======================================================================-->

<div class="modal" id="myModal4" aria-hidden="true" style="display: none; z-index: 1070;">
   	<div class="modal-dialog modal-lg">
         <div class="modal-content" id="reservModal">
           <div class="modal-header">
             <h4 class="modal-title">OPERATING ROOM RESERVATION</h4>
             <button type="button" id="myModalClose3" class="btn btn-danger" data-dismiss="myModal4" aria-hidden="true">×</button>
           </div>

           <div class="container">
            	
           </div> 
           <div class="modal-body reservation" style="background-color : #B2EBF4; min-height : 200px" >
<!-- 		       <div class="table" style="display: table;" id="pntList"> -->
<!-- 			       <div class="table-row" style="display: table-row;"> -->
<!-- 	           			<div class="table-cell" style="display: table-cell; width: 10%;" onclick="opRoom_submit()">수술방</div> -->
						

						
			   			<select class="nice_Select w-30" id="selectRoomNo" style="display: none;">
						<option data-display="수술방 검색" value="0" >Nothing</option>
						</select>
						
						<select class="default_sel w-30" id="selectTreatCode" style="display: none;">
						<option data-display="진료 목록">Nothing</option>
						</select>
						
						<select class="default_sel w-30" id="selectDis" style="display: none;">
						<option data-display="병명">Nothing</option>
						</select>
						
						<select class="default_sel w-30" id="selectSgCode" style="display: none;">
						<option data-display="수술법명 검색">Nothing</option>
						</select>
						
						<div style="display:inline-block;float:right">
							<label>시작일시</label>
							<input type="datetime-local" id="dateTimeStart">
							<br>
							<label>종료일시</label>
							<input type="datetime-local" id="dateTimeEnd">
						</div>
						<div class="table" style="display: table;">
							<div class="table-row" style="display: table-row;">
								<div class="table-cell" style="display: table-cell; width: 10%;">수술방</div>
								<div class="table-cell" style="display: table-cell; width: 10%;">진료명</div>
								<div class="table-cell" style="display: table-cell; width: 20%;">병명</div>
			   					<div class="table-cell" style="display: table-cell; width: 20%;">수술법명</div>
			   					<div class="table-cell" style="display: table-cell; width: 20%;">시작일시</div>
			   	   				<div class="table-cell" style="display: table-cell; width: 20%;">종료일시</div>
			  		   	    </div>
			  		   	</div>
			  		   	<div class="table" style="display:table;" id="reserv">
			  		   	
			  		   	</div>
           </div>

           <div class="modal-footer">
           	<button type="button" class="btn btn-secondary" id="reservBtn" onclick="fn_reservBtn()" data-dismiss="myModal4" aria-hidden="true" style="float: right;">확인</button>
           </div>
         </div>
       </div>
</div>
<!--===============================================================================================================================================================-->
<script>
function getOperTeamList(currentPage, size){
	console.log('getOperTeamList start');
	currentPage = currentPage *1;
	var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
	var csrfHeader = $("meta[name=_csrf_header]").attr("content");
	var csrfToken = $("meta[name=_csrf]").attr("content");
	var data = {};
	
	console.log("기본data",data)
	data[csrfParameter]=csrfToken;
	data['currentPage']=currentPage;
	data['size']=size;
	data['keyWord']=$('#oper_search').val();
	console.log("성공전 데이터",data);
	$.ajax({
		type: 'post',
		dataType: 'json',
		url: '/operation/operTeam2',
		data: data,
		success: function(data){
			console.log(data);
			var operTeamList ="";
			var totalCount = Object.keys(data).length;
			var totalPage = Math.ceil(totalCount/size);
			$.each(data,function(i,v){
				if((currentPage * size - size) <= i && (currentPage * size) > i){
					operTeamList +='<div class="table-row opttbl" id="opt_tbl_row'+i+'" style="display: table-row;" onclick="optSubmit(\'' + v.empCd + '\')">';
					operTeamList +='<input type="hidden" id="operTeamEmpCd" value='+v.empCd+'>'
					operTeamList +='<div class="table-cell table-cell4" id="tbl_cell" style="display: table-cell; width: 10%;">'+v.empNm+'</div>';
					operTeamList +='<div class="table-cell table-cell4" id="tbl_cell" style="display: table-cell; width: 10%;">'+ v.position+'</div>';
					operTeamList +='<div class="table-cell table-cell4" id="tbl_cell" style="display: table-cell; width: 20%;">'+v.deptNm+'</div>';
					operTeamList +='<div class="table-cell table-cell4" id="tbl_cell" style="display: table-cell; width: 10%;">'+v.secNm+'</div>';
					operTeamList +='</div>';	
				}
			});
// 			$('.table-cell4').empty();
			$('#operTeamList').append(operTeamList);
			var pagenation = '';
			pagenation += '<a class="paginate_button previous '+(1 == currentPage ? 'disabled' : '')+'" '+(1 == currentPage ? '' : 'onclick="getOperTeamList(\''+(currentPage - 1)+'\', \''+size+'\');"')+ ' id="DataTables_Table_0_previous">';
			pagenation += '<i class="ti-arrow-left"></i>';
			pagenation += '</a>';
			for(var i = 1; i <= totalPage; i++){
				pagenation += '<span><a class="paginate_button '+(i == currentPage ? 'current' : '')+'" href="javascript:void(0);" onclick="getOperTeamList(\''+i+'\', \''+size+'\');" tabindex="0">'+i+'</a></span>';
				console.log(totalPage)
			}
			pagenation += '<a class="paginate_button next '+(totalPage == currentPage ? 'disabled' : '')+'" '+(totalPage == currentPage ? '' : 'onclick="getOperTeamList(\''+(currentPage + 1)+'\', \''+size+'\');"')+ ' id="DataTables_Table_0_next">';
			pagenation += '<i class="ti-arrow-right"></i>';
			pagenation += '</a>';
			$('#operteam_pagenation').html(pagenation);
		}
	});
}
</script>
<script>
function optSubmit(t){
	$("input[name='empCd']").attr("value",$("input[name='empCd']").val() + "," + t);
	var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
	var csrfHeader = $("meta[name=_csrf_header]").attr("content");
	var csrfToken = $("meta[name=_csrf]").attr("content");
    var data = {};
    console.log("empCd",t)
    data['empCd']=t;
    console.log(data['empCd'])
    data[csrfParameter]=csrfToken;
    var writeOptInfo ="";
    
//	     $("#table-cell3").remove();
    $.ajax({
    	type:'post',
    	url : '/operation/writeOperTeam',
    	dataType : 'json',
    	data : data,
    	async : false,
    	success : function(data){
    		console.log(data)
    		console.log(data.empNm)
    		console.log(data.position)
    		console.log(data.deptNm)
    		console.log(data.secNm)
    		
    		writeOptInfo += '<div class="table-row" id="wopttbl_row" style="display: table-row;" onclick="closeOptList()">' 
    		writeOptInfo += '<input type="hidden" id="optPntCd" value='+data.empCd+'>'
    		writeOptInfo +='<div class="table-cell table-cell4" id="tbl_cell" style="display: table-cell; width: 25%;">'+ data.empNm+'</div>';
    		writeOptInfo +='<div class="table-cell table-cell4" id="tbl_cell" style="display: table-cell; width: 25%;">'+data.position+'</div>';
    		writeOptInfo +='<div class="table-cell table-cell4" id="tbl_cell" style="display: table-cell; width: 25%;">'+data.deptNm+'</div>';
    		writeOptInfo +='<div class="table-cell table-cell4" id="tbl_cell" style="display: table-cell; width: 25%;">'+data.secNm+'</div>';
    		
    		writeOptInfo +='</div>';
//     		$('.table-cell4').empty();
    		$("#writeOptInfo").append(writeOptInfo);
    	}
    })		
    		$("#myModal3").hide();
     
}	
</script>


<!-- 만드는 중인 모달 -->

    
      <div class="modal-header">
        <div style="float: left;"><h5 class="modal-title align-right" id="exampleModalLabel" style="font-weight: bolder; font-size: 20px;">수술 등록</h5></div>
		
      </div>
      <div class="modal-body">
      
        <div class="alert alert-warning" role="alert" style="min-height: 175px;">
	        <div class="table" style="display: table;" id="operCd">
	        	<div class="table-row" style="display: table-row;">
	        		<div class="table-cell" style="display: table-cell; width: 100%; text-align:left">OPERATION NO.&nbsp;<span class="operCd title" id="operCdTitle"></span><a class="btn btn-outline-danger" id="searchBtn1" style="float: right;" role="button" data-toggle="submodal" >환자 검색</a></div>
	        	</div>
	        </div>
        	
        	<div class="table" style="display: table;">
			       <div class="table-row" style="display: table-row;">
	           			<div class="table-cell" style="display: table-cell; width: 10%;">이름</div>
			   			<div class="table-cell" style="display: table-cell; width: 20%;">주민번호</div>
			   			<div class="table-cell" style="display: table-cell; width: 10%;">성별</div>
			   			<div class="table-cell" style="display: table-cell; width: 20%;">전화번호</div>
			   	   		<div class="table-cell" style="display: table-cell; width: 40%;">주소</div>
		  		   </div>
		  	</div>	   
		  		   <div class="table" style="display:table" id="writePntInfo">
		  		   
		  		   </div>
		  		

		</div>
		<div class="alert alert-success" style="min-height: 250px;" role="alert">
			 <div class="table" style="display: table;" id="operCd">
	        	<div class="table-row" style="display: table-row;">
	        		<div class="table-cell" style="display: table-cell; width: 100%; text-align:left">OPERATOR <a class="btn btn-outline-danger"
	        		id="searchBtn2" style="float: right;" role="button" data-toggle="submodal" 
	        		>수술진 검색</a></div>
	        	</div>
	        </div>
			<!-- 의료진 시작 -->
				<div class="table" style="display: table;">
			       <div class="table-row" style="display: table-row;">
			   			<div class="table-cell" style="display: table-cell; width: 25%;">이름</div>
			   			<div class="table-cell" style="display: table-cell; width: 25%;">분류</div>
	           			<div class="table-cell" style="display: table-cell; width: 25%;">부서</div>
			   			<div class="table-cell" style="display: table-cell; width: 25%;">과</div>
		  		   </div>
		  		</div>
		  		<div class="table" style="display: table;" id="writeOptInfo">
		  		
		  		</div>
			<!-- 예약내역 끝 -->
		</div>
		<div class="alert alert-primary" role="alert" style="min-height: 300px;">
			 <div class="table" style="display: table;" id="operCd">
	        	<div class="table-row" style="display: table-row;">
	        		<div class="table-cell" style="display: table-cell; width: 100%; text-align:left">OPERATING ROOM RESERVATION<a class="btn btn-outline-danger"
	        		id="searchBtn5" style="float: right;" role="button" data-toggle="submodal" 
	        		>입력하기</a></div>
	        	</div>
	        </div>
			<!-- 의료진 시작 -->
				<div class="table" style="display: table;">
			       <div class="table-row" style="display: table-row;">
			   			<div class="table-cell" style="display: table-cell; width: 10%;">수술방</div>
			   			<div class="table-cell" style="display: table-cell; width: 10%;">진료명</div>
			   			<div class="table-cell" style="display: table-cell; width: 20%;">병명</div>
			   			<div class="table-cell" style="display: table-cell; width: 25%;">수술법명</div>
	           			<div class="table-cell" style="display: table-cell; width: 20%;">시작일시</div>
			   			<div class="table-cell" style="display: table-cell; width: 25%;">종료일시</div>
		  		   </div>
		  		</div>
		  		<div class="table" style="display: table;" id="writeReservation">
		  		
		  		</div>
			<!-- 예약내역 끝 -->
		</div>
		
<!-- 		<input type="text" name="operCd" value="" placeholder="operCd" /> -->
<!-- 		<input type="text" name="treatCd" value="" placeholder="treatCd" /> -->
<!-- 		<input type="text" name="empCd" value="" placeholder="empCd" /> -->
<!-- 		<input type="text" name="pntCd" value="" placeholder="pntCd" /> -->
<!-- 		<input type="text" name="opRoomNo" value="" placeholder="opRoomNo" /> -->
<!-- 		<input type="text" name="operYmd" value="" placeholder="operYmd" /> -->
<!-- 		<input type="text" name="operBgnTm" value="" placeholder="operBgnTm" /> -->
<!-- 		<input type="text" name="operEndTm" value="" placeholder="operEndTm" /> -->
      </div>
      <div class="modal-footer" style="height : 200px;background-color: white" >
        <button type="button" class="btn btn-primary" data-dismiss="modal" style="float: right;" id="modalSubmit" onclick="fn_modalSubmit()">확인</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal" style="float: right;"id="modalClose" onclick="fn_modalClose()">닫기</button>
      </div>
    </div>
  </div>
</div>
<script>
function fn_modalSubmit(){
	var operationArray = [];
	var operationArr = {};
	var operProcArray = [];
	var operProcArr = {};
	var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
	var csrfHeader = $("meta[name=_csrf_header]").attr("content");
	var csrfToken = $("meta[name=_csrf]").attr("content");
    
	
	var operCd = $("#operCdTitle").text();
	var pntNm = $("#infotbl_row").children().eq(0).text();
	var pntCd = $("#operPntCd").val();
	var treatCd = "";
	treatCd = $(".restbl").children().eq(1).text();
	treatCd = treatCd.substring(1,9);	

		
	var opcNm = "";
	
	
	var empNm =$("#wopttbl_row").children().eq(0).text()
	var empNm = "";
	var empCd = $("#optPntCd").val();
	var opRoomNo = $("#writeReservation").children().eq(i).children().eq(0).text()
	opRoomNo= $(".restbl").children().eq(0).text();
	opRoomNo = Number(opRoomNo);
	
	
	var operYmd = "";
	var operYmd=$(".restbl").children().eq(4).text();
		operYmd = operYmd.substring(0,10)
	
	var regex = / /gi;
	
	var operBgnTm = "";
	operBgnTm=$(".restbl").children().eq(4).text();
	operBgnTm = operBgnTm.replace("-","");
	operBgnTm = operBgnTm.replace("-","");
	operBgnTm = operBgnTm.replace(regex,"");
	operBgnTm = operBgnTm.replace(":","")+"00";
	
	
// 	$("input[name='operBgnTm']").attr("value",operBgnTm);
		
		
	var operEndTm = "";
	operEndTm=$(".restbl").children().eq(5).text();
	operEndTm= operEndTm.replace("-","");
	operEndTm= operEndTm.replace("-","");
	operEndTm= operEndTm.replace(regex,"");
	operEndTm= operEndTm.replace(":","")+"00";
	
// 	var digCls = $("#selectDis").val();
	var digCls = "";
	data = {};
	data['operCd'] = operCd;
	data['pntCd'] = pntCd;
	data['treatCd'] = treatCd;
	data['empCd'] = empCd;
	data['opRoomNo'] = opRoomNo;
	data['operYmd'] = operYmd;
	data['operBgnTm'] = operBgnTm;
	data['operEndTm'] = operEndTm;
	console.log("data>>>>>>>>>>>>>>>>>",data)

	$.ajax({
		beforeSend : function(xhr){
			xhr.setRequestHeader(csrfHeader,csrfToken)
		},
		type:'post',
    	url : '/operation/insertOperation',
    	data : data,
    	async : false,
    	success : function(data){
    		console.log("data : ", data);
    		console.log("성공했니??")
    	},
		error: function(jqXHR,textStatus,errorThrown) {
			// fail handle
			alert("ajax처리안됨")
		}
	})
	for(var i = 0; i < $("#writeReservation").children().length; i++){
		
		for(var j =0; j < $("#writeReservation").children().eq(i).children().length; j++){
			opcNm =  $("#writeReservation").children().eq(i).children().eq(3).text()
		}
	 operProcArr = {
			"operCd" : operCd,
			"opcNm":opcNm,
		}
			operProcArray.push(operProcArr)
	}
	$.ajax({
		beforeSend : function(xhr){
			xhr.setRequestHeader(csrfHeader,csrfToken)
		},
		type:'post',
		url : '/operation/insertOperProc',
		accept: "application/json",
    	contentType: "application/json; charset=utf-8",	
    	dataType : 'json',
    	data : JSON.stringify({'param2':operProcArray}),
		async : false,
		success : function(data){
			console.log("성공했어?? proc넣기??")
		}
	})
	var operTeamArray = [];
	var operTeamArr = {};
	for(var i =0; i < $("#writeOptInfo").children().length; i++){
		empCd = $("#writeOptInfo").children().eq(i).children().eq(0).val();
		operTeamArr = {
				"empCd" : empCd,
				"operCd" : operCd
		}
		operTeamArray.push(operTeamArr);
	}
	$.ajax({
		beforeSend : function(xhr){
			xhr.setRequestHeader(csrfHeader,csrfToken)
		},
		type:'post',
		url : '/operation/insertOperTeam',
		accept: "application/json",
    	contentType: "application/json; charset=utf-8",	
    	dataType : 'json',
    	data : JSON.stringify({'param3':operTeamArray}),
		async : false,
		success : function(data){
			console.log("성공했어?? Team넣기??")
		}
	})
	
}
function fn_modalClose(){
	$("#infotbl_row").empty();
}
</script>
<script>
$("#modifyBtn").on("click",function(){
	var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
	var csrfHeader = $("meta[name=_csrf_header]").attr("content");
	var csrfToken = $("meta[name=_csrf]").attr("content");
	var data ={};
	data['empNm'] = '${loginUser.empNm}'
	data[csrfParameter]=csrfToken;
	$("#tbody").empty();
	var operationList="";
	$.ajax({
		type:'post',
		url : '/operation/operationList',
		dataType:'json',
		data : data,
		async : false,
		success : function(data){
			$.each(data,function(i,v){
// 				operationList += '<div class="table-row" style="display: table-row;">';
				operationList +='<div class="table-cell" style="display: table-cell; width: 10%;"><input class="modihide deletehide" type="radio" id="operRadio'+i+'" name="operationList" value="'+v.operCd+'" hidden="true"></div>';
				operationList +='<div class="table-cell opRoomNo" style="display: table-cell; width: 15%;">'+v.opRoomNo+'</div>';
				operationList +='<div class="table-cell pntNm" style="display: table-cell; width: 10%;">'+v.pntNm+'</div>';
				operationList +='<div class="table-cell opcNm" style="display: table-cell; width: 25%;">'+v.opcNm+'</div>';
				operationList +='<div class="table-cell startTm" style="display: table-cell; width: 20%;">'+v.operBgnTm+'</div>';	
				operationList +='<div class="table-cell endTm" style="display: table-cell; width: 20%;">'+v.operEndTm+'</div>';	
// 				operationList +='</div>';
			})
			$("#tbody").append(operationList);
			
		}
	})
})
</script>
<div class="modal" id="modifyModal" aria-hidden="true" style="display: none; z-index: 1070;">
   	<div class="modal-dialog modal-lg">
         <div class="modal-content" id="modifyModal">
           <div class="modal-header">
             <h4 class="modal-title">${loginUser.empNm }님의 수술 일정</h4>
             <button type="button" id="modifyModalCloseBtn" class="btn btn-danger" data-dismiss="modifymyModal"  aria-hidden="true">×</button>
           </div>

           <div class="container">
            	
           </div> 
           <div class="modal-body modifyReservation" style="background-color : #B2EBF4; min-height : 200px" >
<!-- 		       <div class="table" style="display: table;" id="pntList"> -->
<!-- 			       <div class="table-row" style="display: table-row;"> -->
<!-- 	           			<div class="table-cell" style="display: table-cell; width: 10%;" onclick="opRoom_submit()">수술방</div> -->
						

						<div id="select_group_div" style="display: flex; width: fit-content; float: left;">
			   			<select class="nice_Select w-30" id="selectRoomNo2" style="display: none;">
						<option data-display="수술방 검색" id="notSelectedRoomNo" value="0">Nothing</option>
						</select>
						
						<select class="default_sel w-30" id="selectSgCode2" style="display: none;">
						<option data-display="수술법명 검색" class="notSelectedSgCode" value="0">Nothing</option>
						</select>
						</div>
						
						<div class="modihide" style="display:inline-block;float:right" hidden="true">
							<label>시작일시</label>
							<input type="datetime-local" id="dateTimeStart2" value="">
							<br>
							<label>종료일시</label>
							<input type="datetime-local" id="dateTimeEnd2" value="">
						</div>
						<div class="table" style="display: table;" id="operationList">
							<div class="table-row" style="display: table-row;">
								<div class="table-cell" style="display: table-cell; width: 10%;"></div>
								<div class="table-cell" style="display: table-cell; width: 10%;">수술방</div>
								<div class="table-cell" style="display: table-cell; width: 10%;">환자 이름</div>
			   					<div class="table-cell" style="display: table-cell; width: 20%;">수술법 명</div>
			   					<div class="table-cell" style="display: table-cell; width: 30%;">시작일시</div>
			   	   				<div class="table-cell" style="display: table-cell; width: 30%;">종료일시</div>
			  		   	    </div>
			  		   	    <div class="table-row" style="display: table-row;" id="tbody">
			  		   	    </div>
			  		   	</div>
<!-- 		  		</div> -->
           </div>

           <div class="modal-footer">
           	<button type="button" class="btn btn-primary" id="modifyOperation" data-dismiss="modifyModal" aria-hidden="true" style="float: right;">수정</button>
           	<button type="button" class="btn btn-primary" id="deleteOperation" data-dismiss="modifyModal" aria-hidden="true" style="float: right;">삭제</button>
           	<button type="button" class="btn btn-primary" id="modifyOperation_submit" data-dismiss="modifyModal" aria-hidden="true" style="float: right; display:none">확인</button>
           	<button type="button" class="btn btn-primary" id="deleteOperation_submit" data-dismiss="modifyModal" aria-hidden="true" style="float: right; display:none" onclick="fn_operDelete()">확인</button>
           </div>
         </div>
       </div>
</div>
<script type="text/javascript">
function getOperRoom2(){
	console.log("getOperRoom");
	var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
	var csrfHeader = $("meta[name=_csrf_header]").attr("content");
	var csrfToken = $("meta[name=_csrf]").attr("content");
    var data = {};
    var selectOperRoom2="";
    let operatorModal = document.querySelector(".operator");
    data[csrfParameter]=csrfToken;
	$.ajax({
		type : 'post',
		url : '/operation/selectOperRoom',
		dataType : 'json',
		async : false,
		data : data,
		success : function(data){
			console.log(data)
// 			console.log(operatorModal)
			$.each(data,function(i,v){
				selectOperRoom2 += '<option value="'+v.opRoomNo+'">'+v.opRoomNo+'</option>';
			});
			$("#selectRoomNo2").append(selectOperRoom2);
			$("#selectRoomNo2").niceSelect('update');
// 			$(".nice-select").css("display","inline-block");
// 			$(".modifyReservation").children('div:eq(0)').css("position","absolute");
			$('#select_group_div').children('div:eq(0)').attr("id","RoomNoDiv2");
			$("#RoomNoDiv2").css("margin-right","20px");
			$("#RoomNoDiv2").children('span').attr("id","RoomNoSpan2");
			$("#selectRoomNo2").on('change', function(){
				room_change($(this));
			});
			console.log("RoomNoDiv2",$("#RoomNoDiv2").children('span').text())
		}
	})
}
function room_change(v){
	console.log('changed!!');
	if($('input[name="operationList"]:checked').length == 0){
		alert('선택하세요');
		$("#selectRoomNo2").val("0")
		$("#selectRoomNo2").niceSelect('update');
		$('#select_group_div').children('div:eq(0)').attr("id","RoomNoDiv2");
		$("#RoomNoDiv2").css("margin-right","20px");
	}else{
		$('input[name="operationList"]:checked').closest('.table-row').find('.opRoomNo').text($(v).val());
	}
}
function sgCode_change(v){
	console.log('changed!!!!!')
	if($('input[name="operationList"]:checked').length == 0){
		alert("선택하세용");
		$("#selectSgCode2").val("0");
		$("#selectSgCode2").niceSelect('update');
	}
	else{
		$('input[name="operationList"]:checked').closest('.table-row').find('.opcNm').text($(v).val());
	}
}
$("#dateTimeStart2").on("change",function(){
	if($('input[name="operationList"]:checked').length == 0){
		swal("알림","수술 일정을 선택해주세요","warning");
		$("#dateTimeStart2").val(0);
		
	}else{
		var dtStart = $("#dateTimeStart2").val();
		dtStart = dtStart.replace("T"," ");
		dtStart = dtStart+":00"
		console.log(dtStart);
		$('input[name="operationList"]:checked').closest('.table-row').find('.startTm').text(dtStart);
	}

})
$("#dateTimeEnd2").on("change",function(){
	if($('input[name="operationList"]:checked').length == 0){
		swal("알림","수술 일정을 선택해주세요","warning")
		$("#dateTimeEnd2").val(0);
// 		$("#dateTimeEnd2").niceSelect('update');
	}
	else{
		var dtEnd = $("#dateTimeEnd2").val();
		dtEnd = dtEnd.replace("T"," ");
		dtEnd = dtEnd+":00"
		console.log(dtEnd);
		$('input[name="operationList"]:checked').closest('.table-row').find('.endTm').text(dtEnd);
	}
})
</script>
<script>
function getSgCode2(){
	console.log("getSgCode");
	var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
	var csrfHeader = $("meta[name=_csrf_header]").attr("content");
	var csrfToken = $("meta[name=_csrf]").attr("content");
    var data = {};
    var selectSgCode2="";
    
    let childFirst = document.querySelector(".reservation");
    data[csrfParameter]=csrfToken;
	$.ajax({
		type : 'post',
		url : '/operation/selectSgCode',
		dataType : 'json',
		async : false,
		data : data,
		success : function(data){
			console.log("수가코드 데이터 >>>>",data);
			
			$.each(data,function(i,v){
				selectSgCode2 += '<option value="'+v.sgNm+'">'+v.sgNm+'</option>';
			});
			$("#selectSgCode2").append(selectSgCode2);
			$("#selectSgCode2").niceSelect('update');
			$(".nice-select").css("display","inline-block");
// 			console.log($(".reservation").children("#selectSgCode"));
			$(".modifyReservation").children('div:eq(3)').css("position","absolute");
			$(".modifyReservation").children('div:eq(3)').css("left","350px");
			$('#select_group_div').children('div:eq(3)').attr("id","sgCodeDiv2");
			$("#sgCodeDiv2").children('span').attr("id","sgCodeSpan2");
// 			$("#sgCodeSpan").attr("onchange","change_SgCode()");
			$("#selectSgCode2").on('change', function(){
				sgCode_change($(this));
			});
			
		}
	})
}
</script>
<script>
	$(document).on("click","#modifyOperation_submit",function(){
		var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
		var csrfHeader = $("meta[name=_csrf_header]").attr("content");
		var csrfToken = $("meta[name=_csrf]").attr("content");
	    var data = {};
	    var opRoomNo=$(".opRoomNo").text();
	    var operYmd=$(".startTm").text();
	    	operYmd = operYmd.substring(0,10);
		var regex = / /gi;
	    var operBgnTm = $(".startTm").text();
	    	operBgnTm = operBgnTm.replaceAll("-","");
	    	operBgnTm = operBgnTm.replaceAll(":","");
	    	operBgnTm = operBgnTm.replaceAll(".","");
	    	operBgnTm = operBgnTm.replaceAll(regex,"");
			operBgnTm = operBgnTm.substring(0,14);
	    var operEndTm=$(".endTm").text();
		    operEndTm = operEndTm.replaceAll("-","");
		    operEndTm = operEndTm.replaceAll(":","");
		    operEndTm = operEndTm.replaceAll(".","");
		    operEndTm = operEndTm.replaceAll(regex,"");
		    operEndTm = operEndTm.substring(0,14);
		var operCd = $('input[name="operationList"]:checked').val();
	    var sgNm=$(".opcNm").text();
	    data['opRoomNo']=opRoomNo;
	    data['operYmd']=operYmd;
	    data['operBgnTm']=operBgnTm;
	    data['operEndTm']=operEndTm;
	    data['operCd']=operCd;
	    data['sgNm']=sgNm;
	    data[csrfParameter]=csrfToken;
		console.log("data",data)
		
	    $.ajax({
	    	type : 'post',
			url : '/operation/updateOperation',
			dataType : 'json',
			async : false,
			data : data,
			success : function(data){
				swal("성공","업데이트 성공","success")
				$("#modifyModal").hide()
				$(".modal-backdrop").hide()
				location.reload();
			}
	    	
	    })
	     
	})
</script>
<script>
function fn_operDelete(){
	var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
	var csrfHeader = $("meta[name=_csrf_header]").attr("content");
	var csrfToken = $("meta[name=_csrf]").attr("content");
    var data = {};
    var operCd = $('input[name="operationList"]:checked').val();
    data['operCd'] = operCd;
    data[csrfParameter]=csrfToken;
	if($('input[name="operationList"]:checked').length == 0){
		swal("알림","수술 일정을 선택해주세요","warning")
	}
	else{
		$.ajax({
			
		    type : 'post',
			url : '/operation/deleteOperation',
			dataType : 'json',
			async : false,
			data : data,
			success : function(data){
				swal("성공","삭제 성공","success");
				$("#myModal").hide();
				location.reload();
			}
			
		})
	}
}

</script>























